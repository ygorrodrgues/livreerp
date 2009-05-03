unit UKernel_DB;

interface

  uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls, DBClient, Provider,FMTBcd,
  SqlExpr, Variants, untKernel_Interface_RegrasBD ;

  {Incrementa Chave Primaria da tabela}
  function Kernel_Incrementa(TableName, Campo: String): Integer;
  {Incrementa Chave primaria da tabela detalhe}
  function Incrementa_Itens(TableName, FieldName, Campo : String; CHAVE : Variant): Integer;
  {Atualiza ClientDataSet passado como parametro }
  procedure kernel_RefreshCds (aCds : TClientDataSet);
  { Verifica se o pode excluir o registro, se tem relacionamento}
  function kernel_ExisteRelacionamento(str_Tabela, str_Coluna, str_status, str_where : string; int_ValorChave : Variant):Boolean;
  {Retorna a data atual do servidor de banco de dados}
  function Kernel_Data_Servidor: Tdatetime;

  {  -- funcoes para auditoria  -----------------}
  //  Inseri o cabeçalho da auditoria
  Function InseriCabecalhoAuditoria(CODTPAUD, CODUSUCADAUD: integer; MOTIVOAUD, IPAUD, TABELAAUD: string ): Integer;
  //  Inseri os Itens da auditoria
  procedure InseriCabecalhoAuditoriaitm(CODAUD: Integer; CAMPOAUD: string; NOVOVALORAUD, ANTIGOVALORAUD: string );

  {Descrição: Atualiza registro no banco de dados conforme valores dos parametros
  Parametros: str_tabela: Nome da Tabela
    str_campo_chave: Nome da coluna chave da tabela
    str_campo_upd: Nome do campo a ser atualizado na tabela
    vrt_valor_chave: Valor do campo chave
     vrt_valor_upd: Valor do campo a ser atualizado
  Autor: Sérgio Guedes  }  
  procedure Kernel_Atualiza_Registro(str_tabela, str_campo_chave, str_campo_upd: string;
    vrt_valor_chave, vrt_valor_upd : Variant);

  {Descrição: Apaga o registro conforme valores dos parametros
  Parametros: str_tabela: Nome da Tabela onde será apagado o registro
    str_campo_chave: Nome da coluna chave da tabela
    vrt_valor_chave: Valor do campo chave a ser apagado
  Autor: Sérgio Guedes  }
  procedure Kernel_Apaga_Registro(str_tabela, str_campo_chave: string; vrt_valor_chave: Variant);

  {Descrição: Instancia objeto Tsqlquery na memoria, economizando codigo
  Autor: Sérgio Guedes  }    
  Function InstanciaQuery(): TSQLQuery;

  function Kernel_Caminho_Relatorio(TableName, Campo: String): string;
  {Preenche com informacoes o comobox informado como parametro}
  procedure Kernel_Preenche_TComobox(var Cb: TComboBox;  Tabela,
    campo, condicao : String);

implementation

uses UdmPrincipal, UfrmKernel_Mensagem, UKernel_Mensagem, uKernel_Sistema,
  UKernel_VariaveisPublic;

procedure Kernel_Preenche_TComobox(var Cb: TComboBox;  Tabela,
  campo, condicao : String);
var
  Qry:TsqlQuery;
begin
  Qry := InstanciaQuery(); {: cria uma instância do objeto}
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ' +  campo + ' from ' + Tabela);

      // se tiver condicao aplica na consulta
      if condicao <> '' then
        SQL.Add(condicao);          

      SQL.Add('order by ' + campo);
      Open;

      if recordcount > 0 then
        Cb.Clear;
        First;
        While not Eof do
          Begin
            Cb.Items.Add(Fieldbyname(campo).asstring);
            Next;
          End;
      end;
   finally
    FreeAndNil(Qry);  {: libera o objeto da memória}
  end;
end;

Function InstanciaQuery(): TSQLQuery;
var
  Qry:TsqlQuery;
begin
  qry := TsqlQuery.Create(nil); {: cria uma instância do objeto}
  qry.sqlConnection:= FConexao; {: componente de conexão}
  result := qry; // Retorna a query instancia para quem chamou a função
end;

procedure Kernel_Atualiza_Registro(str_tabela, str_campo_chave, str_campo_upd: string;
  vrt_valor_chave, vrt_valor_upd : Variant);
begin
  FConexao.ExecuteDirect('update '+ str_tabela + ' set ' + str_campo_upd + '='+ QuotedStr(vrt_valor_upd)+
   ' where '+  str_campo_chave+'='+ quotedStr(vrt_valor_chave) );
end;

procedure Kernel_Apaga_Registro(str_tabela, str_campo_chave: string; vrt_valor_chave: Variant);
begin
  FConexao.ExecuteDirect('delete from ' + str_tabela+ ' where ' + str_campo_chave + '=' +
   QuotedStr(vrt_valor_chave) );
end;

function Kernel_Caminho_Relatorio(TableName, Campo: String): string;
var
  Qry:TsqlQuery;
begin
  Result:= '';
  qry := InstanciaQuery; {: cria uma instância do objeto}
  try
    with Qry do
    begin
      SQL.Add('SELECT MAX('+Campo+')FROM '+ TableName);
      Open;

      if not IsEmpty then
        Result := Fields[0].asstring;
    end;
  finally
    FreeAndNil(Qry);  {: libera o objeto da memória}
  end;
end;

function Kernel_Incrementa(TableName, Campo: String): Integer;
var
  Qry:TsqlQuery;
begin
  qry := InstanciaQuery; {: cria uma instância do objeto}
  try
    with Qry do
    begin
      SQL.Add('SELECT MAX('+Campo+')FROM '+ TableName);
      Open;
      
      if Fields[0].IsNull then {: se a tabela está vazia, retornará nulo}
        Result := 1 {: então este será o 1º registro}
       else
        Result := Fields[0].value+1;
    end;
  finally
    FreeAndNil(Qry);  {: libera o objeto da memória}
  end;
end;

function Incrementa_Itens(TableName, FieldName, Campo : String; CHAVE : Variant): Integer;
var
  Qry:TsqlQuery;
  nr: integer;
begin
  qry := InstanciaQuery; {: cria uma instância do objeto}
  try
    with Qry do
    begin
      SQL.Add('SELECT MAX('+ FieldName +')FROM '+ TableName);
      SQL.Add('WHERE ' +  Campo + ' =' + QuotedStr(IntToStr(CHAVE)) );
      Open;
      
      if Fields[0].IsNull then {: se a tabela está vazia, retornará nulo}
        Begin
         nr := 1; {: então este será o 1º registro}
         Result:= nr;
       end
      else
       Begin
         nr := Fields[0].value+1;
         Result:= nr;
       end;
    end;
  finally
    FreeAndNil(Qry);  {: libera o objeto da memória}
  end;
end;

procedure kernel_RefreshCds (aCds : TClientDataSet);
begin
  {: atualiza o ClientDataSet (principalmente para Relatórios)}
  aCds.Close;
  aCds.Open;
end;

function Kernel_Data_Servidor: Tdatetime;
var
  Qry:TsqlQuery;
begin
  qry := InstanciaQuery; {: cria uma instância do objeto}
  try
    with Qry do
    begin
      Close;

      case TTipoBD(Tipo_DB) of
         bdFirebird : SQL.Add('SELECT CURRENT_DATE FROM RDB$DATABASE');
         bdSQLServer : SQL.Add('select getdate() as DATA');
         bdOracle : SQL.Add('select getdate() as DATA');
         bdPostGreeSQL : SQL.Add('select getdate() as DATA');                           
      end;

      Open;

      Result := Fields[0].AsDateTime;
    end;
  finally
    FreeAndNil(Qry);  //: libera o objeto da memória
  end;
end;

function kernel_ExisteRelacionamento(str_Tabela, str_Coluna, str_status, str_where : string; int_ValorChave : Variant): Boolean;
{
  o valor de int_valorChave ja deve vim formatada para string
}
var
  Qry:TsqlQuery;
begin
  Result := False;

  qry := InstanciaQuery; {: cria uma instância do objeto}
  try
    with Qry do
    begin
      Close;
      SQL.Add('SELECT DISTINCT '+str_Coluna+' FROM '+str_Tabela+' WHERE '+str_Coluna+' = '+ int_valorChave );

      {se a variavel where estiver algum valor faz o que comando que está na mesma }
      if str_where <> '' then
        begin
          sql.Add(str_where);
        end;
        
      Open;
      
      if not (IsEmpty) then
        Result:=true;
    end;
  finally
    FreeAndNil(Qry);  //: libera o objeto da memória
  end;
end;

//  Inseri os Itens da auditoria
procedure InseriCabecalhoAuditoriaitm(CODAUD: Integer; CAMPOAUD: string; NOVOVALORAUD, ANTIGOVALORAUD: string );
var
  Qry:TSQLQuery;
begin
  qry := InstanciaQuery; {: cria uma instância do objeto}
  try
    with qry do
    Begin
      close;
      SQL.Clear;
      SQL.Add('insert into auditoriaitm (CODAUDITM,CODAUD,CAMPOAUD, NOVOVALORAUD, ANTIGOVALORAUD) values');
      SQL.Add('(:CODAUDITM,:CODAUD, :CAMPOAUD, :NOVOVALORAUD, :ANTIGOVALORAUD)');
      Params[0].Value := Kernel_Incrementa('AUDITORIAITM','CODAUDITM');
      Params[1].Value := CODAUD;
      Params[2].Value := CAMPOAUD;
      Params[3].Value := NOVOVALORAUD;
      Params[4].Value := ANTIGOVALORAUD;
      ExecSQL();
   end;
  finally
    FreeAndNil(qry);
  end;
end;

//  Inseri o cabeçalho da auditoria
Function InseriCabecalhoAuditoria(CODTPAUD, CODUSUCADAUD: integer; MOTIVOAUD, IPAUD, TABELAAUD: string ): Integer;
var
  Qry:TSQLQuery;
  cod: Integer;
begin
  qry := InstanciaQuery; {: cria uma instância do objeto}
  try
    with qry do
    Begin
      close;
      SQL.Clear;
      SQL.Add('insert into auditoria (CODAUD, CODTPAUD, CODUSUCADAUD, MOTIVOAUD, IPAUD, TABELAAUD) values');
      SQL.Add('(:CODAUD, :CODTPAUD, :CODUSUCADAUD, :MOTIVOAUD, :IPAUD, :TABELAAUD)');
      cod:= Kernel_Incrementa('AUDITORIA','CODAUD');
      Params[0].Value := cod;
      Params[1].Value := CODTPAUD;
      Params[2].Value := CODUSUCADAUD;
      Params[3].Value := MOTIVOAUD;
      Params[4].Value := SysComputerName;
      Params[5].Value := TABELAAUD;              
      ExecSQL();

      Result:= cod;
   end;
  finally
    FreeAndNil(qry);
  end;
end;

end.
