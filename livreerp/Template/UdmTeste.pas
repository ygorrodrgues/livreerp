{
 Empresa....: 
 Programa...: LivreERP
 Sistema....: 
 Data.......: 24/02/2009
 Versão.....: 
 Analista...: 
 Programador:
 Criação....: LivreFrame Wizard - Versão:1 - Release: 0
}

unit UdmTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_CadBase, FMTBcd, DB, DBClient, Provider, SqlExpr, frxClass,
  frxDBSet, frxDesgn;

type
  TdmTeste = class(TdmKernel_CadBase)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure kernel_CaregaConfiguracoes();override;
  end;

var
  dmTeste: TdmTeste;

implementation

uses UclKernel_Cadastro, UKernel_VariaveisPublic, UdmPrincipal;

{$R *.dfm}

procedure TdmTeste.DataModuleCreate(Sender: TObject);
begin
  inherited;
  {01-Início do Bloco Framework. Modificações não serão preservadas}
  {99-Final do Bloco Framework. Modificações não serão preservadas}

  //Passa para a classe informacoes dados da tabela de cadastro
  kernel_CaregaConfiguracoes();
end;
  
procedure TdmTeste.kernel_CaregaConfiguracoes();
begin
  inherited;
  {Nome da tabela}
  Kernel_Cadastro.str_Tabela := 'TESTE';
  {Nome do Campo chave da tabela}
  Kernel_Cadastro.str_CampoChave := 'CODTESTE';
  {Nome da tela de Cadastro}
  strclass := 'TfrmCadTeste';
  {Titulo da tela}
  kernel_srt_nmformbase := 'Teste';
end;

end.
