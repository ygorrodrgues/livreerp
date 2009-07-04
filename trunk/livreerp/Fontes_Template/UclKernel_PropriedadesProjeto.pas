{
  Propriedade
  get = Ler o valor da propriedade
  set = Grava o valor da propriedade
}
unit UclKernel_PropriedadesProjeto;

interface

type
  TKernel_PropriedadesProjeto = class
  private
    Fstr_ImagemSplash : string;
    Fstr_Background : string;
    Fstr_TituloPrograma : string;
    Fstr_SoftHouse : string;

    function Getstr_ImagemSplash: string;
    procedure Setstr_ImagemSplash(const Value: string);
    function Getstr_Background: string;
    procedure Setstr_Background(const Value: string);
    function Getstr_TituloPrograma: string;
    procedure Setstr_TituloPrograma(const Value: string);
    function Getstr_SoftHouse: string;
    procedure Setstr_SoftHouse(const Value: string);
    {Declara as váriaveiss para guardar valor das propriedades}
  public
    property str_ImagemSplash: string read Getstr_ImagemSplash write Setstr_ImagemSplash;
    property str_Background: string read Getstr_Background write Setstr_Background;
    property str_TituloPrograma: string read Getstr_TituloPrograma write Setstr_TituloPrograma;
    property str_SoftHouse: string read Getstr_SoftHouse write Setstr_SoftHouse;

    Constructor Create();
    Destructor Destroy();
  end;

implementation

{ TKernel_PropriedadesProjeto }

constructor TKernel_PropriedadesProjeto.Create;
begin
  str_SoftHouse := 'Vap Informática';
end;

destructor TKernel_PropriedadesProjeto.Destroy;
begin

end;

function TKernel_PropriedadesProjeto.Getstr_Background: string;
begin
  Getstr_Background  := Fstr_Background;
end;

function TKernel_PropriedadesProjeto.Getstr_ImagemSplash: string;
begin
  Getstr_ImagemSplash := Fstr_ImagemSplash;
end;

function TKernel_PropriedadesProjeto.Getstr_SoftHouse: string;
begin
  Getstr_SoftHouse := Fstr_SoftHouse;
end;

function TKernel_PropriedadesProjeto.Getstr_TituloPrograma: string;
begin
  Getstr_TituloPrograma  := Fstr_TituloPrograma;
end;

procedure TKernel_PropriedadesProjeto.Setstr_Background(const Value: string);
begin
  Fstr_Background :=  value;
end;

procedure TKernel_PropriedadesProjeto.Setstr_ImagemSplash(const Value: string);
begin
  Fstr_ImagemSplash :=  value;
end;

procedure TKernel_PropriedadesProjeto.Setstr_SoftHouse(const Value: string);
begin
  Fstr_SoftHouse :=  value;
end;

procedure TKernel_PropriedadesProjeto.Setstr_TituloPrograma(
  const Value: string);
begin
  Fstr_TituloPrograma :=  value;
end;

end.
