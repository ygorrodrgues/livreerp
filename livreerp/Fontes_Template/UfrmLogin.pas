unit UfrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Login, ExtCtrls, DBCtrls, JvExControls, JvXPCore,
  JvXPButtons, StdCtrls, ComCtrls, ActnList, ImgList, jpeg;

type
  TfrmLogin = class(TfrmKernel_Login)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Passa_COMSQL(str_usuario, str_senha: string); override;
    procedure Retorno_SQL; override;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses UKernel_VariaveisPublic, UdmPrincipal;

{$R *.dfm}

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  kernel_str_form := 'Login do Sistema';
  inherited;

end;

procedure TfrmLogin.Passa_COMSQL(str_usuario, str_senha: string);
begin
  with dmPrincipal, qryKernel_Gerenerica do
  begin
    close;
    sqlConnection:= FConexao; {: componente de conexão}
    sql.Clear;
    {Seleciona os campos na tabela onde o usuario e senha sejam igual
    aos passados nos edits.}
    sql.Add (' SELECT USU_USUARIO, USU_NOME, USU_STS_ADMIN,USU_SENHA_EXPIRA  ' +
             '  FROM USU_USUARIO ' +
             ' WHERE USU_LOGIN = ' + QuotedStr(str_usuario) +
             ' AND USU_SENHA = ' + QuotedStr(str_senha));
    Open;
  end;

end;

procedure TfrmLogin.Retorno_SQL;
begin
  with dmPrincipal, qryKernel_Gerenerica do
  begin
    Kernel_Login.int_codusu        :=  Fields[0].AsInteger;
    Kernel_Login.str_nomeusu       :=  Fields[1].AsString;
    Kernel_Login.str_adminusu      :=  Fields[2].AsString;
  end;
end;

end.
