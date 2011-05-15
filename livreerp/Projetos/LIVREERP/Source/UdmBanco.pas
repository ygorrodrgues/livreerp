unit UdmBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_CadBase, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmBanco = class(TdmKernel_CadBase)
    qryCadBaseCODBANCO: TIntegerField;
    qryCadBaseNOMEBANCO: TStringField;
    qryCadBaseLICENCABANCO: TStringField;
    cdsCadBaseCODBANCO: TIntegerField;
    cdsCadBaseNOMEBANCO: TStringField;
    cdsCadBaseLICENCABANCO: TStringField;
    qryLstBaseCODBANCO: TIntegerField;
    qryLstBaseNOMEBANCO: TStringField;
    qryLstBaseLICENCABANCO: TStringField;
    cdsLstBaseCODBANCO: TIntegerField;
    cdsLstBaseNOMEBANCO: TStringField;
    cdsLstBaseLICENCABANCO: TStringField;
  private
    { Private declarations }
  public
    procedure kernel_CaregaConfiguracoes();override;
  end;

var
  dmBanco: TdmBanco;

implementation

uses UclKernel_Cadastro, UKernel_VariaveisPublic, UdmPrincipal;

{$R *.dfm}

{ TdmBanco }

procedure TdmBanco.kernel_CaregaConfiguracoes;
begin
  inherited;
  {Nome da tabela}
  Kernel_Cadastro.str_Tabela := 'banco';
  {Nome do Campo chave da tabela}
  Kernel_Cadastro.str_CampoChave := 'CODBANCO';
  {Nome da tela de Cadastro}
  strclass := 'TfrmCadBanco';
  {Titulo da tela}
  kernel_srt_nmformbase := 'Banco';
end;

end.
