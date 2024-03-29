unit UKernel_Internet;

interface 
uses 
Windows, SysUtils, Registry, WinSock, WinInet; 
 
type 
TConnectionType = (ctNone, ctProxy, ctDialup);
 
function ConnectedToInternet : TConnectionType; 
function RasConnectionCount : Integer; 
 
 
implementation 
 
const 
cERROR_BUFFER_TOO_SMALL = 603; 
cRAS_MaxEntryName = 256; 
cRAS_MaxDeviceName = 128; 
cRAS_MaxDeviceType = 16; 
type 
ERasError = class(Exception); 
 
HRASConn = DWord; 
PRASConn = ^TRASConn; 
TRASConn = record 
dwSize: DWORD; 
rasConn: HRASConn; 
szEntryName: Array[0..cRAS_MaxEntryName] Of Char; 
szDeviceType : Array[0..cRAS_MaxDeviceType] Of Char; 
szDeviceName : Array [0..cRAS_MaxDeviceName] of char;
end;

TRasEnumConnections =
function (RASConn: PrasConn; { buffer para receber dados da conexao}
var BufSize: DWord; { tamanho em bytes do buffer }
var Connections: DWord { numero de conexoes escritas no buffer }
): LongInt; stdcall;


function ConnectedToInternet: TConnectionType;
var
Reg : TRegistry;
bUseProxy : Boolean;
UseProxy : LongWord;
begin
  Result := ctNone;
  Reg := TRegistry.Create;
  with REG do
  try
    try
    RootKey := HKEY_CURRENT_USER;
    if OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet settings',False) then begin
    //I just try to read it, and trap an exception
    if GetDataType('ProxyEnable') = rdBinary then
    ReadBinaryData('ProxyEnable', UseProxy, SizeOf(LongWord) )
    else begin
    bUseProxy := ReadBool('ProxyEnable');
    if bUseProxy then
    UseProxy := 1
    else
    UseProxy := 0;
    end;
    if (UseProxy <> 0) and ( ReadString('ProxyServer') <> '' ) then Result := ctProxy;
    end;
    except
    //Nao conectado com proxy
    end;
  finally
  Free;
  end;


  if Result = ctNone then begin
  if RasConnectionCount > 0 then Result := ctDialup;
  end;
end;

function RasConnectionCount : Integer;
var
RasDLL : HInst;
Conns : Array[1..4] of TRasConn;
RasEnums : TRasEnumConnections;
BufSize : DWord;
NumConns : DWord;
RasResult : Longint;
begin
  Result := 0;

  //Load the RAS DLL
  RasDLL := LoadLibrary('rasapi32.dll');
  if RasDLL = 0 then exit;

  try
    RasEnums := GetProcAddress(RasDLL,'RasEnumConnectionsA');
    if @RasEnums = nil then
    raise ERasError.Create('RasEnumConnectionsA not found in rasapi32.dll');

    Conns[1].dwSize := Sizeof (Conns[1]);
    BufSize := SizeOf(Conns);

    RasResult := RasEnums(@Conns, BufSize, NumConns);

    If (RasResult = 0) or (Result = cERROR_BUFFER_TOO_SMALL) then Result := NumConns;
  finally
    FreeLibrary(RasDLL);
  end;

end;



end.
