{
Projeto ERP Livre - Sistema de Gestão Comercial Livre
Copyright (c) 2008 Sérgio Guedes

O ERP Livre é um software de livre distribuição, que pode ser copiado e
distribuído sob os termos da Licença Pública Geral GNU, conforme publicada
pela Free Software Foundation, versão 2 da licença ou qualquer versão posterior.

Este programa é distribuído na expectativa de ser útil aos seus usuários,
porém  NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licença Pública Geral GNU para maiores detalhes.

@project-name: ERP Livre
@project-email: ERPLivre@yahoo.com.br
@autor-name: Sérgio Guedes
@autor-email: sergio_rj45@yahoo.com.br

}
unit UfrmMensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TMyButtons = (mbSim, mbNao, mbOk);

type
  TfrmMensagem = class(TForm)
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
  frmMensagem: TfrmMensagem;

const
  LEFTBUTTONS : array[0..2] of integer = (258, 178, 97);
  TITULO : String = 'VAP Infomática®';  

implementation

uses UMensagem;

{$R *.dfm}

{ TfrmMensagem }

procedure TfrmMensagem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;

end;

class function TfrmMensagem.Mensagem(Texto: String; Tipo: Char;
  Botoes: array of TMyButtons): Boolean;
var
  i: Integer;
  frm :TfrmMensagem;
begin
  frm := TfrmMensagem.Create(nil);

  try
    frm.lblMensagem.Caption := Texto;
    frm.Caption := SisNm_Empresa;

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
    if (frm<>nil) then
      FreeAndNil(frm);
  end;
end;

end.

