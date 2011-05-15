unit UKernel_SysUtils;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls, ACBrValidador, ACBrBase,
  Variants, DBClient;

  {Função para facilitar a instanciamento de um form }
  procedure Kernel_AbreForm (aClasseForm : TComponentClass; aForm: TForm);

  function Kernel_Gerapercentual(valor:real;Percent:Real):real;
  {Mostra a porcentagem de um valor}
  function Kernel_GeraValor(valor:real; Percent:Real):real;

  Procedure Kernel_Load_Imagem_abertura;
  procedure Kernel_MostraFotoImage(ImagemPrincipal, ImagemAlternativa: string; Image: TImage);

  // Funcoes de Calculos e Formatacoes de Valores
  function Kernel_CalculaMargem(Venda, Compra :Currency): Currency;
  Function Kernel_CalculaPrVenda(Compra, Margem: string): Currency;

  // Mostra a Versao do Sistema
  function Kernel_GetVersaoArq: string;
  // Valida Documentos usando acbrvalidador
  function Kernel_ValidaCampos(Objeto: string; WinControl: TWinControl;
   TipoDoc: TACBrValTipoDocto ): Boolean;

  Function Kernel_RetiraPonto(Valor: double):double;
  
  // Corrigindo o problema do foco não aparecer no componente
  procedure Kernel_SetFocusCtrl(Ctrl: TWinControl; ActiveCtrl: TWinControl);

  //Funcoes de auditoria
  procedure Kernel_RetornaLog(DeltaDs: TCustomClientDataSet; UpdateKing: TUpdateKind; Tabela: string);

  procedure Kernel_CriaAguarde(str_mensagem: string);
  procedure Kernel_DestroyAguarde();

  procedure Kernel_InicializaVariaveis;
  {Carega propriedades do Projeto do xml}
  procedure Kernel_CaregaPropriedades;

  {Pedi confirma}
  function Kernel_Confirmacao_acao(str_msn_acao: string; str_acao: char):Boolean;
  {Coloca ou tirar a barra no caminho da aplicação}
  function Kernel_DiretorioBarras(Folder: string): string;
  {Retorna o caminho da aplicação atual}
  Function kernel_Diretorio: string;
  {retona serador de texto. pula uma linha com alinhamento}
  function Kernel_SKIP(pLinhas: Integer = 1): String;

  function GetFileList(const Path: string): TStringList;

  function Kernel_Copia_Arquivos_Mascara(cFrom, cTo, Mask: string): Boolean;
  function Kernel_Copia_Arquivos(cFrom, cTo: string): Boolean;

implementation

uses UfrmKernel_Splash, UKernel_Mensagem, UfrmKernel_Mensagem,  UKernel_Registry,
  UKernel_DB, UdmPrincipal, uKernel_Sistema,  UKernel_VariaveisPublic,
  csDXFunctions, UKernel_Exception, UfrmKernel_Aguarde;

function GetFileList(const Path: string): TStringList;
var
   I: Integer;
   SearchRec: TSearchRec;
begin
   Result := TStringList.Create;
   try
     I := FindFirst(Path, 0, SearchRec);
     while I = 0 do
     begin
       Result.Add(SearchRec.Name);  // alterar esta linha
       I := FindNext(SearchRec);
     end;
   except
     Result.Free;
     raise;
   end;
end;

function Kernel_Copia_Arquivos(cFrom, cTo: string): Boolean;
var
  SizeBloco, Size: Longint;
  FileFrom, FileTo: file;
  Buffer: Pointer;

  function FRead(var Reg): Boolean;
  var
    Buff: Byte absolute Reg;
  begin
    {$I-}BlockRead(FileFrom, Buff, SizeBloco); {$I+}
    Result := IOResult = 0;
  end;

  function FWrite(var Reg): Boolean;
  var
    Buff: Byte absolute Reg;
  begin
    {$I-}BlockWrite(FileTo, Buff, SizeBloco); {$I+}
    Result := IOResult = 0;
  end;

begin
  Result := False;
  AssignFile(FileFrom, cFrom);
  AssignFile(FileTo, cTo);
  {$I-}Reset(FileFrom, 1); {$I+}
  if IOResult <> 0 then
    Exit;
  {$I-}Rewrite(FileTo, 1); {$I+}
  if IOResult <> 0 then
  begin
    {$I-}CloseFile(FileFrom); {$I+}
    Exit;
  end;
  GetMem(Buffer, 32767);
  Size := FileSize(FileFrom);
  SizeBloco := 32767;
  while Size > 0 do
  begin
    if Size < 32767 then
      SizeBloco := Size;
    if not FRead(Buffer^) then
      Break;
    if not FWrite(Buffer^) then
      Break;
    Size := Size - SizeBloco;
  end;
  Result := Size = 0;
  {$I-}CloseFile(FileFrom); {$I+}
  if IOResult <> 0 then
    Result := False;
  {$I-}CloseFile(FileTo); {$I+}
  if IOResult <> 0 then
    Result := False;
  FreeMem(Buffer, 32767);
  if not Result then
    DeleteFile(PAnsiChar(cTo));
end;

function Kernel_Copia_Arquivos_Mascara(cFrom, cTo, Mask: string): Boolean;
var
  DirInfo: TSearchRec;
begin
  Result := True;
  if FindFirst(Kernel_DiretorioBarras(cFrom) + Mask, faArchive, DirInfo) = 0 then
    repeat
      Result := Kernel_Copia_Arquivos(Kernel_DiretorioBarras(cFrom) + DirInfo.Name, Kernel_DiretorioBarras(cTo) + DirInfo.Name );
    until FindNext(DirInfo) <> 0;
end;

function Kernel_SKIP(pLinhas: Integer = 1): String;
var i: Integer;
begin
   Result := '';
   for i := 1 to pLinhas do
      Result := Result + #13#10;
end;

Function kernel_Diretorio: string;
Begin
  result := Kernel_DiretorioBarras(ExtractFilePath(Application.ExeName));
End;

function Kernel_DiretorioBarras(Folder: string): string;
begin
  if Trim(Folder) <> '' then
    // Se o diretorio nao tiver uma barra no final coloca
    if Folder[Length(Folder)] <> '\' then
      Kernel_DiretorioBarras := Folder + '\'
    else
      Kernel_DiretorioBarras := Folder;
end;

procedure Kernel_CaregaPropriedades;
begin
  //  Kernel_PropriedadesProjeto.str_ImagemSplash   :=
  //  Kernel_PropriedadesProjeto.str_Background     :=
  PropriedadesPrj.str_TituloPrograma := 'Livre ERP';
  PropriedadesPrj.str_SoftHouse      := 'SDM Sistemas';
end;

function Kernel_Confirmacao_acao(str_msn_acao: string; str_acao: char):Boolean;
begin
  result := (TFrmKernel_Mensagem.Mensagem(str_msn_acao,str_acao,[mbSim, mbNao]));
end;

procedure Kernel_InicializaVariaveis;
begin
  {Caminho do sistema}
  Kernel_CaregaPropriedades;

  {Tradução do QuantumGrid 6}
  TcsDXFunctions.Translate_PTBR;
end;

procedure Kernel_DestroyAguarde();
begin
  {Se estiver destroy}
  if Assigned(frmKernel_Aguarde) then
    FreeAndNil(frmKernel_Aguarde);
end;

procedure Kernel_CriaAguarde(str_mensagem: string);
begin
  if not Assigned(frmKernel_Aguarde) then
    Application.CreateForm(TfrmKernel_Aguarde, frmKernel_Aguarde);

  frmKernel_Aguarde.Refresh;
  frmKernel_Aguarde.lblAGUARDE.Caption := str_mensagem;
  frmKernel_Aguarde.Update;
  frmKernel_Aguarde.Show;
  frmKernel_Aguarde.Refresh;
end;

{Função resposanvel pela geração de logs dos cadastros -  auditoria}
procedure Kernel_RetornaLog(DeltaDs: TCustomClientDataSet;
  UpdateKing: TUpdateKind; Tabela: string);
  var
  i, Chave: Integer;
  sNewValue, sOldValue: string;
  StlLog: TStringList;
begin
  StlLog := TStringList.Create;

  {Verifica qual o tipo de atualização feita - insert ou delete }
  if UpdateKing in [ukInsert, ukDelete] then
  begin
    if UpdateKing = ukDelete then
      //Inseri cabeçalho
      Chave:= InseriCabecalhoAuditoria(3, Kernel_Login.int_codusu, kernel_str_DescExclusao, SysComputerName, tabela) // excluido
     else
      Chave:= InseriCabecalhoAuditoria(1, Kernel_Login.int_codusu, 'Novo Registro Inserido', SysComputerName, tabela); // inserido

    // percorre todos os campos para verificar as alteracoes
    for I := 0 to DeltaDs.FieldCount - 1 do
    begin
      // se o campo nao for nulo adiciona na tabela
      if not DeltaDs.Fields[i].IsNull then
      begin
        // Inseri itens Incluidos ou excluidos
        InseriCabecalhoAuditoriaitm(Chave, DeltaDs.Fields[i].FieldName ,DeltaDs.Fields[i].AsString,'' );
      end;
    end;
  end;// fim

  {Verifica qual o tipo de atualização feita - insert ou delete }
  if UpdateKing in [ukModify] then
  begin
    //Inseri cabeçalho
    Chave:= InseriCabecalhoAuditoria(3, Kernel_Login.int_codusu, 'O Registro foi alterado', SysComputerName, tabela); // alterado

    // percorre todos os campos para verificar as alteracoes
    for I := 0 to DeltaDs.FieldCount - 1 do
    begin
      { se nao houver nada no valor novo no campo ou no no valor antigo o
      campo nao foi alterado }
      if VarIsEmpty(DeltaDs.Fields[i].NewValue) or VarIsEmpty(DeltaDs.Fields[i].oldValue) then
        Continue; // pula pro proximo campo

      {se o valor novo do campo for diferente do valor antigo
       o campo foi alterado}
      if DeltaDs.Fields[i].NewValue<> DeltaDs.Fields[i].OldValue then
      begin

        // se o valor for nulo entao escreve null no log
        if VarIsNull(DeltaDs.Fields[i].NewValue) then
          sNewValue := 'null'
         else
          // se o campo for branco escreve '' no log
          if VarToStr(DeltaDs.Fields[i].NewValue) = '' then
            sNewValue := ''
           else
            // Grava o valor o novo valor do Log
            sNewValue := VarToStr(DeltaDs.Fields[i].NewValue);

        // ---- ANTIGO VALOR ----------------------------------    
        // se o valor for nulo entao escreve null no log
        if VarIsNull(DeltaDs.Fields[i].oldValue) then
          soldValue := 'null'
         else
          // se o campo for branco escreve '' no log
          if VarToStr(DeltaDs.Fields[i].oldValue) = '' then
            sOldValue := ''
           else
            // Grava o valor o Antigo valor do Log
            soldValue := VarToStr(DeltaDs.Fields[i].oldValue);

        // Grava Log com as alterações realizada no campo
        InseriCabecalhoAuditoriaitm(Chave, DeltaDs.Fields[i].FieldName ,sNewValue, sOldValue);
      end;
    end;
  end; // fim
end;

// Corrigindo o problema do foco não aparecer no componente
procedure Kernel_SetFocusCtrl(Ctrl: TWinControl; ActiveCtrl: TWinControl);
begin
  Ctrl := ActiveCtrl;
  ActiveCtrl := nil;
  PostMessage(TWinControl(Ctrl).Handle, WM_SETFOCUS, 0, 0);
  TWinControl(Ctrl).SetFocus;
end;

procedure Kernel_MostraFotoImage(ImagemPrincipal, ImagemAlternativa: string; Image: TImage);
var
 Caminho2 : string;
begin
  Caminho2 := '';
  // Mostra a Imagem do produto
  Caminho2 := kernel_Diretorio + 'Imagens\LogoTipos\'+ ImagemPrincipal + '.gif';
  if FileExists(Caminho2) then
    begin
      Image.Picture.LoadFromFile(Caminho2);
    end
   else
    begin
      // Se não Existir imagem do produto mostra foto padrao
      Caminho2 := kernel_Diretorio + 'Imagens\LogoTipos\'+ ImagemAlternativa + '.gif';
      if FileExists(Caminho2) then
        Begin
          Image.Picture.LoadFromFile(Caminho2);
        end;
    end;
end;

Function Kernel_RetiraPonto(Valor: double):double;
var
 buffer: string;
Begin
  buffer :=  FloatToStr(Valor);

  while Pos('.', buffer) > 0 do
  buffer[Pos('.', buffer)] := ',';

  Result := StrToFloat(buffer);
end;

Function Kernel_CalculaPrVenda(Compra, Margem: string): Currency;
var
  Venda, Soma: Currency;
begin
  Venda   :=  StrToFloat(Compra);
  Soma    := ( StrToCurr(compra) * StrToCurr(margem))/100;
  Result  :=  Venda+Soma;
end;

function Kernel_CalculaMargem(Venda, Compra :Currency): Currency;
var
  Soma: Currency;
begin
  //  Soma   :=  StrToCurr(Venda) / StrToCurr(Compra);
  Soma :=  ((Venda*100) /compra);
  Result := Soma;
end;     

function Kernel_ValidaCampos( Objeto: string; WinControl: TWinControl;
  TipoDoc: TACBrValTipoDocto ): Boolean;
var
 valid: TACBrValidador;
Begin
  valid :=  TACBrValidador.Create(nil); {: cria uma instância do objeto}
  try
    Result := False;

    valid.Documento     := Objeto ;
    Objeto              := valid.Formatar ;
    valid.TipoDocto     := TipoDoc;

    if valid.Validar then
      Result := True
    else
     begin
      TfrmKernel_Mensagem.Mensagem(valid.MsgErro ,'E',[mbOK]);
      exit;
      WinControl.SetFocus;
      exit;
     end;
  finally
    valid.Free; {: libera o objeto da memória}
  end;
end;

procedure Kernel_AbreForm(aClasseForm: TComponentClass; aForm: TForm);
begin
  {: metodo para abrir form}
  Application.CreateForm(aClasseForm, aForm);
  try
    aForm.ShowModal;
  finally
    aForm.Free;
  end;
end;

procedure Kernel_GerarExcel(Consulta:TADOQuery);
var
  coluna, linha: integer;
  excel: variant;
  valor: string;
begin
  try
    excel:=CreateOleObject('Excel.Application');
    excel.Workbooks.add(1);
  except
    Application.MessageBox ('Versão do Ms-Excel'+
      'Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;
  Consulta.First;
  try
    for linha:=0 to Consulta.RecordCount-1 do
    begin
      for coluna:=1 to Consulta.FieldCount do
      begin
        valor:= Consulta.Fields[coluna-1].AsString; excel.cells [linha+2,coluna]:=valor;
      end;
    Consulta.Next;
    end;
    for coluna:=1 to Consulta.FieldCount do
    begin
       valor:= Consulta.Fields[coluna-1].DisplayLabel;
       excel.cells[1,coluna]:=valor;
    end;
      excel.columns.AutoFit;
      excel.visible:=true;
   except
      Application.MessageBox ('Aconteceu um erro desconhecido durante a conversão'+
      'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
   end;
end;

function Kernel_Gerapercentual(valor:real; Percent:Real):real;
// Retorna a porcentagem de um valor
begin
  percent := percent / 100;
  try
    valor := valor * Percent;
  finally
    result := valor;
  end;
end;

function Kernel_GeraValor(valor:real; Percent:Real):real;
  // Retorna a porcentagem de um valor
begin
  percent := percent * 100;
  try
    valor := valor / Percent;
  finally
    result := valor;
  end;
end;

Procedure Kernel_Load_Imagem_abertura;
 var
 str_image: string;
begin
  // Cria Splash na memoria
  Application.CreateForm(TfrmKernel_Splash, frmKernel_Splash);
  with frmKernel_Splash do
  begin
    str_image := kernel_Diretorio + '\Imagens\logoempresa.jpg';
    // se existir image do plash  carega
    If FileExists(str_image) Then
      Begin
        imgSplash.Picture.LoadFromFile(str_image);
        imgSplash.Refresh;
      End;
   
    Show;
    
    imgSplash.Update;
    //lblSisNm_Empresa.Caption := SisNm_Empresa;
    imgSplash.Update;
    //lblempresa.Caption:='Licenciado para : '+ 'Empresa Teste' ;
    imgSplash.Update;
  end;

  Sleep(1000);
End;

function Kernel_GetVersaoArq: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(
    ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,
    VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),
    VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(
      dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(
      dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(
      dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;


end.
