unit UfrmKernel_CadItemBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Base, StdCtrls, RzButton, ExtCtrls, RzPanel, Mask, RzEdit,
  RzDBEdit, DB, ImgList, ActnList, Menus, DBClient, SqlExpr, JvExControls,
  JvXPCore, JvXPButtons, Buttons;

type
  TfrmKernel_CadItemBase = class(TfrmKernel_Base)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    Label3: TLabel;
    lblTitulo: TLabel;
    RzPanel3: TRzPanel;
    dsBase: TDataSource;
    actlstCadItem: TActionList;
    mmCadbase: TMainMenu;
    Aes1: TMenuItem;
    Confirmar1: TMenuItem;
    Cancelar1: TMenuItem;
    N1: TMenuItem;
    actConfirmar: TAction;
    actCancelar: TAction;
    RzPanel4: TRzPanel;
    cbbCadAuxiliar: TComboBox;
    Label11: TLabel;
    actAbrirCadastro: TAction;
    ilCadBase: TImageList;
    JvXPButton1: TJvXPButton;
    JvXPButton2: TJvXPButton;
    SpeedButton1: TSpeedButton;
    procedure actConfirmarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actAbrirCadastroExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AbriCadAuxiliar(codtela: Integer); virtual;
  end;

var
  frmKernel_CadItemBase: TfrmKernel_CadItemBase;

implementation

uses Udmprincipal, UfrmKernel_Mensagem;

{$R *.dfm}

procedure TfrmKernel_CadItemBase.AbriCadAuxiliar(codtela: Integer);
begin
 //Sera codificada no filho
end;

procedure TfrmKernel_CadItemBase.actAbrirCadastroExecute(Sender: TObject);
begin
  inherited;
  AbriCadAuxiliar(cbbCadAuxiliar.ItemIndex);
end;

procedure TfrmKernel_CadItemBase.actCancelarExecute(Sender: TObject);
begin
  inherited;
  dsBase.DataSet.Cancel;
  close;
end;

procedure TfrmKernel_CadItemBase.actConfirmarExecute(Sender: TObject);
begin
  inherited;
  dsBase.DataSet.Post;
  (TClientDataSet(dsBase.DataSet).ApplyUpdates(0));

  ModalResult := mrOk;
end;

end.
