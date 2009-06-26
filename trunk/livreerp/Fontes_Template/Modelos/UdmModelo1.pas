unit UdmModelo1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_CadBase, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmModelo1 = class(TdmKernel_CadBase)
  private
    { Private declarations }
  public
    procedure kernel_CaregaConfiguracoes();override;
  end;

var
  dmModelo1: TdmModelo1;

implementation

uses UKernel_VariaveisPublic;

{$R *.dfm}

{ TdmModelo1 }

procedure TdmModelo1.kernel_CaregaConfiguracoes;
begin
  inherited;
  {Nome da tabela}
  Kernel_Cadastro.str_Tabela := 'MODELO1';
  {Nome do Campo chave da tabela}
  Kernel_Cadastro.str_CampoChave := 'CODMODELO1';
  {Nome da tela de Cadastro}
  strclass := 'TfrmCadModelo1';
  {Titulo da tela}
  kernel_srt_nmformbase := 'Modelo1';
end;

end.
