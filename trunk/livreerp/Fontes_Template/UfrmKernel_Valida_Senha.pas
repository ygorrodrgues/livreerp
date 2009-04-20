unit UfrmKernel_Valida_Senha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Base, ImgList, ActnList, ExtCtrls, JvExControls, JvXPCore,
  JvXPButtons, StdCtrls;

type
  TfrmKernel_Valida_Senha = class(TfrmKernel_Base)
    tmrTempo: TTimer;
    actlstLogin: TActionList;
    actConfirmar: TAction;
    actSair: TAction;
    ilLogin: TImageList;
    Label3: TLabel;
    lblAplicativo: TLabel;
    imgUsuario: TImage;
    imgSenha: TImage;
    edtSenhaUsu: TEdit;
    Label1: TLabel;
    edtLoginUsu: TEdit;
    Label2: TLabel;
    btnConfirmar: TJvXPButton;
    btnSair: TJvXPButton;
    imgLogoLogin: TImage;
    procedure actConfirmarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure edtLoginUsuKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaUsuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    {Verifica se os dados foram preechidos corretamente}
    procedure Kernel_Valida_Dados(); virtual;
    {Verifica se os dados informados sao verdadeiros}
    function Kernel_Valida_Senha(): Boolean; virtual;
  end;

var
  frmKernel_Valida_Senha: TfrmKernel_Valida_Senha;

implementation

uses UfrmKernel_Mensagem, UKernel_Mensagem_Usuario;

{$R *.dfm}

{ TfrmKernel_Valida_Senha }

procedure TfrmKernel_Valida_Senha.actConfirmarExecute(Sender: TObject);
begin
  inherited;
  Kernel_Valida_Dados;
end;

procedure TfrmKernel_Valida_Senha.actSairExecute(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmKernel_Valida_Senha.edtLoginUsuKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  {: troca ENTER por TAB}
  if key = #13 then
  begin
    Perform(CM_DialogKey, VK_TAB, 0);
    key := #0;
  end;
end;

procedure TfrmKernel_Valida_Senha.edtSenhaUsuKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
  begin
    actConfirmar.execute;
  end;
end;

procedure TfrmKernel_Valida_Senha.Kernel_Valida_Dados;
begin
  if edtLoginUsu.Text = '' then
    begin
      TFrmKernel_Mensagem.Mensagem(Kernel_Informe_SenhaValida, 'I', [mbOk]);
      edtLoginUsu.SetFocus;
      Exit;
    end;

  if edtSenhaUsu.Text = '' then
    begin
      TFrmKernel_Mensagem.Mensagem(Kernel_Informe_LoginValido, 'I', [mbOk]);
      edtSenhaUsu.SetFocus;
      Exit;
    end;

  {Verifica se a senha informada e correta}
  if Kernel_Valida_Senha() then   
    ModalResult := mrOk;
end;

function TfrmKernel_Valida_Senha.Kernel_Valida_Senha(): Boolean;
begin
  // aqui sera codificado pelo filho 
end;

end.
