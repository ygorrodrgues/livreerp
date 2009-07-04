{
  Propriedade
  get = Ler o valor da propriedade
  set = Grava o valor da propriedade
}
unit UclKernel_Login;

interface

uses
  SqlExpr, SysUtils;

type
  TKernel_Login = class
  private
    {Declara as váriaveiss para guardar valor das propriedades}
    Fint_codusu : Integer;
    Fstr_nomeusu : string;
    Fstr_adminusu : string;
    Fstr_Expirausu : string;
    Fdt_DataExpusu : TDateTime;
    Fstr_Tabela_Parametro: string;
    Fstr_Qtd_Tent_Login: string;
    function Getint_codusu: integer;
    procedure Setint_codusu(const Value: integer);
    function Getstr_nomeusu: string;
    procedure Setstr_nomeusu(const Value: string);
    function Getstr_adminusu: string;
    procedure Setstr_adminusu(const Value: string);
    function Getstr_Expirausu: string;
    procedure Setstr_Expirausu(const Value: string);
    function Getdt_DataExpusu: TDateTime;
    procedure Setdt_DataExpusu(const Value: TDateTime);
  public
    // 
    property int_codusu: integer read Getint_codusu write Setint_codusu;
    property str_nomeusu: string read Getstr_nomeusu write Setstr_nomeusu;
    property str_adminusu: string read Getstr_adminusu write Setstr_adminusu;
    property str_Expirausu: string read Getstr_Expirausu write Setstr_Expirausu;
    property dt_DataExpusu: TDateTime read Getdt_DataExpusu write Setdt_DataExpusu;

    // Parametro
    property str_Tabela_Parametro: string read Fstr_Tabela_Parametro write Fstr_Tabela_Parametro;
    property str_Qtd_Tent_Login: string read Fstr_Qtd_Tent_Login write Fstr_Qtd_Tent_Login;    

    Constructor Create();
    Destructor Destroy();

    {Retorna a quantidades de tentativas de erros aceitadas pelo sistema}
    function Login_RetornaQuantidadeTentativa:Integer;
  end;


implementation

uses UKernel_DB, UKernel_VariaveisPublic;

{ TKernel_Login }

constructor TKernel_Login.Create;
begin

end;

destructor TKernel_Login.Destroy;
begin

end;

function TKernel_Login.Getdt_DataExpusu: TDateTime;
begin
  Getdt_DataExpusu := Fdt_DataExpusu;
end;

function TKernel_Login.Getint_codusu: integer;
begin
  Getint_codusu := Fint_codusu;
end;

function TKernel_Login.Getstr_adminusu: string;
begin
  Getstr_adminusu := Fstr_adminusu;
end;

function TKernel_Login.Getstr_Expirausu: string;
begin
  Getstr_Expirausu := Fstr_Expirausu;
end;

function TKernel_Login.Getstr_nomeusu: string;
begin
  Getstr_nomeusu := Fstr_nomeusu;
end;

function TKernel_Login.Login_RetornaQuantidadeTentativa: Integer;
var
  Qry:TsqlQuery;
begin
  qry := InstanciaQuery; {: cria uma instância do objeto}
  try
    with Qry do
    begin
      close;
      SQL.Clear;
      SQL.Add('SELECT '+ Kernel_Login.str_Qtd_Tent_Login +' FROM '+ Kernel_Login.str_Tabela_Parametro);
      Open;

      result := FieldByName(Kernel_Login.str_Qtd_Tent_Login).asinteger;
    end;
  finally
    FreeAndNil(Qry);  {: libera o objeto da memória}
  end;
end;

procedure TKernel_Login.Setdt_DataExpusu(const Value: TDateTime);
begin
  Fdt_DataExpusu :=  value;
end;

procedure TKernel_Login.Setint_codusu(const Value: integer);
begin
  Fint_codusu :=  value;
end;

procedure TKernel_Login.Setstr_adminusu(const Value: string);
begin
  Fstr_adminusu :=  value;
end;

procedure TKernel_Login.Setstr_Expirausu(const Value: string);
begin
  Fstr_Expirausu :=  value;
end;

procedure TKernel_Login.Setstr_nomeusu(const Value: string);
begin
  Fstr_nomeusu :=  value;
end;

end.
