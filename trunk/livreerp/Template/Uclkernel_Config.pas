unit Uclkernel_Config;

interface

uses IniFiles, Forms, SysUtils, Controls;

type
  TTipo_INI = (TiConexao, TiTerminal, TiECF) ;

  type
    TKernel_Config = class
  private
    FTipoINI: TTipo_INI;
  public
    property kc_TipoINI : TTipo_INI read FTipoINI write FTipoINI;

    // ---------------- Grava Ini ---------------------------------------------------------
    // Gravar Texto em Arquivo de Configuração
    procedure Kernel_SalvaTexto(strSessao, strChave, strTexto : String; ini: TTipo_INI);
    // Gravar Inteiro em Arquivo de Configuração
    procedure Kernel_SalvaInteiro(strSessao, strChave : String; const intValor : Integer; ini: TTipo_INI);
    // Gravar Booleano em Arquivo de COnfiguração
    procedure Kernel_SalvaBooleano(strSessao,strChave : String; const bolValor : Boolean; ini: TTipo_INI);
    // Gravar Data em Arquivo de COnfiguração
    procedure Kernel_SalvaData(strSessao,strChave : String; const datValor : TDate; ini: TTipo_INI);
    // Gravar Hora em Arquivo de COnfiguração
    procedure Kernel_SalvaHora(strSessao,strChave : String; const datValor : TTime; ini: TTipo_INI);
    // Gravar Data e Hora em Arquivo de COnfiguração
    procedure Kernel_SalvaDataHora(strSessao,strChave : String; const datValor : TDateTime; ini: TTipo_INI);
    // Gravar Real em Arquivo de COnfiguração
    procedure Kernel_SalvaReal(strSessao,strChave : String; const fltValor : Real; ini: TTipo_INI);
    // ----------------- ler ini -------------------------------------------------------
    // Ler Texto do Arquivo de Configuração
    function Kernel_LerTexto(strSessao,StrChave : String; ini: TTipo_INI) : String;
    // Ler Texto do Arquivo de Configuração
    function Kernel_LerInteiro(strSessao,StrChave : String; ini: TTipo_INI) : Integer;
    // Ler Texto do Arquivo de Configuração
    function Kernel_LerBooleano(strSessao,StrChave : String; ini: TTipo_INI) : boolean;
    // Ler Texto do Arquivo de Configuração
    function Kernel_LerData(strSessao,StrChave : String; ini: TTipo_INI) : TDate;
    // Ler Texto do Arquivo de Configuração
    function Kernel_LerHora(strSessao,StrChave : String; ini: TTipo_INI) : TTime;
    // Ler Texto do Arquivo de Configuração
    function Kernel_LerDataHora(strSessao,StrChave : String; ini: TTipo_INI) : TDateTime;
    // Ler Texto do Arquivo de Configuração
    function Kernel_LerReal(strSessao,StrChave : String; ini: TTipo_INI) : Real;

    // Retorna o Path onde o Programa Principal está
    function Kernel_path(ini: TTipo_INI) : string;
  end;

implementation

uses DateUtils, UKernel_Mensagem;

//==============================================================================
function TKernel_Config.Kernel_path(ini: TTipo_INI) : string;
 var
 str_arquivo: string;
begin
  case ini of
    TiConexao : str_arquivo := Kernel_arquivo_ConexaoDB;
    TiTerminal : str_arquivo := Kernel_arquivo_Terminal;
  end;

  result := ExtractFilePath(Application.ExeName) + str_arquivo;
end;

//==============================================================================
procedure TKernel_Config.Kernel_SalvaTexto(strSessao, strChave, strTexto : String; ini: TTipo_INI);
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    WriteString(strSessao, strChave, strTexto);
  Finally
    Free;
  end;
end;

//==============================================================================
procedure TKernel_Config.Kernel_SalvaInteiro(strSessao, strChave : String; const intValor : Integer; ini: TTipo_INI);
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    WriteInteger(strSessao, strChave, intValor);
  Finally
    Free;
  end;
end;
//==============================================================================
procedure TKernel_Config.Kernel_SalvaBooleano(strSessao,strChave : String; const bolValor : Boolean; ini: TTipo_INI);
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    WriteBool(strSessao,strChave,bolValor);
  Finally
    Free;
  end;
end;

//==============================================================================
procedure TKernel_Config.Kernel_SalvaData(strSessao,strChave : String; const datValor : TDate; ini: TTipo_INI);
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    WriteDate(strSessao,strChave,datValor);
  Finally
    Free;
  end;
end;

//==============================================================================
procedure TKernel_Config.Kernel_SalvaHora(strSessao,strChave : String; const datValor : TTime; ini: TTipo_INI);

begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    WriteTime(strSessao,strChave,datValor);
  Finally
    Free;
  end;
end;

//==============================================================================
procedure TKernel_Config.Kernel_SalvaDataHora(strSessao,strChave : String; const datValor : TDateTime; ini: TTipo_INI);
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    WriteDateTime(strSessao,strChave,datValor);
  Finally
    Free;
  end;
end;

//==============================================================================
procedure TKernel_Config.Kernel_SalvaReal(strSessao,strChave : String; const fltValor : Real; ini: TTipo_INI);
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    WriteFloat(strSessao,strChave,fltValor);
  Finally
    Free;
  end;
end;

//==============================================================================
function TKernel_Config.Kernel_LerTexto(strSessao,StrChave : String; ini: TTipo_INI) : String;
var
  strvalor : String;
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    strValor := ReadString(strSessao,strChave, strValor);
  Finally
    Free;
  end;
  result := strValor;
end;

//==============================================================================
function TKernel_Config.Kernel_LerInteiro(strSessao,StrChave : String; ini: TTipo_INI) : INteger;
var
  intValor : Integer;
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    intValor := ReadInteger(strSessao,strChave,0);
  Finally
    Free;
  end;
  result := intValor;
end;

//==============================================================================
function TKernel_Config.Kernel_LerBooleano(strSessao,StrChave : String; ini: TTipo_INI) : boolean;
var
  bolResult : boolean;
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    bolResult := ReadBool(strSessao,strChave, false);
  Finally
    Free;
  end;
  result := bolResult;
end;

//==============================================================================
function TKernel_Config.Kernel_LerData(strSessao,StrChave : String; ini: TTipo_INI) : TDate;
var
  datData : TDate;
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    datData := ReadDate(strSessao,strChave, EncodeDate(00,00,00));
  Finally
    Free;
  end;
  result := datData;
end;

//==============================================================================
function TKernel_Config.Kernel_LerHora(strSessao,StrChave : String; ini: TTipo_INI) : TTime;
var
  datHora : TTime;
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    datHora := ReadTime(strSessao,strChave, EncodeTime(00,00,00,00));
  Finally
    Free;
  end;
  result := datHora;
end;

//==============================================================================
function TKernel_Config.Kernel_LerDataHora(strSessao,StrChave : String; ini: TTipo_INI) : TDateTime;
var
  datDataHora : TDateTime;
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    datDataHora :=  ReadDateTime(strSessao,strChave, EncodeDateTime(00,00,00,00,00,00,00));
  Finally
    Free;
  end;
  result := datDataHora;
end;

//==============================================================================
function TKernel_Config.Kernel_LerReal(strSessao,StrChave : String; ini: TTipo_INI) : Real;
var
  fltvalor : Real;
begin
  // Cria Arquivo INI na pasta do Aplicativo
  with TIniFile.Create(Kernel_path(ini)) do
  Try
    fltvalor := ReadFloat(strSessao,strChave, 0);
  Finally
    Free;
  end;
  result := fltValor;
end;
//==============================================================================
end.
