unit UdmKernel_Perfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_CadBase, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmKernel_Perfil = class(TdmKernel_CadBase)
    qryCadBaseCODPERFIL: TIntegerField;
    qryCadBaseNOMEPERFIL: TStringField;
    cdsCadBaseCODPERFIL: TIntegerField;
    cdsCadBaseNOMEPERFIL: TStringField;
    qryLstBaseCODPERFIL: TIntegerField;
    qryLstBaseNOMEPERFIL: TStringField;
    cdsLstBaseCODPERFIL: TIntegerField;
    cdsLstBaseNOMEPERFIL: TStringField;
  private
    { Private declarations }
  public
    procedure kernel_CaregaConfiguracoes();override;
  end;

var
  dmKernel_Perfil: TdmKernel_Perfil;

implementation

uses UKernel_VariaveisPublic;

{$R *.dfm}

{ TdmKernel_Perfil }

procedure TdmKernel_Perfil.kernel_CaregaConfiguracoes;
begin
  inherited;
  {Nome da tabela}
  Kernel_Cadastro.str_Tabela := 'PERFIL';
  {Nome do Campo chave da tabela}
  Kernel_Cadastro.str_CampoChave := 'CODPERFIL';
  {Nome da tela de Cadastro}
  strclass := 'TfrmKernel_CadPerfil';
  {Titulo da tela}
  kernel_srt_nmformbase := 'Perfis';
end;

end.
