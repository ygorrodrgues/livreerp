unit UdmProjeto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_CadBase, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmProjeto = class(TdmKernel_CadBase)
    qryCadBaseID_PROJETO: TIntegerField;
    qryCadBaseNOME_PROJETO: TStringField;
    qryCadBaseDATA_CRIACAO_PROJETO: TDateField;
    cdsCadBaseID_PROJETO: TIntegerField;
    cdsCadBaseNOME_PROJETO: TStringField;
    cdsCadBaseDATA_CRIACAO_PROJETO: TDateField;
    qryCadBaseID_TIPO_PROJETO: TIntegerField;
    qryCadBaseID_TIPO_BANCO: TIntegerField;
    cdsCadBaseID_TIPO_PROJETO: TIntegerField;
    cdsCadBaseID_TIPO_BANCO: TIntegerField;
    cdsLstTIPO_BANCO: TClientDataSet;
    dsLstTIPO_BANCO: TDataSource;
    cdsLstTIPO_BANCOID_TIPO_BANCO: TIntegerField;
    cdsLstTIPO_BANCODESC_TIPO_BANCO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure kernel_CaregaConfiguracoes();override;
  end;

var
  dmProjeto: TdmProjeto;

implementation

uses UKernel_VariaveisPublic;

{$R *.dfm}

{ TdmProjeto }

procedure TdmProjeto.DataModuleCreate(Sender: TObject);
begin
  kernel_CaregaConfiguracoes;
  inherited;

end;

procedure TdmProjeto.kernel_CaregaConfiguracoes;
begin
  inherited;
  {Nome da tabela}
  Kernel_Cadastro.str_Tabela := 'PROJETO';
  {Nome do Campo chave da tabela}
  Kernel_Cadastro.str_CampoChave := 'ID_PROJETO';
  {Nome da tela de Cadastro}
  strclass := 'TfrmCadProjeto';
  {Titulo da tela}
  kernel_srt_nmformbase := 'Projeto';
end;

end.
