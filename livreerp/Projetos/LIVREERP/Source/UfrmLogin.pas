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
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses UKernel_VariaveisPublic;

{$R *.dfm}

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  kernel_str_form := 'Login do Sistema';
  inherited;

end;

end.
