unit UFrmExclusao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, Ufrmbase;

type
  TFrmExclusao = class(Tfrmbase)
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
    Procedure NomearCaptions (Codigo, Nome : String );
  end;

var
  FrmExclusao: TFrmExclusao;

implementation

uses UVariaveisGerais, UMensagem, UfrmMensagem;

{$R *.dfm}

procedure TFrmExclusao.BtnNaoClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExclusao.btnSimClick(Sender: TObject);
begin
  if mmExclusao.Text <> '' then
  begin
    DescExclusao := mmExclusao.Text;
    ModalResult := mrOk;
  end
  else
  begin
    TFrmMensagem.Mensagem('Descrição Inválida : É obrigatório a descrição para Salvar operação.','I',[mbOk]);
    mmExclusao.SetFocus;
  end;
end;

procedure TFrmExclusao.FormCreate(Sender: TObject);
begin
  form := ' Motivo da Operação ? ';
  inherited;

end;

procedure TFrmExclusao.FormShow(Sender: TObject);
begin
  mmExclusao.SelStart := Perform(EM_LINEINDEX, 1, 0);
  mmExclusao.SetFocus;
end;

procedure TFrmExclusao.NomearCaptions(Codigo, Nome: String);
begin
    lblCODIGO.Caption := CODIGO;
    lblNOME.Caption := NOME;
end;

end.
