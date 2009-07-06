unit UdmKernel_CadBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_Base, FMTBcd, DBClient, Provider, DB, SqlExpr,
  UclKernel_Cadastro,UKernel_VariaveisPublic, DBCommon, frxClass, frxDBSet,
  frxDesgn;

type
  TdmKernel_CadBase = class(TdmKernel_Base)
    qryCadBase: TSQLQuery;
    qryLstBase: TSQLQuery;
    dspCadBase: TDataSetProvider;
    dspLstBase: TDataSetProvider;
    cdsCadBase: TClientDataSet;
    cdsLstBase: TClientDataSet;
    cdsLstColunas: TClientDataSet;
    cdsLstColunasTLA_TELA: TIntegerField;
    cdsLstColunasTLA_NOME: TStringField;
    cdsLstColunasTLA_TITULO: TStringField;
    cdsLstColunasTLA_CLASSE: TStringField;
    cdsLstColunasCLN_COLUNA: TIntegerField;
    cdsLstColunasCLN_NOME: TStringField;
    cdsLstColunasCLN_SOMA: TStringField;
    cdsLstColunasCLN_FILTRA: TStringField;
    cdsLstColunasCLN_TAMANHO: TIntegerField;
    cdsLstColunasCLN_ORDEM: TIntegerField;
    cdsLstColunasCLN_CHAVE: TStringField;
    cdsLstColunasSMA_NOME: TStringField;
    cdsLstColunasSMA_SOMA: TIntegerField;
    cdsLstColunasCLN_CAPTION: TStringField;
    qryLstAux: TSQLQuery;
    dspLstAux: TDataSetProvider;
    cdsLstTabela: TClientDataSet;
    cdsLstTabelaTLA_TELA: TIntegerField;
    cdsLstTabelaTLA_TABELA: TStringField;
    cdsLstTabelaTLA_TITULO: TStringField;
    cdsLstTabelaTLA_CLASSE: TStringField;
    cdsLstTabelaCLN_NOME: TStringField;
    cdsLstColunasCLN_NOME_AMIGAVEL: TStringField;
    cdsLstColunasFiltro: TClientDataSet;
    cdsLstColunasFiltroTLA_TELA: TIntegerField;
    cdsLstColunasFiltroTLA_NOME: TStringField;
    cdsLstColunasFiltroTLA_TITULO: TStringField;
    cdsLstColunasFiltroTLA_CLASSE: TStringField;
    cdsLstColunasFiltroCLN_COLUNA: TIntegerField;
    cdsLstColunasFiltroCLN_NOME: TStringField;
    cdsLstColunasFiltroCLN_SOMA: TStringField;
    cdsLstColunasFiltroCLN_FILTRA: TStringField;
    cdsLstColunasFiltroCLN_TAMANHO: TIntegerField;
    cdsLstColunasFiltroCLN_ORDEM: TIntegerField;
    cdsLstColunasFiltroCLN_CHAVE: TStringField;
    cdsLstColunasFiltroCLN_CAPTION: TStringField;
    cdsLstColunasFiltroSMA_NOME: TStringField;
    cdsLstColunasFiltroSMA_SOMA: TIntegerField;
    cdsLstColunasFiltroCLN_NOME_AMIGAVEL: TStringField;
    procedure cdsCadBaseBeforePost(DataSet: TDataSet);
    procedure cdsCadBaseAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure dspCadBaseAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
  private

  public
    procedure AfterInsert(ds: Tdataset; str_tabela, str_campochave: string); virtual;
    procedure BeforePost(ds: Tdataset; str_tabela, str_campochave: string); virtual;
    procedure kernel_CaregaConfiguracoes();virtual;
    {Fomata com mascara de valor todos os fields de valor}
    procedure kernel_Formata_Fields_Valores;

    { Public declarations }
    function Kernel_Nome_Tabela(DataSet: TDataSet): String;
    
  end;

var
  dmKernel_CadBase: TdmKernel_CadBase;

implementation

uses UKernel_DB, UdmPrincipal, UKernel_SysUtils;

{$R *.dfm}

procedure TdmKernel_CadBase.AfterInsert(ds: Tdataset; str_tabela, str_campochave: string);
begin
  { Recebe o proximo ID da tabela sempre que for novo registro }
  ds.FieldByName(str_campochave).value:= Kernel_Incrementa(str_tabela,str_campochave);
end;

procedure TdmKernel_CadBase.cdsCadBaseAfterInsert(DataSet: TDataSet);
begin
  inherited;
  AfterInsert(DataSet,Kernel_Cadastro.str_Tabela,Kernel_Cadastro.str_CampoChave);
end;

procedure TdmKernel_CadBase.cdsCadBaseBeforePost(DataSet: TDataSet);
begin
  inherited;
  BeforePost(DataSet,Kernel_Cadastro.str_Tabela,Kernel_Cadastro.str_CampoChave);
end;

procedure TdmKernel_CadBase.DataModuleCreate(Sender: TObject);
begin
  inherited;
  {Fomata com mascara de valor todos os fields de valor}
  kernel_Formata_Fields_Valores;

  kernel_CaregaConfiguracoes();  
end;

procedure TdmKernel_CadBase.dspCadBaseAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  inherited;
  Kernel_RetornaLog(DeltaDS, UpdateKind,Kernel_Nome_Tabela(cdsCadBase));
end;

procedure TdmKernel_CadBase.kernel_CaregaConfiguracoes();
begin
  {Define qual e o clientdataset de cadastro}
  DatasetCadastro    := cdsCadBase;
  DatasetqryCadastro := qryCadBase;
  DatasetColunas     := cdsLstColunas;
  DatasetListagem    := cdsLstBase;
  // aqui sera implementado no filho
end;

procedure TdmKernel_CadBase.kernel_Formata_Fields_Valores;
var
  I, J: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDataSet then
      begin
        with TDataSet(Components[I]) do
        begin
          for J := 0 to Fields.Count - 1 do
          begin
            if (Fields[J] is TFloatField) or (Fields[J] is TBCDField) or (Fields[J] is TFMTBCDField) then
              begin
                TNumericField(Fields[J]).DisplayFormat := '##,###,##0.00';
              end;
          end;
        end;
      end;
  end;
end;

function TdmKernel_CadBase.Kernel_Nome_Tabela(DataSet: TDataSet): String;
begin
  Result:= GetTableNameFromSQL(((FindComponent((DataSet as TClientDataSet).ProviderName) as
     TDataSetProvider).DataSet as  TSQLQuery).Text);
end;

procedure TdmKernel_CadBase.BeforePost(ds: Tdataset; str_tabela, str_campochave: string);
begin
  {Se for insercao Recebe o proximo ID da tabela }
  if ds.State in [dsinsert] then
  begin
    ds.FieldByName(str_campochave).value:= Kernel_Incrementa(str_tabela,str_campochave);
  end;
end;

end.
