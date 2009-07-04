unit UdmKernel_Colunas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_CadMovBase, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmKernel_Colunas = class(TdmKernel_CadMovBase)
    qryCadBaseTLA_TELA: TIntegerField;
    qryCadBaseTLA_NOME: TStringField;
    qryCadBaseTLA_TITULO: TStringField;
    qryCadBaseTLA_CLASSE: TStringField;
    qryCadBaseTLA_TABELA: TStringField;
    cdsCadBaseTLA_TELA: TIntegerField;
    cdsCadBaseTLA_NOME: TStringField;
    cdsCadBaseTLA_TITULO: TStringField;
    cdsCadBaseTLA_CLASSE: TStringField;
    cdsCadBaseTLA_TABELA: TStringField;
    qryLstBaseTLA_TELA: TIntegerField;
    qryLstBaseTLA_NOME: TStringField;
    qryLstBaseTLA_TITULO: TStringField;
    qryLstBaseTLA_CLASSE: TStringField;
    cdsLstBaseTLA_TELA: TIntegerField;
    cdsLstBaseTLA_NOME: TStringField;
    cdsLstBaseTLA_TITULO: TStringField;
    cdsLstBaseTLA_CLASSE: TStringField;
    qryCadItemCLN_COLUNA: TIntegerField;
    qryCadItemCLN_NOME: TStringField;
    qryCadItemTLA_TELA: TIntegerField;
    qryCadItemCLN_SOMA: TStringField;
    qryCadItemCLN_FILTRA: TStringField;
    qryCadItemCLN_TAMANHO: TIntegerField;
    qryCadItemCLN_ORDEM: TIntegerField;
    qryCadItemCLN_CHAVE: TStringField;
    qryCadItemCLN_CAPTION: TStringField;
    qryCadItemSMA_SOMA: TIntegerField;
    cdsCadItemCLN_COLUNA: TIntegerField;
    cdsCadItemCLN_NOME: TStringField;
    cdsCadItemTLA_TELA: TIntegerField;
    cdsCadItemCLN_SOMA: TStringField;
    cdsCadItemCLN_FILTRA: TStringField;
    cdsCadItemCLN_TAMANHO: TIntegerField;
    cdsCadItemCLN_ORDEM: TIntegerField;
    cdsCadItemCLN_CHAVE: TStringField;
    cdsCadItemCLN_CAPTION: TStringField;
    cdsCadItemSMA_SOMA: TIntegerField;
    qryLstItemCLN_COLUNA: TIntegerField;
    qryLstItemCLN_NOME: TStringField;
    qryLstItemTLA_TELA: TIntegerField;
    qryLstItemCLN_SOMA: TStringField;
    qryLstItemCLN_FILTRA: TStringField;
    qryLstItemCLN_TAMANHO: TIntegerField;
    qryLstItemCLN_ORDEM: TIntegerField;
    qryLstItemCLN_CHAVE: TStringField;
    qryLstItemCLN_CAPTION: TStringField;
    qryLstItemSMA_SOMA: TIntegerField;
    cdsLstItemCLN_COLUNA: TIntegerField;
    cdsLstItemCLN_NOME: TStringField;
    cdsLstItemTLA_TELA: TIntegerField;
    cdsLstItemCLN_SOMA: TStringField;
    cdsLstItemCLN_FILTRA: TStringField;
    cdsLstItemCLN_TAMANHO: TIntegerField;
    cdsLstItemCLN_ORDEM: TIntegerField;
    cdsLstItemCLN_CHAVE: TStringField;
    cdsLstItemCLN_CAPTION: TStringField;
    cdsLstItemSMA_SOMA: TIntegerField;
    CdsLstSoma: TClientDataSet;
    CdsLstSomaSMA_SOMA: TIntegerField;
    CdsLstSomaSMA_NOME: TStringField;
    qryCadItemCLN_NOME_AMIGAVEL: TStringField;
    cdsCadItemCLN_NOME_AMIGAVEL: TStringField;
    qryLstItemCLN_NOME_AMIGAVEL: TStringField;
    cdsLstItemCLN_NOME_AMIGAVEL: TStringField;
    procedure cdsCadItemBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure kernel_CaregaConfiguracoes();override;
  end;

var
  dmKernel_Colunas: TdmKernel_Colunas;

implementation

uses UKernel_VariaveisPublic, UKernel_DB;

{$R *.dfm}

{ TdmKernel_Colunas }

procedure TdmKernel_Colunas.cdsCadItemBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Faz ligação entre master e detail
  cdsCadItemTLA_TELA.AsInteger := cdsCadBaseTLA_TELA.AsInteger;

  // Gera codigo incremento do campo Ordem
  if DataSet.state in [dsinsert] then
    cdsCadItemCLN_ORDEM.AsInteger := Incrementa_Itens('TLS_COLUNA','CLN_ORDEM','TLA_TELA',cdsCadBaseTLA_TELA.AsInteger );
end;

procedure TdmKernel_Colunas.kernel_CaregaConfiguracoes;
begin
  inherited;
  {Nome da tabela}
  Kernel_Cadastro.str_Tabela := 'TLS_TELA';

  {View / Tabela onde se encontrar os campos que serao mostrados no grid}
  Kernel_Cadastro.str_view:= 'VW_LST_COLUNAS';
    
  {Nome do Campo chave da tabela}
  Kernel_Cadastro.str_CampoChave := 'TLA_TELA';
  {Nome da tela de Cadastro}
  strclass := 'TfrmKernel_CadColunas';
  {Titulo da tela}
  kernel_srt_nmformbase := 'Configuração de Colunas';

  {Nome da tabela Detalhe}
  Kernel_Cadastro.str_ItemTabela := 'TLS_COLUNA';
  {Nome do Campo chave da tabela Detalhe}
  Kernel_Cadastro.str_ItemCampoChave := 'CLN_COLUNA';
  strclassItem := 'TfrmKernel_CadItemColunas';
end;

end.
