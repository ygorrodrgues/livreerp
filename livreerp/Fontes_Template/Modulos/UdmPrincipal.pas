unit UdmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernelPrincipal, WideStrings, FMTBcd, ADODB, SqlExpr, DB,
  DBClient, Provider, DBXDynalink, DBXMsSQL, inifiles, AppProt, untKernel_Interface_RegrasBD;

type
  TdmPrincipal = class(TdmKernelPrincipal)
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    procedure ConectaServidor; override;
    procedure DesconectaServidor; override;
    procedure DepoisConectaServidor; virtual;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

uses UclKernel_Conexao, UKernel_VariaveisPublic;

{$R *.dfm}

{ TdmPrincipal }

procedure TdmPrincipal.ConectaServidor;
begin
  inherited;

end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  // Define qual o banco de dados sera utilizado
  Tipo_DB:= bdSQLServer;
  inherited;

  // Passa a conexao atual para uma variavel
  FConexao := conPrincipalKernel;
end;

procedure TdmPrincipal.DepoisConectaServidor;
begin

end;

procedure TdmPrincipal.DesconectaServidor;
begin
  inherited;

end;

end.
