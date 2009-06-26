unit UdmKernel_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_Base, UdmKernel_CadBase, FMTBcd, DB, DBClient, Provider,
  SqlExpr;

type
  TdmKernel_CadUsuario = class(TdmKernel_CadBase)
    qryCadBaseCODUSU: TIntegerField;
    qryCadBaseCODPERFIL: TIntegerField;
    qryCadBaseNOMEUSU: TStringField;
    qryCadBaseSENHAUSU: TStringField;
    qryCadBaseLOGINUSU: TStringField;
    qryCadBaseQTDIASUSU: TIntegerField;
    qryCadBasePRIVADMUSU: TStringField;
    qryCadBaseEXPIRASENHAUSU: TStringField;
    qryCadBaseDTEXPIRAUSU: TSQLTimeStampField;
    cdsCadBaseCODUSU: TIntegerField;
    cdsCadBaseCODPERFIL: TIntegerField;
    cdsCadBaseNOMEUSU: TStringField;
    cdsCadBaseSENHAUSU: TStringField;
    cdsCadBaseLOGINUSU: TStringField;
    cdsCadBaseQTDIASUSU: TIntegerField;
    cdsCadBasePRIVADMUSU: TStringField;
    cdsCadBaseEXPIRASENHAUSU: TStringField;
    cdsCadBaseDTEXPIRAUSU: TSQLTimeStampField;
    cdsPerfil: TClientDataSet;
    dsPerfil: TDataSource;
    cdsPerfilCODPERFIL: TIntegerField;
    cdsPerfilNOMEPERFIL: TStringField;
    qryLstBaseCODUSU: TIntegerField;
    qryLstBaseCODPERFIL: TIntegerField;
    qryLstBaseNOMEUSU: TStringField;
    qryLstBaseSENHAUSU: TStringField;
    qryLstBaseLOGINUSU: TStringField;
    qryLstBaseQTDIASUSU: TIntegerField;
    qryLstBasePRIVADMUSU: TStringField;
    qryLstBaseEXPIRASENHAUSU: TStringField;
    qryLstBaseDTEXPIRAUSU: TSQLTimeStampField;
    qryLstBaseNOMEPERFIL: TStringField;
    cdsLstBaseCODUSU: TIntegerField;
    cdsLstBaseCODPERFIL: TIntegerField;
    cdsLstBaseNOMEUSU: TStringField;
    cdsLstBaseSENHAUSU: TStringField;
    cdsLstBaseLOGINUSU: TStringField;
    cdsLstBaseQTDIASUSU: TIntegerField;
    cdsLstBasePRIVADMUSU: TStringField;
    cdsLstBaseEXPIRASENHAUSU: TStringField;
    cdsLstBaseDTEXPIRAUSU: TSQLTimeStampField;
    cdsLstBaseNOMEPERFIL: TStringField;
  private
    { Private declarations }
  public
    procedure kernel_CaregaConfiguracoes();override;
  end;

var
  dmKernel_CadUsuario: TdmKernel_CadUsuario;

implementation

uses UKernel_VariaveisPublic;

{$R *.dfm}

{ TdmKernel_CadUsuario }

procedure TdmKernel_CadUsuario.kernel_CaregaConfiguracoes;
begin
  inherited;
  {Nome da tabela}
  Kernel_Cadastro.str_Tabela := 'USUARIO';
  {Nome do Campo chave da tabela}
  Kernel_Cadastro.str_CampoChave := 'CODUSU';
  {Nome da tela de Cadastro}
  strclass := 'TfrmKernel_CadUsuario';
  {Titulo da tela}
  kernel_srt_nmformbase := 'Usuários';
end;

end.
