unit UclConfiguracoes_Framework;

interface

type
  TConfiguracoes_Framework = class
  private
    Fstr_pasta_projeto: string;
    Fstr_pasta_template: string;

  public
    property str_pasta_projeto: string read Fstr_pasta_projeto write fstr_pasta_projeto;
    property str_pasta_template: string read Fstr_pasta_template write fstr_pasta_template;

    Constructor Create();
    Destructor Destroy();
  end;

implementation

{ TConfiguracoes_Framework }

constructor TConfiguracoes_Framework.Create;
begin

end;

destructor TConfiguracoes_Framework.Destroy;
begin

end;

end.
