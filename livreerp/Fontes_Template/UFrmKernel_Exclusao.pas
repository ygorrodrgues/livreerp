unit UFrmKernel_Exclusao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, UfrmKernel_base;

type
  TFrmKernel_Exclusao = class(TfrmKernel_base)
    pnlBotoes: TPanel;
    btnSim: TBitBtn;
    BtnNao: TBitBtn;
    Label1: TLabel;
    lblnome2: TLabel;
    lblCODIGO: TLabel;
    lblNOME: TLabel;
    lblMotivo: TLabel;
    mmExclusao: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNaoClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure NomearCaptions (str_Codigo, str_Nome : String );
  end;

var
  FrmKernel_Exclusao: TFrmKernel_Exclusao;

implementation

uses UKernel_VariaveisPublic, UKernel_Mensagem, UfrmKernel_Mensagem;

{$R *.dfm}

procedure TfrmKernel_Exclusao.BtnNaoClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmKernel_Exclusao.btnSimClick(Sender: TObject);
begin
  if mmExclusao.Text <> '' then
  begin
    kernel_str_DescExclusao := mmExclusao.Text;
    ModalResult := mrOk;
  end
  else
  begin
    TFrmKernel_Mensagem.Mensagem('Descrição Inválida : É obrigatório a descrição para Salvar operação.','I',[mbOk]);
    mmExclusao.SetFocus;
  end;
end;

procedure TfrmKernel_Exclusao.FormCreate(Sender: TObject);
begin
  kernel_str_form := ' Motivo da Operação ? ';
  inherited;

end;

procedure TfrmKernel_Exclusao.FormShow(Sender: TObject);
begin
  mmExclusao.SelStart := Perform(EM_LINEINDEX, 1, 0);
  mmExclusao.SetFocus;
end;

procedure TfrmKernel_Exclusao.NomearCaptions(str_Codigo, str_Nome: String);
begin
  lblCODIGO.Caption := str_CODIGO;
  lblNOME.Caption := str_NOME;
end;

end.
