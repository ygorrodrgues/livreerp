{
  Propriedade
  get = Ler o valor da propriedade
  set = Grava o valor da propriedade
}
unit UclKernel_Conexao;

interface

uses
  SysUtils, IniFiles, untKernel_Interface_RegrasBD;

type
  TKernel_Conexao = class
  private
    {Declara as váriaveiss para guardar valor das propriedades}
    Fstr_server: string;
    Fstr_database: string;
    Fstr_usuario: string;
    Fstr_senha: string;

    function Getstr_server: string;
    procedure Setstr_server(const Value: string);
    function Getstr_database: string;
    procedure Setstr_database(const Value: string);
    
    procedure CaregaConexao;
  public
    // Guarda o nome do servidor de db
    property str_server: string read Getstr_server write Setstr_server;
    // Guarda o nome do banco de dados
    property str_database: string read Getstr_database write Setstr_database;

    Constructor Create();
    Destructor Destroy();
  end;

implementation

uses UKernel_Mensagem, Uclkernel_Config, UKernel_VariaveisPublic;

{ TKernel_Conexao }

procedure TKernel_Conexao.CaregaConexao;
var
  F : TextFile;
  str_temp: string;
  str_tpserver, str_tpdatabase: string;
begin
  case TTipo_CON(Tipo_CON) of
    CONarq_texto: Begin
                    AssignFile(F,'conexao.ini');
                    Reset(F);
                    Readln(F,str_tpserver);
                    Readln(F,str_tpdatabase);
                    Readln(F,str_temp);
                    Readln(F,str_temp);
                    CloseFile(F);

                    str_server := str_tpserver;
                    str_database := str_tpdatabase;
                  End;
                  
    CONLivre :  Begin
                  { Carega os parametros de conexao do arquivo ini }
                  str_server     :=  Kernel_Config.Kernel_LerTexto('CONEXAO','SERVIDOR',TiConexao);
                  str_database   :=  Kernel_Config.Kernel_LerTexto('CONEXAO','BANCO',TiConexao);
                End;
  end;
end;

constructor TKernel_Conexao.Create;
begin
  CaregaConexao;
end;

destructor TKernel_Conexao.Destroy;
begin
  //
end;

function TKernel_Conexao.Getstr_database: string;  // Ler
begin
  Getstr_database := Fstr_database;
end;

function TKernel_Conexao.Getstr_server: string; // Ler
begin
  Getstr_server := Fstr_server;
end;

procedure TKernel_Conexao.Setstr_database(const Value: string);// Grava
begin
  Fstr_database :=  value;
end;

procedure TKernel_Conexao.Setstr_server(const Value: string); // Grava
begin
  Fstr_server :=  value;
end;

end.
