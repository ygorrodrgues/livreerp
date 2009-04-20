unit UdmKernel_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_CadBase, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmKernel_Cliente = class(TdmKernel_CadBase)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure kernel_CaregaConfiguracoes(str_tabela: string);override;    { Public declarations }
  end;

var
  dmKernel_Cliente: TdmKernel_Cliente;

implementation

uses UKernel_VariaveisPublic;

{$R *.dfm}

{ TdmKernel_Cliente }

procedure TdmKernel_Cliente.DataModuleCreate(Sender: TObject);
begin
  inherited;
  {01-Início do Bloco Framework. Modificações não serão preservadas}
  {99-Final do Bloco Framework. Modificações não serão preservadas}

  //Passa para a classe informacoes dados da tabela de cadastro
  kernel_CaregaConfiguracoes(Kernel_Cadastro.str_Tabela);
end;

procedure TdmKernel_Cliente.kernel_CaregaConfiguracoes(str_tabela: string);
begin
  inherited;
  {Nome do Campo chave da tabela}
  Kernel_Cadastro.str_CampoChave := 'CODCLI';
  {Nome da tela de Cadastro}
  strclass := 'TfrmCadClienteRapido';
  {Titulo da tela}
  kernel_srt_nmformbase := 'Cadastro de Clientes';
end;

end.
