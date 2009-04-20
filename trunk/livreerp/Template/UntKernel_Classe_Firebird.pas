unit UntKernel_Classe_Firebird;

interface

uses
  untKernel_Interface_RegrasBD;
  
type
  TRegrasFirebird = class(TInterfacedObject, IRegrasBD)
  private
    FUsuario: string;
    FSenha: string;
  protected
    {Métodos Obrigatórios da Interface das RegrasBD}
    function GetDriverName: string;
    function GetLibraryName: string;
    function GetVendorLib: string;
    function Getstr_Usuario: string;
    function Getstr_Senha: string;
    procedure Setstr_Usuario(const Value: string);
    procedure Setstr_Senha(const Value: string);
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

uses SysUtils, UKernel_VariaveisPublic, Uclkernel_Config;

{ TRegrasFirebird }
constructor TRegrasFirebird.Create;
begin
  str_usuario    :=  Kernel_Config.Kernel_LerTexto('CONEXAO','USUARIO',TiConexao);
  str_senha      :=  Kernel_Config.Kernel_LerTexto('CONEXAO','SENHA',TiConexao);
end;

destructor TRegrasFirebird.Destroy;
begin

  inherited;
end;

function TRegrasFirebird.GetDriverName: string;
begin
  Result := 'Interbase';
end;

function TRegrasFirebird.GetLibraryName: string;
begin
  Result := 'dbxint.dll';
end;

function TRegrasFirebird.Getstr_Senha: string;
begin
   Result := FSenha;
end;

function TRegrasFirebird.Getstr_Usuario: string;
begin
  Result := FUsuario;
end;

function TRegrasFirebird.GetVendorLib: string;
begin
  Result := 'fbclient.dll';
end;

procedure TRegrasFirebird.Setstr_Senha(const Value: string);
begin
  if (Trim(Value) = '') then
    FSenha := 'masterkey'
  else
    FSenha := Value;
end;

procedure TRegrasFirebird.Setstr_Usuario(const Value: string);
begin
  if (Trim(Value) = '') then
    FUsuario := 'SYSDBA'
  else
    FUsuario := Value;
end;

end.


