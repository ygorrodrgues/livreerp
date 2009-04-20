unit UntKernelBanco;

interface

type
  TKernelBanco = class
  private
    // Usada para Tabela Master
    FTableName: string;
    FKeyName: string;
    FFieldDescName: string;

    // Usada para tabela de Destalhe
    FItemTableName: string;
    FItemKeyName: string;

    FNomebanco : string;
    FNomeservidor : string;
    function GetKeyName: string;
    procedure SetKeyName(const Value: string);
    function GetTableName: string;
    procedure SetTableName(const Value: string);
    function GetFieldDescName: string;
    procedure SetFieldDescName(const Value: string);
    function GetItemKeyName: string;
    function GetItemTableName: string;
    procedure SetItemKeyName(const Value: string);
    procedure SetItemTableName(const Value: string);
    function GetNomeBanco: string;
    function GetNomeServidor: string;
    procedure SetNomeBanco(const Value: string);
    procedure SetNomeServidor(const Value: string);
  public
    { Public declarations }
    // Usadas para Tabela Master
    property KeyName: string read GetKeyName write SetKeyName;
    property TabelaName: string read GetTableName write SetTableName;
    property FieldDescName: string read GetFieldDescName write SetFieldDescName;

    //Usada para Tabela Detalhe
    property ItemKeyName: string read GetItemKeyName write SetItemKeyName;
    property ItemTabelaName: string read GetItemTableName write SetItemTableName;

    //
    property NomeServidor: string read GetNomeServidor write SetNomeServidor;
    property NomeBanco: string read GetNomeBanco write SetNomeBanco;

    Constructor Create();
    Destructor Destroy();
  end;

implementation

{ TObjBanco }

constructor TKernelBanco.Create;
begin
 //
end;

destructor TKernelBanco.Destroy;
begin
 //
end;

function TKernelBanco.GetFieldDescName: string;
begin
  GetFieldDescName := FFieldDescName;
end;

function TKernelBanco.GetItemKeyName: string;
begin
  GetItemKeyName := FItemKeyName;
end;

function TKernelBanco.GetItemTableName: string;
begin
 GetItemTableName := FItemTableName;
end;

function TKernelBanco.GetKeyName: string;
begin
  GetKeyName := FKeyName;
end;

function TKernelBanco.GetNomeBanco: string;
begin
  GetNomeBanco := FNomebanco;
end;

function TKernelBanco.GetNomeServidor: string;
begin
  GetNomeServidor := FNomeservidor;
end;

function TKernelBanco.GetTableName: string;
begin
  GettableName := FTableName;
end;

procedure TKernelBanco.SetFieldDescName(const Value: string);
begin
  FFieldDescName :=  value;
end;

procedure TKernelBanco.SetItemKeyName(const Value: string);
begin
  FItemKeyName :=  value;
end;

procedure TKernelBanco.SetItemTableName(const Value: string);
begin
  FItemTableName :=  value;
end;

procedure TKernelBanco.SetKeyName(const Value: string);
begin
  FKeyName :=  value;
end;

procedure TKernelBanco.SetNomeBanco(const Value: string);
begin
  FNomebanco :=  value;
end;

procedure TKernelBanco.SetNomeServidor(const Value: string);
begin
  FNomeservidor :=  value;
end;

procedure TKernelBanco.SetTableName(const Value: string);
begin
  FTableName :=  value;
end;

end.

