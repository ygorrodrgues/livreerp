{
  Propriedade
  get = Ler o valor da propriedade
  set = Grava o valor da propriedade
}
unit UclKernel_Cadastro;

interface

type
  TKernel_Cadastro = class
  private
    Fstr_Tabela: string;
    Fstr_CampoChave: string;
    Fstr_CampoDescricao: string;

    // usada para os itens da mov
    Fstr_ItemTabela: string;
    Fstr_ItemCampoChave: string;
    Fstr_ItemCampoChave_Anterior: string;
    Fstr_CampoChave_Anterior: string;
    Fstr_ItemTabela_Anterior: string;
    Fstr_CampoDescricao_Anterior: string;
    function Getstr_CampoChave: string;
    function Getstr_CampoDescricao: string;
    function Getstr_ItemCampoChave: string;
    function Getstr_ItemTabela: string;
    function Getstr_Tabela: string;
    procedure Setstr_CampoChave(const Value: string);
    procedure Setstr_CampoDescricao(const Value: string);
    procedure Setstr_ItemCampoChave(const Value: string);
    procedure Setstr_ItemTabela(const Value: string);
    procedure Setstr_Tabela(const Value: string);

  public
    // Nome da tabela do cadastro
    property str_Tabela: string read Getstr_Tabela write Setstr_Tabela;
    // Campo descricao da tabela
    property str_CampoDescricao: string read Getstr_CampoDescricao write Setstr_CampoDescricao;
    // Campo chave primaria da tabela
    property str_CampoChave: string read Getstr_CampoChave write Setstr_CampoChave;

    // Tabela Detalhe
    property str_ItemTabela: string read Getstr_ItemTabela write Setstr_ItemTabela;
    // Campo chave da tabela detalhe
    property str_ItemCampoChave: string read Getstr_ItemCampoChave write Setstr_ItemCampoChave;

    // Dados anteriores

     property str_Tabela_Anterior: string read Getstr_Tabela write Setstr_Tabela;
    // Campo descricao da tabela
    property str_CampoDescricao_Anterior: string read Fstr_CampoDescricao_Anterior write Fstr_CampoDescricao_Anterior;
    // Campo chave primaria da tabela
    property str_CampoChave_Anterior: string read Fstr_CampoChave_Anterior write Fstr_CampoChave_Anterior;

    // Tabela Detalhe
    property str_ItemTabela_Anterior: string read Fstr_ItemTabela_Anterior write Fstr_ItemTabela_Anterior;
    // Campo chave da tabela detalhe
    property str_ItemCampoChave_Anterior: string read Fstr_ItemCampoChave_Anterior write Fstr_ItemCampoChave_Anterior;

    Constructor Create();
    Destructor Destroy();

  end;

implementation

uses UKernel_SysUtils;

{ TObjBanco }


{ TKernel_Cadastro }

constructor TKernel_Cadastro.Create;
begin

end;

destructor TKernel_Cadastro.Destroy;
begin

end;

function TKernel_Cadastro.Getstr_CampoChave: string;
begin
  Getstr_CampoChave := Fstr_CampoChave;
end;

function TKernel_Cadastro.Getstr_CampoDescricao: string;
begin
  Getstr_CampoDescricao := Fstr_CampoDescricao;
end;

function TKernel_Cadastro.Getstr_ItemCampoChave: string;
begin
  Getstr_ItemCampoChave := Fstr_ItemCampoChave;
end;

function TKernel_Cadastro.Getstr_ItemTabela: string;
begin
  Getstr_ItemTabela := Fstr_ItemTabela;
end;

function TKernel_Cadastro.Getstr_Tabela: string;
begin
  Getstr_Tabela := Fstr_Tabela;
end;

procedure TKernel_Cadastro.Setstr_CampoChave(const Value: string);
begin
  Fstr_CampoChave :=  value;
end;

procedure TKernel_Cadastro.Setstr_CampoDescricao(const Value: string);
begin
  Fstr_CampoDescricao :=  value;
end;

procedure TKernel_Cadastro.Setstr_ItemCampoChave(const Value: string);
begin
  Fstr_ItemCampoChave :=  value;
end;

procedure TKernel_Cadastro.Setstr_ItemTabela(const Value: string);
begin
  Fstr_ItemTabela :=  value;
end;

procedure TKernel_Cadastro.Setstr_Tabela(const Value: string);
begin
  Fstr_Tabela :=  value;
end;

end.

