unit UKernel_Registry;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls;

  function Kernel_Ler_Registro(chave,sequencia:string):string;
  function Kernel_Existe_Registro(chave,sequencia:string):boolean;
  procedure Kernel_Gravar_Registro(chave,sequencia,valor:string);

implementation

{-------------------------------------------------------------------------------
  Procedure: Ler_Registro
  Author:    Administrador
  DateTime:  2007.06.23
  Arguments: chave,sequencia:string
  Result:    string
-------------------------------------------------------------------------------}
function Kernel_Ler_Registro(chave,sequencia:string):string;
var
	Reg: TRegistry;
begin
	Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_CURRENT_USER; // Pai
    Reg.OpenKey(chave,True); {senao existir ele cria}
    result := Reg.Readstring(sequencia);
  	finally
  	  Reg.CloseKey;
    	Reg.Free;
  end;
end;

{-------------------------------------------------------------------------------
  Procedure: Existe_Registro
  Author:    Administrador
  DateTime:  2007.06.23
  Arguments: chave,sequencia:string
  Result:    boolean
-------------------------------------------------------------------------------}
function Kernel_Existe_Registro(chave,sequencia:string):boolean;
var
	Reg: TRegistry;
begin
	Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_CURRENT_USER;// Pai
    Reg.OpenKey(chave,True); {senao existir ele cria}
    result := Reg.ValueExists(sequencia); {Se existir e true}
  	finally
  	  Reg.CloseKey;
    	Reg.Free;
  end;
end;

{-------------------------------------------------------------------------------
  Procedure: Gravar_Registro
  Author:    Administrador
  DateTime:  2007.06.23
  Arguments: chave,sequencia,valor:string
  Result:    None
-------------------------------------------------------------------------------}
procedure Kernel_Gravar_Registro(chave,sequencia,valor:string);
var
	Reg: TRegistry;
begin
	Reg := TRegistry.Create;
	Try
		Reg.RootKey := HKEY_CURRENT_USER; // Pai
		Reg.OpenKey(chave,True); {Cria Grupo}
    {Grava a Chave e o valor}
		Reg.WriteString(sequencia,valor);
		finally
			Reg.CloseKey;
			Reg.Free;
			//inherited;
	end;
end;

end.
 