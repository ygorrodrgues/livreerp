unit UdmKernel_CadMovBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_CadBase, FMTBcd, DBClient, Provider, DB, SqlExpr;

type
  TdmKernel_CadMovBase = class(TdmKernel_CadBase)
    qryLstItem: TSQLQuery;
    dspLstItem: TDataSetProvider;
    cdsLstItem: TClientDataSet;
    qryCadItem: TSQLQuery;
    dspCadItem: TDataSetProvider;
    cdsCadItem: TClientDataSet;
    qryPesqProd: TSQLQuery;
    dspPesqProd: TDataSetProvider;
    cdsPesqProd: TClientDataSet;
    procedure cdsCadItemBeforePost(DataSet: TDataSet);
    procedure cdsCadItemAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure kernel_CaregaConfiguracoes();override;
  end;

var
  dmKernel_CadMovBase: TdmKernel_CadMovBase;

implementation

uses UdmPrincipal, UKernel_VariaveisPublic;

{$R *.dfm}

procedure TdmKernel_CadMovBase.cdsCadItemAfterInsert(DataSet: TDataSet);
begin
  inherited;
  AfterInsert(DataSet,Kernel_Cadastro.str_ItemTabela,Kernel_Cadastro.str_ItemCampoChave);
end;

procedure TdmKernel_CadMovBase.cdsCadItemBeforePost(DataSet: TDataSet);
begin
  inherited;
  BeforePost(DataSet,Kernel_Cadastro.str_ItemTabela,Kernel_Cadastro.str_ItemCampoChave);
end;

procedure TdmKernel_CadMovBase.kernel_CaregaConfiguracoes;
begin
  inherited;
  {carega datasets bases}
  DatasetCadastroItem := cdsCadItem;
  DatasetListagemItem := cdsLstItem;
end;

end.

