unit UKernel_String;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls;

  function TiraAcentos(Texto: String): string;

implementation

function TiraAcentos(Texto: String): string;
var
  I: integer;
begin
  // Transforma as letras não acentuadas em maiúsculas
  Texto := UpperCase(Texto);
  // Troca as letras acentuadas por não acentuadas
  for I := 1 to Length(Texto) do
    Case Texto[I] of
      'á','Á','à','À','ã','Ã','â','Â': Texto[I] := 'A';
      'é','É','ê','Ê': Texto[I] := 'E';
      'í','Í': Texto[I] := 'I';
      'ó','Ó','õ','Õ','ô','Ô': Texto[I] := 'O';
      'ú','Ú': Texto[I] := 'U';
      'ç','Ç': Texto[I] := 'C';
    end;
  Result := Texto;
end;

end.
