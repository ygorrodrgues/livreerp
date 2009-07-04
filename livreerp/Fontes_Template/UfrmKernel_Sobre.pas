unit UfrmKernel_Sobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, JvExControls, JvLinkLabel, UfrmKernel_Base,
  RzLabel;

type
  TfrmKernel_Sobre = class(TfrmKernel_Base)
    Panel1: TPanel;
    Panel2: TPanel;
    Label5: TLabel;
    Panel3: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblsenharegistro: TLabel;
    lblcliente: TLabel;
    lblnomeusu: TLabel;
    lblempresa: TRzLabel;
    lblsistema: TRzLabel;
    Label1: TLabel;
    JvLinkLabel1: TJvLinkLabel;
    imgLogo: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKernel_Sobre: TfrmKernel_Sobre;

implementation

uses UKernel_VariaveisPublic;


{$R *.dfm}

procedure TfrmKernel_Sobre.FormCreate(Sender: TObject);
begin
  kernel_str_form := 'Sobre o Sistema';
  inherited;

end;

procedure TfrmKernel_Sobre.FormShow(Sender: TObject);
begin
  // Carega configuracoes sobre o registro do sistema
  lblnomeusu.caption := Kernel_Login.str_nomeusu;
end;

end.
