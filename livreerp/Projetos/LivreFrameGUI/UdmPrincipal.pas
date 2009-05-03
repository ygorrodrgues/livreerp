unit UdmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernelPrincipal, WideStrings, FMTBcd, ADODB, SqlExpr, DB,
  DBClient, Provider, DBXDynalink, DBXMsSQL, inifiles, UclConfiguracoes_Framework,
  untKernel_Interface_RegrasBD;

type
  TdmPrincipal = class(TdmKernelPrincipal)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private

  public
    procedure ConectaServidor; override;
    procedure DesconectaServidor; override;
    procedure DepoisConectaServidor; virtual;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

uses UclKernel_Conexao, UKernel_VariaveisPublic, VariaveisFramework;

{$R *.dfm}

{ TdmPrincipal }

procedure TdmPrincipal.ConectaServidor;
begin
  inherited;

end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  // Informa qual banco de dados o projeto vai usar
  Tipo_DB := bdFirebird;
  inherited;
  {Instancia Classe de parametros de conexao com o banco}
  Configuracoes_Framework := TConfiguracoes_Framework.Create;

  // Passa a conexao atual para uma variavel
  FConexao := conPrincipalKernel;
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  {Libera objetos da memoria}
  Configuracoes_Framework.Free;
end;

procedure TdmPrincipal.DepoisConectaServidor;
begin

end;

procedure TdmPrincipal.DesconectaServidor;
begin
  inherited;

end;

end.
