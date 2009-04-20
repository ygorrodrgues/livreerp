{
  Exemplos:
    raise Livre_Mensagem_Global.CreateFmt('Arquivo %s de configuraçoes do projeo não foi encontrado ',['(NomedoProjeto.xpr)']);  
}
unit UKernel_Exception;

interface

uses Dialogs,SysUtils, StrUtils, ShellAPI, ShlObj, Windows, Forms;

type

  Livre_Exception = class(Exception)
   private
    function GetLogFile: String;
    procedure SetLogFile(const Value: String);
   public
     { Desvio nos construtores para efetuar LOG}
     constructor Create(const Msg: string);reintroduce;
     constructor CreateFmt(const Msg: string; const Args: array of const);reintroduce;
     { Nome do arquivo no qual os erros ocorridos são gravados}
     { -Valor default = nfe_exception.log}
     { -Para desativar o log deixe o vazio}
     property LogFile : String read GetLogFile write SetLogFile;
   end;

   { Campo Obrigatorio nao preenchido}
   Livre_Campos_Obrigatorios = class(Livre_Exception);
   { Campo Obrigatorio nao preenchido}
   Livre_Mensagem_Global = class(Livre_Exception);

   procedure AppendToFile (const aString, aFileName : String);

implementation

var
  LOCAL_LogFile : String = 'Livre_exception.log';

{ Livre_Exception }

procedure AppendToFile (const aString, aFileName : String);
var
  F : TextFile;
begin
  AssignFile(F,aFilename);
  if FileExists(aFileName) then
    Append(F)
  else
    Rewrite(F);

  try
    WriteLN(F,aString);
  finally
    Close(F);
  end;

end;

constructor Livre_Exception.Create(const Msg: string);
begin
   inherited;
  If LOCAL_LogFile <> '' then
    AppendToFile(Format ('[%s] %s : %s',[DateTimeToStr(Now),classname,message]),LOCAL_LogFile);
end;

constructor Livre_Exception.CreateFmt(const Msg: string;
  const Args: array of const);
begin
   inherited;
   If LOCAL_LogFile <> '' then
     AppendToFile(Format ('[%s] %s : %s',[DateTimeToStr(Now),classname,message]),LOCAL_LogFile);
end;

function Livre_Exception.GetLogFile: String;
begin
  Result := LOCAL_LogFile;
end;

procedure Livre_Exception.SetLogFile(const Value: String);
begin
  LOCAL_LogFile := Value;
end;

initialization
begin
  LOCAL_LogFile := ExtractFilePath(ParamStr(0)) + LOCAL_LogFile;
end;

end.
