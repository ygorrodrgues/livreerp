unit UfrmKernel_LstBase;

interface

uses
  Windows,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  ComCtrls,
  DB,
  StdCtrls,
  AppEvnts,
  ImgList,
  Ufrmkernel_Base,
  DBClient,
  Buttons,
  ActnList,
  RzButton,
  RzPanel,
  cxStyles,
  cxCustomData,
  cxGraphics,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxDBData,
  cxGridTableView,
  RzStatus,
  cxGridLevel,
  cxClasses,
  cxControls,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridDBTableView,
  cxGrid,
  RzTabs,
  dxGDIPlusClasses,
  ExtCtrls,
  Menus,
  JvExControls,
  JvXPCore,
  JvXPButtons, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxLookAndFeelPainters, cxButtons, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmKernel_LstBase = class(TfrmKernel_Base)
    aplctnvntsBase: TApplicationEvents;
    imgLBase: TImageList;
    dsBase: TDataSource;
    ilLstBase: TImageList;
    actlstCadBase: TActionList;
    actNovo: TAction;
    actAlterar: TAction;
    actCancelar: TAction;
    actSalvar: TAction;
    actFechar: TAction;
    actAbrir: TAction;
    actImprimir: TAction;
    actExcluir: TAction;
    actFiltrar: TAction;
    actConsultar: TAction;
    cxspyBase: TcxStyleRepository;
    GridTableViewStyleSheetUserFormat2: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    actlstPropria: TActionList;
    ilPropria: TImageList;
    pnlFiltro: TRzPanel;
    cxgrdLst_Base: TcxGrid;
    cxgrdLst_BaseDBTableView1: TcxGridDBTableView;
    cxgrdLst_BaseLevel1: TcxGridLevel;
    PnlTitulo: TRzPanel;
    imgCadBase: TImage;
    Label11: TLabel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    cbbRelatorios: TcxComboBox;
    RzToolbar1: TRzToolbar;
    btnNovo: TRzToolButton;
    btnAlterar: TRzToolButton;
    btnImprimir: TRzToolButton;
    btnFechar: TRzToolButton;
    btnFiltrar: TRzToolButton;
    RzStatusBar1: TRzStatusBar;
    btnExcluir: TRzToolButton;
    RzSpacer1: TRzSpacer;
    RzSpacer2: TRzSpacer;
    RzSpacer3: TRzSpacer;
    procedure btnLstTodosClick(Sender: TObject);
    procedure dbgBaseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actConsultarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actFiltrarExecute(Sender: TObject);
  private
   obj_Dt: TDataModule;
  public
    procedure PermissoesForm; virtual;

    {Executa antes de executar o Excluir registro}
    procedure AntesExcluirRegistro; virtual;
    {Execura o metodo Excluir Registro}
    procedure ExcluirRegistro; virtual;
    {Executa Todo o processo de antes Excluir depois}
    procedure Executa_ExcluirRegistro; virtual;
    {Executa Depois de executar o Excluir registro}
    procedure DepoisExcluirRegistro; virtual;

    {Executa antes de executar o novo registro}
    procedure AntesNovoRegistro; virtual;
    {Execura o metodo Novo Registro}
    procedure NovoRegistro; virtual;
    {Executa Todo o processo de antes novo depois}
    procedure Executa_NovoRegistro; virtual;
    {Executa Depois de executar o novo registro}
    procedure DepoisNovoRegistro; virtual;

    {Executa antes de executar o Alterar registro}
    procedure AntesAlterarRegistro; virtual;
    {Execura o metodo Alterar Registro}
    procedure AlterarRegistro; virtual;
    {Executa Todo o processo de antes Alterar depois}
    procedure Executa_AlterarRegistro; virtual;
    {Executa Depois de executar o Alterar registro}
    procedure DepoisAlterarRegistro; virtual;

    {Executa antes de executar o Fechar}
    procedure AntesFechar; virtual;
    {Execura o metodo Fechar}
    procedure Fechar; virtual;
    {Executa Todo o processo de antes Cancelar depois}
    procedure Executa_Fechar; virtual;
    {Executa Depois de executar o Fechar}
    procedure DepoisFechar; virtual;

    {Executa antes de executar o Imprimir registro}
    procedure AntesImprimirRegistro; virtual;
    {Execura o metodo Imprimir Registro}
    procedure ImprimirRegistro(int_codrel: Integer); virtual;
    {Executa Todo o processo de antes Imprimir depois}
    procedure Executa_ImprimirRegistro; virtual;
    {Executa Depois de executar o Imprimir registro}
    procedure DepoisImprimirRegistro; virtual;

    procedure ExecutaPesquisaBase; virtual;
    procedure PesquisaBase; virtual;
    {Verifica se a pesquisa pode ser realizada}
    function AnalisaPodePesquisa(): Boolean; virtual;

    procedure CaregaColunas;
  end;

  TDataModuleClass = class of TDataModule;  

var
  frmKernel_LstBase: TfrmKernel_LstBase;
  
implementation

uses
  Ukernel_sysutils,
  Ukernel_Mensagem,
  UdmKernelPrincipal,
  UKernel_VariaveisPublic,
  Ukernel_DB,
  Ufrmkernel_Mensagem,
  Udmkernel_Acesso,
  UKernel_Grid,
  UdmKernel_CadBase,
  UfrmKernel_Aguarde,
  UKernel_Exception;

{$R *.dfm}

procedure TfrmKernel_LstBase.actAlterarExecute(Sender: TObject);
begin
  inherited;
  if DsBase.DataSet.IsEmpty then
    begin
      TfrmKernel_Mensagem.Mensagem(Kernel_Aviso_TabelaVazia, 'I', [mbOk]);
      Abort;
    end;

  Executa_AlterarRegistro;
end;

procedure TfrmKernel_LstBase.actConsultarExecute(Sender: TObject);
begin
  inherited;
  ExecutaPesquisaBase;
end;

procedure TfrmKernel_LstBase.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if DsBase.DataSet.IsEmpty then
    begin
      TfrmKernel_Mensagem.Mensagem(Kernel_Aviso_TabelaVazia, 'I', [mbOk]);
      Abort;
    end;

  Executa_ExcluirRegistro;
end;

procedure TfrmKernel_LstBase.actFecharExecute(Sender: TObject);
begin
  inherited;
  Executa_Fechar;
end;

procedure TfrmKernel_LstBase.actFiltrarExecute(Sender: TObject);
begin
  inherited;
  ExecutaPesquisaBase;
end;

procedure TfrmKernel_LstBase.actImprimirExecute(Sender: TObject);
begin
  inherited;
  if DsBase.DataSet.IsEmpty then
    begin
      TfrmKernel_Mensagem.Mensagem(Kernel_Aviso_TabelaVazia, 'I', [mbOk]);
      Abort;
    end;

  Executa_ImprimirRegistro;
end;

procedure TfrmKernel_LstBase.actNovoExecute(Sender: TObject);
begin
  inherited;
  Executa_NovoRegistro;
end;

procedure TfrmKernel_LstBase.AlterarRegistro;
var
  obj: TForm;
  frmclass: TFormClass;
begin
  // Localiza classe
  frmclass := TFormClass(FindClass(strclass));
  try
    // Receber o valor do registro atual
    int_chave := DsBase.DataSet.FieldByName(Kernel_Cadastro.str_CampoChave).value;
    // Instancia formulario
    obj := frmclass.Create(self);
    // Executa antes de alterar o registro
    AntesAlterarRegistro;
    // Mostra para o usuario
    obj.ShowModal;
  finally
    if obj.ModalResult = mrok then
      begin
        // Executa depois de alterar o registro
        DepoisAlterarRegistro;

        ExecutaPesquisaBase;

        // Receber o valor do registro atual
        DsBase.DataSet.Locate(Kernel_Cadastro.str_CampoChave,DatasetCadastro.FieldByName(Kernel_Cadastro.str_CampoChave).value,[]);
      end;

    Kernel_DestroyAguarde;

    // Libera Instancia da memoria
    FreeAndNil(obj);
  end;
end;

function TfrmKernel_LstBase.AnalisaPodePesquisa: Boolean;
begin

end;

procedure TfrmKernel_LstBase.AntesAlterarRegistro;
begin
  {DatasetCadastro deve ser informado na criação do form de listagem}
  with DatasetCadastro do
  begin
    Close;
    Params[0].Value := DsBase.DataSet.FieldByName(Kernel_Cadastro.str_CampoChave).value;
    Open;

    edit;
  end;
end;

procedure TfrmKernel_LstBase.AntesExcluirRegistro;
begin
  // Sobrescrever no form filho
end;

procedure TfrmKernel_LstBase.AntesFechar;
begin
  // Sobrescrever no form filho
end;

procedure TfrmKernel_LstBase.AntesImprimirRegistro;
begin
  // Sobrescrever no form filho
end;

procedure TfrmKernel_LstBase.AntesNovoRegistro;
begin
  {DatasetCadastro deve ser informado na criação do form de listagem}
  with DatasetCadastro do
  begin
    Close;
    Params[0].Value := null;
    Open;

    Append;
  end;
end;

procedure TfrmKernel_LstBase.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmKernel_LstBase.btnLstTodosClick(Sender: TObject);
begin
  inherited;
  PesquisaBase;
end;

procedure TfrmKernel_LstBase.CaregaColunas;
var
  int_coluna: Integer;
begin
  {So adiciona as Colunas se nao tiver colunas adicionadas manualmente}
  if cxgrdLst_BaseDBTableView1.Columns[0].DataBinding.FieldName = '' then
    Begin
      with DatasetColunas do
      begin
        close;
        Params[0].Value := Kernel_Cadastro.str_Tabela;
        Open;

        if not IsEmpty then
          begin
            First;

            while not eof do
            begin
              {Ordem que a coluna vai ficar no grid}
              int_coluna := DatasetColunas.FieldByName('CLN_ORDEM').Value;

              {Cria a nova coluna}
              cxgrdLst_BaseDBTableView1.CreateColumn;

              // field
              cxgrdLst_BaseDBTableView1.Columns[int_coluna].DataBinding.FieldName :=
                DatasetColunas.FieldByName('CLN_NOME').Value;
              // Caption
              cxgrdLst_BaseDBTableView1.Columns[int_coluna].Caption :=
                DatasetColunas.FieldByName('CLN_CAPTION').Value;
              // tamanho da coluna
              cxgrdLst_BaseDBTableView1.Columns[int_coluna].Width :=
                DatasetColunas.FieldByName('CLN_TAMANHO').Value;

              {Se o usuario pode ou nao filtrar valores dessa coluna}
              cxgrdLst_BaseDBTableView1.Columns[int_coluna].Options.Filtering :=
                DatasetColunas.FieldByName('CLN_FILTRA').Value = 'T';

              {Se o campo vai fazer algum tipo de sumarização}
              if DatasetColunas.FieldByName('CLN_SOMA').Value = 'T' then
                begin
                  case DatasetColunas.FieldByName('').Value of
                    1: cxgrdLst_BaseDBTableView1.Columns[int_coluna].Summary.FooterKind := skCount;
                    2: cxgrdLst_BaseDBTableView1.Columns[int_coluna].Summary.FooterKind := skSum;
                    3: cxgrdLst_BaseDBTableView1.Columns[int_coluna].Summary.FooterKind := skMax;
                    4: cxgrdLst_BaseDBTableView1.Columns[int_coluna].Summary.FooterKind := skMin;
                    5: cxgrdLst_BaseDBTableView1.Columns[int_coluna].Summary.FooterKind := skNone;
                    6: cxgrdLst_BaseDBTableView1.Columns[int_coluna].Summary.FooterKind := skAverage;
                  end;
                end;

              Next;
            end;
          end;
      end;
    End;
end;

procedure TfrmKernel_LstBase.NovoRegistro;
var
  obj: TForm;
  frmclass: TFormClass;
begin
  // Localiza classe
  frmclass := TFormClass(FindClass(strclass));
  try
    // So pega o valor da chave se nao estiver vazio 
    if not (DsBase.DataSet.IsEmpty) then    
      int_chave := DsBase.DataSet.FieldByName(Kernel_Cadastro.str_CampoChave).value;
      
    // Instancia formulario
    obj := frmclass.Create(self);
    // Executa antes de novo o registro
    AntesNovoRegistro;

    // Mostra para o usuario
    obj.ShowModal;
  finally
    if obj.ModalResult = mrok then
      begin
        // Executa depois de novo o registro
        DepoisNovoRegistro;

        ExecutaPesquisaBase;

        // Receber o valor do registro atual
        if not (DsBase.DataSet.IsEmpty) then
          DsBase.DataSet.Locate(Kernel_Cadastro.str_CampoChave,DatasetCadastro.FieldByName(Kernel_Cadastro.str_CampoChave).value,[]);
      end;

    Kernel_DestroyAguarde;

    // Libera Instancia da memoria
    FreeAndNil(obj);
  end;
end;

procedure TfrmKernel_LstBase.dbgBaseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // Impede o uso do ctrl + del
  if (Shift = [ssCtrl]) and (Key = 46) then
    KEY := 0;

  if (actExcluir.Enabled) and (Key = VK_DELETE) then
    Executa_ExcluirRegistro;
end;

procedure TfrmKernel_LstBase.DepoisAlterarRegistro;
begin
  // Sobrescrever no form filho
end;

procedure TfrmKernel_LstBase.DepoisExcluirRegistro;
begin
  // Sobrescrever no form filho
end;

procedure TfrmKernel_LstBase.DepoisFechar;
begin
  // Sobrescrever no form filho
end;

procedure TfrmKernel_LstBase.DepoisImprimirRegistro;
begin
  // Sobrescrever no form filho
end;

procedure TfrmKernel_LstBase.DepoisNovoRegistro;
begin
  // Sobrescrever no form filho
end;

procedure TfrmKernel_LstBase.PermissoesForm;
begin
  inherited;
  // Se não for administrador verifica permissões
  if not (Kernel_Login.str_adminusu = 'T') then
    begin
      // permisoes por perfil
      with dmKernel_Acesso, cDsDireitoAcesso do
      begin
        Close;
        Params.ParamByName('CODUSU').value := Kernel_Login.int_codusu;
        Params.ParamByName('CODMENU').value := kernel_CodMenu;
        Open;

        // Habilita Botoes de Controle Conforme Permisao
        actNovo.Enabled := FieldByName('actNOVO').AsString = 'T';
        actAlterar.Enabled := FieldByName('actalterar').AsString = 'T';
        actExcluir.Enabled := FieldByName('actapagar').AsString = 'T';
      end;

      // permisoes por usuario
      with dmKernel_Acesso, cDsDireitoAcessoUsuario do
      begin
        Close;
        Params.ParamByName('CODUSU').value := Kernel_Login.int_codusu;
        Params.ParamByName('CODMENU').value := kernel_CodMenu;
        Open;

        if not IsEmpty then
          begin
            // Habilita Botoes de Controle Conforme Permisao
            actNovo.Enabled := FieldByName('actNOVO').AsString = 'T';
            actAlterar.Enabled := FieldByName('actalterar').AsString = 'T';
            actExcluir.Enabled := FieldByName('actapagar').AsString = 'T';
          end;
      end;
    end;
end;

procedure TfrmKernel_LstBase.PesquisaBase;
begin
  // Sobrescrever no form filho
end;

procedure TfrmKernel_LstBase.ExcluirRegistro;
begin
  Kernel_Apaga_Registro(Kernel_Cadastro.str_Tabela, Kernel_Cadastro.str_CampoChave,
    DatasetListagem.FieldByName(Kernel_Cadastro.str_CampoChave).Value);
end;

procedure TfrmKernel_LstBase.ExecutaPesquisaBase;
begin
  Kernel_CriaAguarde('Atualizando as informações .. aguardem ');
  try
    PesquisaBase;
    application.ProcessMessages;
  finally
    Kernel_DestroyAguarde;
  end;
end;

procedure TfrmKernel_LstBase.Executa_AlterarRegistro;
begin
  AlterarRegistro;
end;

procedure TfrmKernel_LstBase.Executa_ExcluirRegistro;
var
  int_codigo: Integer;
begin
  // Chama o Evento Antes de Excluir
  AntesExcluirRegistro;

  if Kernel_Confirmacao_acao(Kernel_Confirmacao_Apaga_Registro, 'D') then
    begin
      {Apaga registro atual}
      try
        try
          int_codigo:= DatasetListagem.FieldByName(Kernel_Cadastro.str_CampoChave).Value;

          ExcluirRegistro;

          // Chama o Evento Apos Excluir
          DepoisExcluirRegistro;

          Application.MessageBox(pchar(Kernel_Aviso_Exclusao), pchar(Kernel_PropriedadesProjeto.str_SoftHouse), MB_OK + MB_ICONINFORMATION);

          ExecutaPesquisaBase;

          DatasetListagem.Locate( Kernel_Cadastro.str_CampoChave,int_codigo ,[]);          
        except
          raise Livre_Mensagem_Global.CreateFmt(Kernel_Erro_FalhaInesperada +' o registro %s . ', ['(' +
            IntToStr(DatasetListagem.FieldByName(Kernel_Cadastro.str_CampoChave).Value) + ')']);
        end;
      finally
        Kernel_DestroyAguarde;
      end;
    end;
end;

procedure TfrmKernel_LstBase.Executa_Fechar;
begin
  AntesFechar;
  Fechar;
  DepoisFechar;
end;

procedure TfrmKernel_LstBase.Executa_ImprimirRegistro;
begin
  AntesImprimirRegistro;
  ImprimirRegistro(cbbRelatorios.ItemIndex);
  DepoisImprimirRegistro;
end;

procedure TfrmKernel_LstBase.Executa_NovoRegistro;
begin
  NovoRegistro;
end;

procedure TfrmKernel_LstBase.Fechar;
begin
  close;
end;

procedure TfrmKernel_LstBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DsBase.DataSet.Close;
end;

procedure TfrmKernel_LstBase.FormCreate(Sender: TObject);
var
  dmClass : TDataModuleClass;
begin
  // Localiza classe
  dmClass := TDataModuleClass(FindClass(strdmclasss));
  try
    // Verifica se nao existe o objeto na memoria
    if not Assigned(obj_Dt) then
      // se nao existir cria
      obj_Dt := dmClass.Create(self);
  except
    FreeAndNil(obj_Dt);
  end;

  // Depois de Criar o datamodule mostra o titulo
  kernel_str_form := 'Listagem de ' + kernel_srt_nmformbase;
  lblTitulo.Caption := 'Listagem de ' + kernel_srt_nmformbase;
  lblSubtitulo.Caption := 'Gerenciamento de ' + kernel_srt_nmformbase;

  inherited;



  {Verifica as permissoes do usuario logado}
 // PermissoesForm;
end;

procedure TfrmKernel_LstBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_Insert: Begin
                 if actNovo.Enabled then
                   Executa_NovoRegistro;
               End;
    VK_F2: Begin
             if actAlterar.Enabled then
               Executa_AlterarRegistro;
           End;
    VK_F7: Executa_ImprimirRegistro;
    VK_F6: Executa_ExcluirRegistro;
    VK_F5: ExecutaPesquisaBase;
    VK_F12: Executa_Fechar;    
  end;
end;

procedure TfrmKernel_LstBase.FormShow(Sender: TObject);
begin
  inherited;

  {Datasource recebe o seu dataset}
  dsBase.DataSet := DatasetListagem;
  // Carega Colunas do grid
  CaregaColunas;
end;

procedure TfrmKernel_LstBase.ImprimirRegistro(int_codrel: Integer);
begin
  
end;


end.



