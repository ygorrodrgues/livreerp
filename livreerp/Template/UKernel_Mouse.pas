unit UKernel_Mouse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls, ACBrValidador, ACBrBase,
  Variants;

  { Simula - click de mouse }
  procedure MouseClick(const Duration: Word);
  { Aprisiona o mouse em um retângulo }
  function MouseClip(const Rct: TRect): boolean;
  { Retorna o número de botões do mouse }
  function MouseGetButtons: byte;
  { Retorna a posição do mouse }
  function MouseGetPos(var Pt: TPoint): boolean;
  { Retorna true se o mouse está sobre a janela }
  function MouseInWindow(const WinHandle: HWnd): boolean;
  { Retorna true se o mouse está configurado }
  function MouseIsPresent: boolean;
  { Move o ponteiro do mouse para um controle (componente visual) }
  function MouseMoveToControl(const Control: TControl): boolean;
  { Define a posição do mouse }
  function MouseSetPos(const Pt: TPoint): boolean;
  { Exibe ou oculta o ponteiro do mouse }
  function MouseShowCursor(const Show: boolean): boolean;
  { Deslisa o ponteiro do mouse até um controle }
  function MouseSlideToControl(const Control: TControl; Jump, JumpTime: Word): boolean;
  { Inverte os botões do mouse }
  function MouseSwapButtons(const Swap: boolean): boolean;
  { Retorna true se os botões estão invertidos }
  function MouseSwappedButtons: boolean;
  { Libera o mouse - previamente aprisionado com MouseClip }
  function MouseUnClip: boolean;

implementation

function MouseShowCursor(const Show: boolean): boolean;
var
  I: integer;
begin
  I := ShowCursor(LongBool(true));
  
  if Show then
    begin
      { ShowCursor(true) incrementa um contador interno do Windows.
      Quando este contador ficar >= 0, então o cursor é exibido }
      Result := I >= 0;
      while I < 0 do
        begin
         Result := ShowCursor(LongBool(true)) >= 0;
         Inc(I);
        end;
    end
   else
    begin
      { ShowCursor(false) decrementa um contador interno do Windows.
      Quando este contador ficar < 0, então o cursor é ocultado }
      Result := I < 0;
      while I >= 0 do
        begin
          Result := ShowCursor(LongBool(false)) < 0;
          Dec(I);
        end;
    end;
end;

{ *** Mouse *** }
procedure MouseClick(const Duration: Word);
var
  Win: HWnd;
  Pt: TPoint;
  Msg: TMsg;
  FlagMouseDown, FlagMouseUp: DWord;
begin
  { Se os botões estiverem invertidos... }
  if MouseSwappedButtons then begin
  FlagMouseDown := MOUSEEVENTF_RIGHTDOWN;
  FlagMouseUp := MOUSEEVENTF_RIGHTUP;
  end else begin; { Se os botões estiverem normais... }
  FlagMouseDown := MOUSEEVENTF_LEFTDOWN;
  FlagMouseUp := MOUSEEVENTF_LEFTUP;
  end;
 
  { Obtém o handle da janela que está sob o cursor }
  Windows.GetCursorPos(Pt);
  Win := Windows.WindowFromPoint(Pt);
 
  { Inicia o click }
  mouse_event(FlagMouseDown, 0, 0, 0, 0);
 
  { Processa as mensagens do mouse pertencentes à janela sob o cursor }
  while PeekMessage(Msg, Win, WM_LBUTTONDOWN, WM_LBUTTONDOWN, PM_REMOVE) do
  DispatchMessage(Msg);
 
  Sleep(Duration);
 
  { Conclui o click }
  mouse_event(FlagMouseUp, 0, 0, 0, 0);
end;
 
function MouseClip(const Rct: TRect): boolean;
begin
  Result := Windows.ClipCursor(@Rct);
end;
 
function MouseGetButtons: byte;
begin
  Result := GetSystemMetrics(SM_CMOUSEBUTTONS);
end;
 
function MouseGetPos(var Pt: TPoint): boolean;
begin
  Result := Windows.GetCursorPos(Pt);
end;
 
function MouseInWindow(const WinHandle: HWnd): boolean;
var
  Pt: TPoint;
begin
  Result := GetCursorPos(Pt) and (WindowFromPoint(Pt) = WinHandle);
end;
 
function MouseIsPresent: boolean;
begin
  Result := GetSystemMetrics(SM_MOUSEPRESENT) <> 0;
end;
 
function MouseMoveToControl(const Control: TControl): boolean;
var
  Pt: TPoint;
begin
  Pt.x := Control.Width div 2;
  Pt.y := Control.Height div 2;
  Pt := Control.ClientToScreen(Pt);
  Result := SetCursorPos(Pt.X, Pt.Y);
end;
 
function MouseSetPos(const Pt: TPoint): boolean;
begin
  Result := Windows.SetCursorPos(Pt.X, Pt.Y);
end;

function MouseSlideToControl(const Control: TControl; Jump, JumpTime: Word): boolean;
var
  ToPoint, Pt: TPoint;
 
  function ExecJump: boolean;
  begin
  if (Pt.x = ToPoint.x) and (Pt.y = ToPoint.y) then begin
  Result := false; { Chegou }
  Exit;
  end;
  { Calcula X }
  if Pt.x < ToPoint.x then begin
  Inc(Pt.x, Jump);
  if Pt.x > ToPoint.x then { Se passou... }
  Pt.x := ToPoint.x;
  end else if Pt.x > ToPoint.x then begin
  Dec(Pt.x, Jump);
  if Pt.x < ToPoint.x then
  Pt.x := ToPoint.x;
  end;
  { Calcula Y }
  if Pt.y < ToPoint.y then begin
  Inc(Pt.y, Jump);
  if Pt.y > ToPoint.y then { Se passou... }
  Pt.y := ToPoint.y;
  end else if Pt.y > ToPoint.y then begin
  Dec(Pt.y, Jump);
  if Pt.y < ToPoint.y then
  Pt.y := ToPoint.y;
  end;
  Result := SetCursorPos(Pt.x, Pt.y);
  end;
 
begin
  if Jump = 0 then
  Jump := 1;
 
  SetCursor(Screen.Cursors[Control.Cursor]);
  with Control do begin
  ToPoint.x := Width div 2;
  ToPoint.y := Height div 2;
  ToPoint := ClientToScreen(ToPoint);
  end;
  if GetCursorPos(Pt) then
  while ExecJump do Sleep(JumpTime);
 
  Result := GetCursorPos(Pt) and
  (Pt.x = ToPoint.x) and (Pt.y = ToPoint.y);
end;
 
function MouseSwapButtons(const Swap: boolean): boolean;
begin
  Result := Windows.SwapMouseButton(LongBool(Swap));
end;
 
function MouseSwappedButtons: boolean;
begin
  Result := GetSystemMetrics(SM_SWAPBUTTON) <> 0;
end;
 
function MouseUnClip: boolean;
begin
  Result := Windows.ClipCursor(nil);
end;

end.
