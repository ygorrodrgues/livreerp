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
    lblSubtitulo: TLabel;
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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AbriCadAuxiliar(codtela: Integer); virtual;
    {Valida os campos obrigatorios da tela}
    function ValidaCampos(): Boolean;  virtual;
    {Executa antes de executar o Salvar registro}
    procedure AntesSalvarRegistro; virtual;
    {Execura o metodo Salvar Registro}
    procedure SalvarRegistro; virtual;
    {Executa Todo o processo de antes Salvar depois}
    procedure Executa_SalvarRegistro; virtual;
    {Executa Depois de executar o Salvar registro}
    procedure DepoisSalvarRegistro; virtual;    
  end;

var
  frmKernel_CadItemBase: TfrmKernel_CadItemBase;

implementation

uses Udmprincipal, UfrmKernel_Mensagem, UKernel_VariaveisPublic;

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
  Executa_SalvarRegistro;
end;

procedure TfrmKernel_CadItemBase.AntesSalvarRegistro;
begin
  {Valida se os campos obrigatorios estao todos preechidos}
  ValidaCampos;
end;

procedure TfrmKernel_CadItemBase.DepoisSalvarRegistro;
begin

end;

procedure TfrmKernel_CadItemBase.Executa_SalvarRegistro;
begin
  antesSalvarRegistro;
  SalvarRegistro;
  DepoisSalvarRegistro;
end;

procedure TfrmKernel_CadItemBase.FormCreate(Sender: TObject);
begin
  kernel_str_form := 'Pesquisa de ' + kernel_srt_nmformbase;
  lblTitulo.caption:= kernel_str_form;
  lblSubtitulo.Caption := 'Pesquisa/Filtro de ' + kernel_srt_nmformbase;
  inherited;

end;

procedure TfrmKernel_CadItemBase.SalvarRegistro;
begin
  dsBase.DataSet.Post;
  (TClientDataSet(dsBase.DataSet).ApplyUpdates(0));

  ModalResult := mrOk;
end;

function TfrmKernel_CadItemBase.ValidaCampos: Boolean;
begin

end;

end.
