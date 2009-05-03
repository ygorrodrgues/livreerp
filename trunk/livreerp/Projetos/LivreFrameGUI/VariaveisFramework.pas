unit VariaveisFramework;

interface

uses
  SysUtils, Classes, UclConfiguracoes_Framework;

  function CopyFileMask(cFrom, cTo, Mask: string): Boolean;
  function CopyFile(cFrom, cTo: string): Boolean;

var
  // variaveis
  str_PastaProjetos, str_PastaTemplate,FileProjectDpr : string;
  str_Version, str_Release: String;

  Configuracoes_Framework: TConfiguracoes_Framework;

  // Constantes
  const csVersionLivreFrameWizard = 'Beta 0.1';
  const csRegLivreFrame = '\Software\LivreFrameWizard\';

  const csExtProject = 'dpr';

implementation

uses UKernel_SysUtils, UdmPrincipal;

function CopyFile(cFrom, cTo: string): Boolean;
var
  SizeBloco, Size: Longint;
  FileFrom, FileTo: file;
  Buffer: Pointer;

  function FRead(var Reg): Boolean;
  var
    Buff: Byte absolute Reg;
  begin
    {$I-}BlockRead(FileFrom, Buff, SizeBloco); {$I+}
    Result := IOResult = 0;
  end;

  function FWrite(var Reg): Boolean;
  var
    Buff: Byte absolute Reg;
  begin
    {$I-}BlockWrite(FileTo, Buff, SizeBloco); {$I+}
    Result := IOResult = 0;
  end;

begin
  Result := False;
  AssignFile(FileFrom, cFrom);
  AssignFile(FileTo, cTo);
  {$I-}Reset(FileFrom, 1); {$I+}
  if IOResult <> 0 then
    Exit;
  {$I-}Rewrite(FileTo, 1); {$I+}
  if IOResult <> 0 then
  begin
    {$I-}CloseFile(FileFrom); {$I+}
    Exit;
  end;
  GetMem(Buffer, 32767);
  Size := FileSize(FileFrom);
  SizeBloco := 32767;
  while Size > 0 do
  begin
    if Size < 32767 then
      SizeBloco := Size;
    if not FRead(Buffer^) then
      Break;
    if not FWrite(Buffer^) then
      Break;
    Size := Size - SizeBloco;
  end;
  Result := Size = 0;
  {$I-}CloseFile(FileFrom); {$I+}
  if IOResult <> 0 then
    Result := False;
  {$I-}CloseFile(FileTo); {$I+}
  if IOResult <> 0 then
    Result := False;
  FreeMem(Buffer, 32767);
  if not Result then
    DeleteFile(PAnsiChar(cTo));
end;

function CopyFileMask(cFrom, cTo, Mask: string): Boolean;
var
  DirInfo: TSearchRec;
begin
  Result := True;
  if FindFirst(Kernel_DiretorioBarras(cFrom) + Mask, faArchive, DirInfo) = 0 then
    repeat
      Result := CopyFile(Kernel_DiretorioBarras(cFrom) + DirInfo.Name, Kernel_DiretorioBarras(cTo) + DirInfo.Name );
    until FindNext(DirInfo) <> 0;
end;

end.
