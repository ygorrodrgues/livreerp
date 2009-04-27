unit UfrmKernel_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBTables, ComCtrls,
  jpeg, adodb, JvExControls, JvXPCore, JvXPButtons, DBCtrls, 
  JvExComCtrls, JvDateTimePicker, UfrmKernel_Base, SqlExpr, ActnList, ImgList;

type
  TfrmKernel_Login = class(TfrmKernel_Base)
    statBase: TStatusBar;
    lbldata: TLabel;
    pnlFudo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    imgSenha: TImage;
    lblAplicativo: TLabel;
    imgUsuario: TImage;
    Label3: TLabel;
    imgLogo: TImage;
    edtLoginUsu: TEdit;
    edtSenhaUsu: TEdit;
    Panel2: TPanel;
    btnConfirmar: TJvXPButton;
    btnSair: TJvXPButton;
    tmrTempo: TTimer;
    actlstLogin: TActionList;
    actConfirmar: TAction;
    actSair: TAction;
    ilLogin: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure edtPSWKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure tmrTempoTimer(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure edtLoginUsuKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
     procedure AntesValidaUsuario(); virtual;
     procedure ValidaUsuario(const str_usuario, str_senha: string); virtual;
     procedure DepoisValidaUsuario(); virtual;

     {Verifica os campos Obrigatorios}
     procedure VerificaDados;
     {Retorna a quantidade de tentativas disponiveis para tentar logar}
  public
    Tentativas, LimiteTentativas : Integer; // Numero de Tentativa para logar
  end;

var
  frmKernel_Login: TfrmKernel_Login;

implementation

uses UdmPrincipal, DB, UfrmKernel_Mensagem, UKernel_Mensagem, UKernel_DATA, UKernel_Security,
  UKernel_VariaveisPublic, UKernel_DB,  UKernel_sysutils, UdmKernel_Acesso,
  UclKernel_Login, UKernel_Mensagem_Usuario;

{$R *.dfm}

{ TfrmKernel_Login }

procedure TfrmKernel_Login.validaUsuario(const str_usuario, str_senha: string);
begin
  {Acontece antes de tentar logar}
  AntesValidaUsuario;

  with dmPrincipal, qryKernel_Gerenerica do
  begin   
    if Tentativas < LimiteTentativas then
      begin
        close;
        sqlConnection:= FConexao; {: componente de conexão}        
        sql.Clear;
        {Seleciona os campos na tabela onde o usuario e senha sejam igual
        aos passados nos edits.}
        sql.Add (' SELECT CODUSU, NOMEUSU, PRIVADMUSU ' +
                   '  FROM USUARIO ' +
                   ' WHERE LOGINUSU = ' + QuotedStr(str_usuario) +
                   '   AND SENHAUSU = ' + QuotedStr(str_senha));
        Open;

        if not IsEmpty then // Se não retornar vazio
          Begin
            Kernel_Login.int_codusu        :=  Fields[0].AsInteger;
            Kernel_Login.str_nomeusu       :=  Fields[1].AsString;
            Kernel_Login.str_adminusu      :=  Fields[2].AsString;

            {Acontece depois que o usuario logar}
            DepoisValidaUsuario;

            ModalResult := mrOk;
          End
         else
          Begin
            TfrmKernel_Mensagem.Mensagem('Usuário ou Senha Inválidos ' +#13#10+
                                   ' - Tentativa '+ IntToStr(Tentativas) + ' de ' +  IntToStr(LimiteTentativas) ,'E',[mbOK]);
            statBase.Panels[3].Text := IntToStr(Tentativas);
            inc(Tentativas);
            edtLoginUsu.SetFocus;
          end;
      end
     else
      begin
        TfrmKernel_Mensagem.Mensagem('Limite de Tentativas Execido ('+ IntToStr(Tentativas) + ' de ' +  IntToStr(LimiteTentativas) +' )'+#13#10+
                             ' - Em caso de Dúvida entre em Contato ' +#13#10+
                             ' - Administrador do Sistema ' ,'E',[mbOK]);
        Application.Terminate; // Termina Aplicação
      end;
  end;
end;

procedure TfrmKernel_Login.VerificaDados;
begin
  {Valida o Login}
  if edtloginusu.Text = '' then
    Begin
      TfrmKernel_Mensagem.Mensagem(Kernel_Informe_LoginValido,'E',[mbOK]);
      edtloginusu.SetFocus;
      exit;
    end;

  {Valida a senha}
  if edtsenhausu.Text = '' then
    Begin
      TfrmKernel_Mensagem.Mensagem(Kernel_Informe_SenhaValida ,'E',[mbOK]);
      edtsenhausu.SetFocus;
      exit;
    end;

  {Se o Login e senha sejam validos tenta acessar}
  validaUsuario(AnsiUpperCase(trim(edtloginusu.Text)), trim(edtsenhausu.Text));
end;

procedure TfrmKernel_Login.edtPSWKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key= vk_return then VerificaDados;
end;

procedure TfrmKernel_Login.tmrTempoTimer(Sender: TObject);
begin
  lblData.Caption :=  FormatDateTime('dddd,dd" de "mmmm"',Kernel_Data_Servidor)+'  '+(FormatDateTime('hh:mm',Kernel_Data_Servidor));
end;

procedure TfrmKernel_Login.FormCreate(Sender: TObject);
begin
  kernel_str_form := 'Login de Acesso';
  inherited;
  // Mostra a Quantidade de Tentativas
  statBase.Panels[1].Text := '1';
  Tentativas              := 0; // tentativa inicial
  LimiteTentativas        := Kernel_Login.Login_RetornaQuantidadeTentativa;
  statBase.Panels[3].Text := IntToStr(Kernel_Login.Login_RetornaQuantidadeTentativa);
end;

procedure TfrmKernel_Login.FormShow(Sender: TObject);
begin

  inherited;

  {Carega Imagem que será mostrada no Timage}
  Kernel_MostraFotoImage('LogoSoftHouse','LogoSoftHouse',imgLogo);

  // Receber a data do computador
  lblData.Caption :=  FormatDateTime('dddd,dd" de "mmmm"',date)+'  '+(FormatDateTime('hh:mm',date));

  kernel_RefreshCds(dmKernel_Acesso.cdsLstEmp);

  Tentativas:= 1;

  edtloginusu.SetFocus;
end;

procedure TfrmKernel_Login.actSairExecute(Sender: TObject);
begin
  inherited;
  {Fecha a aplicação}
  Application.Terminate;
end;

procedure TfrmKernel_Login.actConfirmarExecute(Sender: TObject);
begin
  inherited;
  VerificaDados;
end;

procedure TfrmKernel_Login.AntesValidaUsuario;
begin
  // metodo implementado no filho
end;

procedure TfrmKernel_Login.DepoisValidaUsuario;
begin
  // metodo implementado no filho
end;

procedure TfrmKernel_Login.edtLoginUsuKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  {: troca ENTER por TAB}
  if key = #13 then
    begin
      Perform (CM_DialogKey, VK_TAB, 0);
      key:=#0;
    end
end;

end.
