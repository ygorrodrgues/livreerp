unit UKernel_Mensagem_Usuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls;


//==============================================================================
// Mensagens Usadas Para Modulo Kernel_Usuario
//==============================================================================
Const
  Kernel_SenhaInvalida : Pchar = 'Senha Inválida';
  Kernel_Informe_SenhaValida : PAnsiChar = 'Informe uma Senha válida';
  Kernel_Informe_LoginValido : PAnsiChar = 'Informe um usuário válido';

implementation

end.
