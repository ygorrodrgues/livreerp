unit UdmKernel_Acesso;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmKernel_Acesso = class(TDataModule)
    qryAcessoMenuUsuario: TSQLQuery;
    dspAcessoMenuUsuario: TDataSetProvider;
    cdsAcessoMenuUsuario: TClientDataSet;
    StringField1: TStringField;
    qryDireitoAcessoUsuario: TSQLQuery;
    dspDireitoAcessoUsuario: TDataSetProvider;
    cdsDireitoAcessoUsuario: TClientDataSet;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    qryDireitoAcesso: TSQLQuery;
    dspDireitoAcesso: TDataSetProvider;
    cdsDireitoAcesso: TClientDataSet;
    cdsDireitoAcessoactconsultar: TStringField;
    cdsDireitoAcessoactNovo: TStringField;
    cdsDireitoAcessoactAlterar: TStringField;
    cdsDireitoAcessoactApagar: TStringField;
    cdsAcessoMenu: TClientDataSet;
    cdsAcessoMenuactconsultar: TStringField;
    dspAcessoMenu: TDataSetProvider;
    qryAcessoMenu: TSQLQuery;
    qryAux: TSQLQuery;
    dspAux: TDataSetProvider;
    cdsAux: TClientDataSet;
    cdsLstEmp: TClientDataSet;
    dsLstEmp: TDataSource;
    cdsLstEmpCODEMP: TIntegerField;
    cdsLstEmpNOMEEMP: TStringField;
    cdsLstEmpFANTASIAEMP: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmKernel_Acesso: TdmKernel_Acesso;

implementation

uses UdmPrincipal;

{$R *.dfm}

end.
