unit UKernel_Security;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Registry;

Procedure registrarprg;
procedure violacao;
procedure alugaprograma;
procedure maiscincodias;
procedure EscolhadeProtecao;
{Verifica numero do serial do HD}
Function SerialNum(FDrive:String) :String;
Function Gera_Senha(Name: string; Key: string):string;
{Direciona o Diretorio do Windows}
function DirWindows: string;
procedure versituacao;
procedure CriaProtecao;
procedure VerAluguel;
procedure Ver5dias;
function ReadRegInt(sPath: HKey; sOpenKey, sNomeValue: string; sValue: integer): integer;
function ObtemData(dwChaveRaiz: DWord; const strChave,strCampo: string): TDateTime;
function Encript(Encript : String): string;
function Decript(Decript : String): string;
{fim dos procedures de proteção do programa}


implementation

uses UKernel_DATA;

{-------------------------------------------------------------------------------
  Procedure: Encript
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: Encript : String
  Result:    string
-------------------------------------------------------------------------------}
function Encript(Encript : String): string;
var
  Cod: String;
  Codi_go: String;
  Qt_Expc: Integer;
  X : Integer;
  POrd: Integer;
  D: string;
begin
  Cod := Encript;
  Codi_go := '';
  Qt_Expc := Length(Encript);
  for X := QT_EXPC downto 1 do
    Codi_go := Codi_go + Copy(Cod,X,1);
    Cod:= '';
  for X := 1 TO Qt_Expc do
    begin
      D:= Copy(Codi_go,X,1);
      Pord := Ord(D[1]);
      if X/2 = INT(X/2) then
        Cod := Cod+CHR(Pord+1)
       else
        Cod := Cod+CHR(Pord-1);
    end;
   Codi_go := Cod;
   Result := Codi_go;
end;

{-------------------------------------------------------------------------------
  Procedure: Decript
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: Decript : String
  Result:    string
-------------------------------------------------------------------------------}
function Decript(Decript : String): string;
var
  Cod: String;
  Codi_go: String;
  Qt_Expc: Integer;
  X : Integer;
  POrd: Integer;
  D: string;
  Resto: Integer;
begin
Cod := Decript;
Codi_go := '';
Qt_Expc := Length(Decript);
Resto := Length(Decript) mod 2;
for X := QT_EXPC downto 1 do
Codi_go := Codi_go + Copy(Cod,X,1);
Cod:= '';
for X := 1 TO Qt_Expc do
begin
D:= Copy(Codi_go,X,1);
Pord := Ord(D[1]);
if Resto > 0 then
begin
if not (X/2 = INT(X/2)) then
Cod := Cod+CHR(Pord+1)
else
Cod := Cod+CHR(Pord-1);
end
else
begin
if X/2 = INT(X/2) then
Cod := Cod+CHR(Pord+1)
else
Cod := Cod+CHR(Pord-1);
end;
end;
Codi_go := Cod;
Result := Codi_go;
end;

{-------------------------------------------------------------------------------
  Procedure: versituacao
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: None
  Result:    None
-------------------------------------------------------------------------------}
procedure versituacao;
var
  Reg: TRegistry;
  Situacao:integer;
  DataValidade,DataAcesso:TDate;
begin
try
  Reg:= TRegistry.Create;
  // se nao existir a chave no registro cria
  if not Reg.KeyExists('ProtS2') then
  begin
    IF fileExists(DirWindows+'\system\stma.txt') or
      fileExists(DirWindows+'\system\alg.txt') or
      fileExists(DirWindows+'\vrfc.txt') then
      Application.MessageBox('Será criado permissão de uso para 5 dias visto você já conhecer o Seu Programa!',
      'Bem vindo ao Seu Programa 3', MB_ICONINFORMATION + MB_OK ) else
        Application.MessageBox('Será criado permissão de uso para 30 dias!','Bem vindo ao Seu Programa 3',
         MB_ICONINFORMATION + MB_OK );
         
       CriaProtecao;
       VerSituacao;
  end
 else
  begin
    // se existir a chave verifica a situacao
    Reg.OpenKey('ProtS2',True);
    situacao:=ReadRegInt(HKEY_CURRENT_USER,'ProtS2','Sit',situacao);
    DataValidade:=ObtemData(HKEY_CURRENT_USER,'ProtS2','Data_Limite');
    DataAcesso:=ObtemData(HKEY_CURRENT_USER,'ProtS2','Data_Ultmacs');

    // Caso nao seja nenhuma das situacoes libera o acesso
    case situacao of
      0: VerAluguel;
      1: Ver5dias;
      3: violacao;
    end;

  end;
finally
  Reg.CloseKey;
end;

end;

{direção para diretorio do windos}
{-------------------------------------------------------------------------------
  Procedure: DirWindows
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: None
  Result:    string
-------------------------------------------------------------------------------}
function DirWindows: string;
var
  Dir: array[0..255] of char;
begin
  GetWindowsDirectory(Dir, 255);
  Result := StrPas(Dir);
end;

{gera senha para proteção}
{-------------------------------------------------------------------------------
  Procedure: Gera_Senha
  Author:    Administrador
  DateTime:  2007.05.06
  Arguments: Name: string; Key: string
  Result:    string
-------------------------------------------------------------------------------}
Function Gera_Senha(Name: string; Key: string):string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(Name) do
   Result := Result + IntToHex(Ord(Name[I]) xor Ord(Key[(I mod Length(Key) + 1)]), 2);
end;

{pega o serial fisico do HD}

{-------------------------------------------------------------------------------
  Procedure: SerialNum
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: FDrive:String
  Result:    String
-------------------------------------------------------------------------------}
Function SerialNum(FDrive:String) :String;
Var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
Try
  GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
Result := IntToHex(Serial,8);
Except
 Result :='';
end;
end;

{Procedimento se houver violação da data do sistema, se a pessoa quer voltar a data para ganhar mais tempo}

{-------------------------------------------------------------------------------
  Procedure: violacao
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: None
  Result:    None
-------------------------------------------------------------------------------}
procedure violacao;
var
  Reg: TRegistry;
  choix: integer;
begin
try
  Reg:= TRegistry.Create;
try
  Reg.OpenKey('ProtS2',True);
  Reg.WriteInteger('Sit',3); //0=aluguel 30 dias, 1=+ 5 dias , 2=registro do programa final e 3= violacao da data do sistema
except
  on E: Exception do ShowMessage(E.Message);
end;

If choix=6 then
  alugaprograma else Application.Terminate;

finally
  Reg.CloseKey;
end;

end;

{cria a proteção do programa}

{-------------------------------------------------------------------------------
  Procedure: CriaProtecao
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: None
  Result:    None
-------------------------------------------------------------------------------}
procedure CriaProtecao;
var
  arq: TextFile;
  Reg: TRegistry;
begin
  if not FileExists(DirWindows+'\inf\xxxx1.txt') then
  //vs. 2.09.00 Acrescentado 30/11/06 se o usuario retirar a proteção no registro
begin
AssignFile ( arq, DirWindows+'\inf\xxxx1.txt');
Rewrite(arq, DirWindows+'\inf\xxxx1.txt');
FileSetAttr (DirWindows+'\inf\xxxx1.txt',3);
closefile(arq);
Reg:= TRegistry.Create;
if not Reg.KeyExists('ProtS2') then
begin
Reg.CreateKey('ProtS2');
Reg.OpenKey('ProtS2',True);
if not Reg.ValueExists('Data_Limite') then
try
IF fileExists(DirWindows+'\system\stm.txt')then
Reg.WriteDate('Data_Limite',Kernel_IncrementaDataDias(now,5)) else
IF fileExists(DirWindows+'\vrfc.txt') then
Reg.WriteDate('Data_Limite',Kernel_IncrementaDataDias(now,5)) else
IF fileExists(DirWindows+'\system\alg.txt') then
Reg.WriteDate('Data_Limite',Kernel_IncrementaDataDias(now,5)) else
Reg.WriteDate('Data_Limite',Kernel_IncrementaDataDias(now,30));
except
on E: Exception do ShowMessage(E.Message);
end;
if not Reg.ValueExists('Data_Ultmacs') then
try
Reg.WriteDate('Data_Ultmacs',date);
except
on E: Exception do ShowMessage(E.Message);
end;
if not Reg.ValueExists('Sit') then
try
Reg.WriteInteger('Sit',0);
//0=aluguel 30 dias, 1=+ 5 dias , 2=registro do programa final e 3= violacao da data do sistema
except
on E: Exception do ShowMessage(E.Message);
end;
Reg.CloseKey;
end;
end
else
begin
SHowMessage('Houve violação no registro do Sistema,você terá que escolher a forma de registro');
EscolhadeProtecao;
end;
end;

{-------------------------------------------------------------------------------
  Procedure: EscolhadeProtecao
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: None
  Result:    None
-------------------------------------------------------------------------------}
procedure EscolhadeProtecao;
var
  opcao:string;
begin
Application.MessageBox('Venceu o prazo de licenciamento do Sistema!','Aviso do Sistema', MB_ICONINFORMATION + MB_OK );
opcao := InputBox('Registrar, Alugar ou mais 5 Dias', 'Digite: (1) Registrar, (2) Alugar, (3) + 5 Dias:', '');
if opcao ='1' then Registrarprg else
if opcao ='2' then AlugaPrograma else
if opcao ='3' then MaisCincoDias else
if (opcao <> '1') and (opcao <> '2') and (opcao <> '3')
then
begin
Application.MessageBox('Opção de escolha incorreta, será encerrado o sistema!','Erro de Escolha', MB_ICONSTOP + MB_OK );
Application.Terminate;
end;

end;

{registra o programa definitivamente}

{-------------------------------------------------------------------------------
  Procedure: registrarprg
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: None
  Result:    None
-------------------------------------------------------------------------------}
Procedure registrarprg;
var
  Reg: TRegistry;
  senha,habilita:string;
  DataValidade,DataAcesso:TDate;
begin
try
Reg:= TRegistry.Create;
try
Reg.OpenKey('ProtS2',True);

senha:=Copy(Gera_Senha(SerialNum('C'), DatetoStr(NOW)),1,10);
habilita:=InputBox('Registro do Seu Programa','Digite o Serial informado pelo seu Fornecedor da máquina com serial '+SerialNum('C')+':','');
DataValidade:=ObtemData(HKEY_CURRENT_USER,'ProtS2','Data_Limite');
if senha = UpperCase(habilita) then
begin
Reg.WriteInteger('Sit',2);
Application.MessageBox('Obrigado por registrar o Seu Programa!','Aviso do Sistema', MB_ICONINFORMATION + MB_OK );
VerSituacao;
end
else
begin
Application.MessageBox('Senha incorreta, não foi possível registrar o Seu Programa!','Aviso do Sistema', MB_ICONERROR + MB_OK );
Application.Terminate;
end;
except
on E: Exception do ShowMessage(E.Message);
end;
finally
Reg.CloseKey;
end;
end;

{dá mais 5 dias para avaliação do programa}

{-------------------------------------------------------------------------------
  Procedure: maiscincodias
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: None
  Result:    None
-------------------------------------------------------------------------------}
procedure maiscincodias;
var
Reg: TRegistry;
senha,habilita:string;
DataValidade,DataAcesso:TDate;
begin
try
Reg:= TRegistry.Create;
try
Reg.OpenKey('ProtS2',True);
senha:=Copy(Gera_Senha(SerialNum('C'), DatetoStr(NOW)),1,14);
habilita:=InputBox('Registro do Seu Programa','Digite o Serial informado pelo seu Fornecedor da máquina com serial '+SerialNum('C')+':','');
if senha = UpperCase(habilita) then
begin
Reg.WriteInteger('Sit',1);
Reg.WriteDate('Data_Limite',Kernel_IncrementaDataDias(now,5));
DataValidade:=ObtemData(HKEY_CURRENT_USER,'ProtS2','Data_Limite');
ShowMessage('Validade foi prorrogada até '+DateToStr(DataValidade));
VerSituacao;
end
else
begin
Application.MessageBox('Senha incorreta, não foi possível registrar o Seu Programa!','Aviso do Sistema', MB_ICONERROR + MB_OK );
Application.Terminate;
end;
except
on E: Exception do ShowMessage(E.Message);
end;
finally
Reg.CloseKey;
end;
end;

{aluga o programa}

{-------------------------------------------------------------------------------
  Procedure: alugaprograma
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: None
  Result:    None
-------------------------------------------------------------------------------}
procedure alugaprograma;
var
  Reg: TRegistry;
  senha,habilita:string;
  DataValidade,DataAcesso:TDate;
begin
try
Reg:= TRegistry.Create;
Reg.OpenKey('ProtS2',True);
senha:=Copy(Gera_Senha(SerialNum('C'), DatetoStr(NOW)),1,12);
habilita:=InputBox('Registro do Seu Programa','Digite o Serial informado pelo seu Fornecedor da máquina com serial '+SerialNum('C')+':','');
if senha = UpperCase(habilita) then
begin
Reg.WriteInteger('Sit',0);
Reg.WriteDate('Data_Limite',Kernel_IncrementaDataDias(now,30));
DataValidade:=ObtemData(HKEY_CURRENT_USER,'ProtS2','Data_Limite');
ShowMessage('Validade foi prorrogada até '+DateToStr(DataValidade));
VerSituacao;
end
else
begin
Application.MessageBox('Senha incorreta, não foi possível alugar o Seu Programa!','Aviso do Sistema', MB_ICONERROR + MB_OK );
if date < DataValidade then Application.Terminate else
VerSituacao;
end;
finally
Reg.CloseKey;
end;
end;

{pega no registro valor integer}

{-------------------------------------------------------------------------------
  Procedure: ReadRegInt
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: sPath: HKey; sOpenKey,sNomeValue: string; sValue: integer
  Result:    integer
-------------------------------------------------------------------------------}
function ReadRegInt(sPath: HKey; sOpenKey,sNomeValue: string; sValue: integer): integer;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    if Reg.KeyExists(sOpenKey) then
      begin
        Reg.OpenKey(sOpenKey, false);
        if Reg.ValueExists(sNomeValue) then
        try
          result := Reg.ReadInteger(sNomeValue)
        except
          result := -1
        end
       else
        result := -1
     end
    else
     result := -1
  finally
    Reg.Free;
  end;
  
end;

// Obtém Data do Registro
{-------------------------------------------------------------------------------
  Procedure: ObtemData
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: dwChaveRaiz: DWord; const strChave,strCampo: string
  Result:    TDateTime
-------------------------------------------------------------------------------}
function ObtemData(dwChaveRaiz: DWord; const strChave,strCampo: string): TDateTime;
begin
  Result := 0; // Valor de retorno default
  with TRegistry.Create do
  begin
    RootKey := dwChaveRaiz;
    if OpenKey(strChave, False) then
      begin
        try
          ReadBinaryData(strCampo, Result, SizeOf(Result));
        finally
          CloseKey;
        end;
      end;
    Free;
  end;
end;

{aluga o programa}
{-------------------------------------------------------------------------------
  Procedure: VerAluguel
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: None
  Result:    None
-------------------------------------------------------------------------------}
procedure VerAluguel;
var
  DataValidade,DataAcesso:TDate;
begin
  DataValidade:=ObtemData(HKEY_CURRENT_USER,'ProtS2','Data_Limite');
  DataAcesso :=ObtemData(HKEY_CURRENT_USER,'ProtS2','Data_Ultmacs');
  if now < DataAcesso then
    Violacao;
  if (DataValidade - date < 2)
    then Application.MessageBox('Amanhã encerrará a validade de 30 dias do programa!','Aviso do Sistema', MB_ICONINFORMATION + MB_OK );
  if (DataValidade < date)
    then EscolhadeProtecao;
end;

{ver se o foi concedido 5 dias e se já acabou}
{-------------------------------------------------------------------------------
  Procedure: Ver5dias
  Author:    Administrador
  DateTime:  2007.05.05
  Arguments: None
  Result:    None
-------------------------------------------------------------------------------}
procedure Ver5dias;
var
  DataValidade,DataAcesso:TDate;
begin
  DataValidade:=ObtemData(HKEY_CURRENT_USER,'ProtS2','Data_Limite');
  DataAcesso :=ObtemData(HKEY_CURRENT_USER,'ProtS2','Data_Ultmacs');
  ShowMessage('Data Hoje : '+DateToStr(now)+', Data Validade :'+DateToStr(DataValidade));
  if now < DataAcesso then
    Violacao;
  if (DataValidade - date < 2) then
    Application.MessageBox('Amanhã encerrará a validade de 5 dias do programa!','Aviso do Sistema', MB_ICONINFORMATION + MB_OK );
  if DataValidade < date then
    EscolhadeProtecao;
end;
end.

end.

