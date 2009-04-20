unit UntKernel_Classe_SQLServer;

interface

uses
  untKernel_Interface_RegrasBD;
  
type
  TRegrasSQLServer = class(TInterfacedObject, IRegrasBD)
  private
    FUsuario: string;
    FSenha: string;
  protected
    {Métodos Obrigatórios da Interface das RegrasBD}
    function GetDriverName: string;
    function GetLibraryName: string;
    function GetVendorLib: string;
    function Getstr_usuario: string;
    function Getstr_senha: string;
    procedure Setstr_usuario(const Value: string);
    procedure Setstr_senha(const Value: string);
    {Fim dos Métodos da Interface RegrasBD}
  public
    constructor Create;
    destructor Destroy; override;
    property DriverName: string read GetDriverName;
    property LibraryName: string read GetLibraryName;
    property VendorLib: string read GetVendorLib;
    // Guarda o nome do usuario do db
    property str_usuario: string read Getstr_usuario write Setstr_usuario;
    // Guarda o nome da senha do db    
    property str_senha: string read Getstr_senha write Setstr_senha;
  end;

implementation

uses SysUtils, Uclkernel_Config, UKernel_VariaveisPublic;

{ TRegrasSQLServer }

constructor TRegrasSQLServer.Create;
begin
  str_usuario    :=  Kernel_Config.Kernel_LerTexto('CONEXAO','USUARIO',TiConexao);
  str_senha      :=  Kernel_Config.Kernel_LerTexto('CONEXAO','SENHA',TiConexao);
end;

destructor TRegrasSQLServer.Destroy;
begin

  inherited;
end;

function TRegrasSQLServer.GetDriverName: string;
begin
  Result := 'MSSQL';
end;

function TRegrasSQLServer.GetLibraryName: string;
begin
  Result := 'dbxmss.dll';
end;

function TRegrasSQLServer.Getstr_senha: string;
begin
   Result := FSenha;
end;

function TRegrasSQLServer.Getstr_usuario: string;
begin
  Result := FUsuario;
end;

function TRegrasSQLServer.GetVendorLib: string;
begin
  Result := 'oledb';
end;

procedure TRegrasSQLServer.Setstr_senha(const Value: string);
begin
  if (Trim(Value) = '') then
    FSenha := 'sa'
  else
    FSenha := Value;
end;

procedure TRegrasSQLServer.Setstr_usuario(const Value: string);
begin
  if (Trim(Value) = '') then
    FUsuario := ''
  else
    FUsuario := Value;
end;

end.


