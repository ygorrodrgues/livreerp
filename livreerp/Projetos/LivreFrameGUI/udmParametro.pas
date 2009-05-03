unit udmParametro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_CadBase, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmParametro = class(TdmKernel_CadBase)
    qryCadBaseID_PARAMETRO: TIntegerField;
    qryCadBasePASTA_PROJETO: TStringField;
    qryCadBaseTEMPLATE_PROJETO: TStringField;
    cdsCadBaseID_PARAMETRO: TIntegerField;
    cdsCadBasePASTA_PROJETO: TStringField;
    cdsCadBaseTEMPLATE_PROJETO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure kernel_CaregaConfiguracoes();override;
  end;

var
  dmParametro: TdmParametro;

implementation

uses UKernel_VariaveisPublic, UdmPrincipal;

{$R *.dfm}

{ TdmParametro }

procedure TdmParametro.DataModuleCreate(Sender: TObject);
begin
  kernel_CaregaConfiguracoes;
  inherited;
end;

procedure TdmParametro.kernel_CaregaConfiguracoes;
begin
  inherited;
  {Nome da tabela}
  Kernel_Cadastro.str_Tabela := 'PARAMETRO';
  {Nome do Campo chave da tabela}
  Kernel_Cadastro.str_CampoChave := 'ID_PARAMETRO';
  {Nome da tela de Cadastro}
  strclass := 'TfrmCadParametro';
  {Titulo da tela}
  kernel_srt_nmformbase := 'Configuração do Framework';
end;

end.
