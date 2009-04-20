unit UntKernelClasseOracle;

interface

uses
  UntKernelInterfaceRegrasBD;

type
  TRegrasOracle = class(TInterfacedObject, IRegrasBD)
  private
    FUsuario: string;
    FSenha: string;
  protected
    { Métodos Obrigatórios da Interface das
      RegrasBD }
    function GetDriverName: string;
    function GetLibraryName: string;
    function GetVendorLib: string;
    function GetUsuario: string;
    function GetSenha: string;
    procedure SetUsuario(const Value: string);
    procedure SetSenha(const Value: string);
    {Fim dos Métodos da Interface RegrasBD}
  public
    constructor Create;
    destructor Destroy; override;
    property DriverName: string read GetDriverName;
    property LibraryName: string read GetLibraryName;
    property VendorLib: string read GetVendorLib;
    property Usuario: string read GetUsuario write
      SetUsuario;
    property Senha: string read GetSenha write
      SetSenha;
  end;

implementation

uses SysUtils;

{ TRegrasOracle }

constructor TRegrasOracle.Create;
begin
   SetUsuario('');
   SetSenha('');
end;

destructor TRegrasOracle.Destroy;
begin

  inherited;
end;

function TRegrasOracle.GetDriverName: string;
begin
  Result := 'Oracle';
end;

function TRegrasOracle.GetLibraryName: string;
begin
  Result := 'dbxora30.dll';
end;

function TRegrasOracle.GetSenha: string;
begin
   Result := FSenha;
end;

function TRegrasOracle.GetUsuario: string;
begin
   Result := FUsuario;
end;

function TRegrasOracle.GetVendorLib: string;
begin
  Result := 'oci.dll'
end;

procedure TRegrasOracle.SetSenha(const Value: string);
begin
  if (Trim(Value) = '') then
    FSenha := 'system'
  else
    FSenha := Value;
end;

procedure TRegrasOracle.SetUsuario(const Value: string);
begin
  if (Trim(Value) = '') then
    FUsuario := 'manager'
  else
    FUsuario := Value;
end;

end.


