{
  Exemplos de Uso :

   - Mostrando uma mensagem
  TFrmKernel_Mensagem.Mensagem('Envio Impossivel: Selecione apenas Notas no status de Autorizada ','I',[mbOk]);
  - Pedindo uma Confirmação do usuário
  if (TFrmKernel_Mensagem.Mensagem(Aviso_Apaga,'D',[mbSim, mbNao])) then
}
unit UfrmKernel_Mensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type           
  TMyButtons = (mbSim, mbNao, mbOk);

type
  TfrmKernel_Mensagem = class(TForm)
    pnlIcones: TPanel;
    imgDeletar: TImage;
    imgQuestao: TImage;
    imgCuidado: TImage;
    imgInformacao: TImage;
    imgErro: TImage;
    pnlBotoes: TPanel;
    BtnOK: TBitBtn;
    btnSim: TBitBtn;
    BtnNao: TBitBtn;
    pnlMensagem: TPanel;
    lblMensagem: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
     class function Mensagem(Texto: String; Tipo: Char; Botoes: array of TMyButtons): Boolean;
  end;

var
  frmKernel_Mensagem: TfrmKernel_Mensagem;

const
  LEFTBUTTONS : array[0..2] of integer = (258, 178, 97);

implementation

uses UKernel_Mensagem, UclKernel_PropriedadesProjeto, UKernel_VariaveisPublic;

{$R *.dfm}

{ TfrmMensagem }

procedure TfrmKernel_Mensagem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then close;
end;

class function TfrmKernel_Mensagem.Mensagem(Texto: String; Tipo: Char;
  Botoes: array of TMyButtons): Boolean;
var
  i: Integer;
  frm :TfrmKernel_Mensagem;
begin
  frm := TfrmKernel_Mensagem.Create(nil);

  try
    frm.lblMensagem.Caption := Texto;
    frm.Caption := Kernel_PropriedadesProjeto.str_SoftHouse;

    // Mostra os Controle e Botoes conforme parametro Botoes
    for i:=0 to Length(Botoes)-1 do
    begin
      case (Botoes[i]) of
        mbOk: begin
                frm.BtnOK.Visible := True;
                frm.BtnOK.Left := LEFTBUTTONS[i];               
              end;
        mbSim: begin
                 frm.btnSim.Visible := True;
                 frm.btnSim.Left := LEFTBUTTONS[i];
               end;
        mbNao: begin
                 frm.BtnNao.Visible := True;
                 frm.BtnNao.Left := LEFTBUTTONS[i];
               end;
        else begin
          frm.BtnOK.Visible := True;
          frm.BtnOK.Left := LEFTBUTTONS[i];
        end;  
      end;
    end;

    // Parametro Tipo retorna a imagem adequada
    case (Tipo) of
      'I': frm.imgInformacao.Visible := True; // Informação
      'D': frm.imgDeletar.Visible := True;
      'Q': frm.imgQuestao.Visible := True;
      'C': frm.imgCuidado.Visible := True;
      'E': frm.imgErro.Visible := True;
      else
        frm.imgInformacao.Visible := True;
    end;

    frm.ShowModal;

    // Caso Clicar em Ok ou Sim Retorna TRue
    case (frm.ModalResult) of
      mrOk, mrYes : result := True;
      else
        result := False;
    end;

  finally
    frm.Free;
  end;
end;

end.

