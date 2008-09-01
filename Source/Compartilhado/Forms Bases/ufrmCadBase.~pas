unit ufrmCadBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmBase, ExtCtrls, ComCtrls, ActnList, ImgList, pngextra,
  StdCtrls, Buttons, db, DBConsts, DBCtrls, DBGrids, SqlExpr;

type
  TfrmCadBase = class(TfrmBase)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pgcBase: TPageControl;
    tsBase: TTabSheet;
    actlstBase: TActionList;
    ilBase: TImageList;
    ilPageBase: TImageList;
    Label11: TLabel;
    cbbCadAuxiliar: TComboBox;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    actNovo: TAction;
    actAlterar: TAction;
    actSalvar: TAction;
    actCancelar: TAction;
    actConfirmar: TAction;
    btnAlterar: TSpeedButton;
    SpeedButton3: TSpeedButton;
    actabrir: TAction;
    btnNovo: TSpeedButton;
    lblCamposObrigatorio: TLabel;
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    {metodos virtual na classe base} 
    procedure NovoRegistro; virtual;
    procedure AlterarRegistro; virtual;
    procedure ConfirmarRegistro; virtual;
    procedure CancelarRegistro; virtual;
    procedure salvarRegistro; virtual;
    procedure EnableDisableControls(Value: Boolean); virtual;
  end;

var
  frmCadBase: TfrmCadBase;

implementation

{$R *.dfm}

{ TfrmCadBase }

procedure TfrmCadBase.AlterarRegistro;
begin
  if btnOK.Enabled = False then
    Exit;

  // Habilita todos os controles
  EnableDisableControls(True);
  // desabilita somenre os contoles necessarios
  btnNovo.Enabled :=  False;
  btnAlterar.Enabled := False;
  btnOK.Enabled := False;
  btnCancelar.Enabled := True;
  pgcBase.TabIndex := 0;
  btnSalvar.Enabled :=  True;
end;

procedure TfrmCadBase.CancelarRegistro;
begin
  btnNovo.Enabled :=  true;
  btnAlterar.Enabled := true;
end;

procedure TfrmCadBase.ConfirmarRegistro;
begin
  //O Botao Ok somente fecha
  ModalResult := mrOk;
end;

procedure TfrmCadBase.NovoRegistro;
begin
  if btnOK.Enabled = False then
    Exit; 

  EnableDisableControls(True);
  // desabilita somenre os contoles necessarios
  btnNovo.Enabled :=  False;
  btnAlterar.Enabled := False;
  btnOK.Enabled := False;
  btnCancelar.Enabled := True;
  pgcBase.TabIndex := 0;
  btnSalvar.Enabled :=  True;
end;

procedure TfrmCadBase.salvarRegistro;
begin
  // Desabilita todos os controles
  EnableDisableControls(False);
  // Habilita somenre os contoles necessarios
  btnNovo.Enabled :=  true;
  btnSalvar.Enabled := false;
  btnAlterar.Enabled := True;
  btnOK.Enabled := True;

  if btnOK.Visible then
    btnOK.SetFocus;
end;

procedure TfrmCadBase.actNovoExecute(Sender: TObject);
begin
  inherited;
  NovoRegistro;
end;

procedure TfrmCadBase.actAlterarExecute(Sender: TObject);
begin
  inherited;
   AlterarRegistro;
end;

procedure TfrmCadBase.actSalvarExecute(Sender: TObject);
begin
  inherited;
  salvarRegistro;
end;

procedure TfrmCadBase.actCancelarExecute(Sender: TObject);
begin
  inherited;
  CancelarRegistro;
end;

procedure TfrmCadBase.actConfirmarExecute(Sender: TObject);
begin
  inherited;
  salvarRegistro;
end;

procedure TfrmCadBase.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if btnSalvar.Enabled = False then
    ModalResult := mrOk;
end;

procedure TfrmCadBase.EnableDisableControls(Value: Boolean);
var
  i : integer;
begin
  {: faz um laço em todos os componentes}
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TCustomEdit) then
      (Components[i] as TCustomEdit).Enabled := Value;
    if (Components[i] is TBitBtn) then
      (Components[i] as TBitBtn).Enabled := Value;
    if (Components[i] is TDBRadioGroup) then
      (Components[i] as TDBRadioGroup).Enabled := Value;
    if (Components[i] is TDBLookupComboBox) then
      (Components[i] as TDBLookupComboBox).Enabled := Value;
    if (Components[i] is Tdbgrid) then
      (Components[i] as TDBgrid).Enabled := Value;
    if (Components[i] is TPNGButton) then
      (Components[i] as TPNGButton).Enabled := Value;
    if (Components[i] is TDBGrid) then
      (Components[i] as TDBGrid).Enabled := Value;
    if (Components[i] is TComboBox) then
      (Components[i] as TComboBox).Enabled := Value;
{    if (Components[i] is TJvDBDateTimePicker) then
      (Components[i] as TJvDBDateTimePicker).Enabled := Value;}
  end;
  btnNovo.Enabled := True
end;

end.
