unit UfrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Principal, Menus, ImgList, RzStatus, ExtCtrls, RzPanel,
  ToolWin, ActnMan, ActnCtrls, StdCtrls, dxGDIPlusClasses, jpeg, ActnList,
  RzButton;

type
  TfrmPrincipal = class(TfrmKernel_Principal)
    RzSpacer1: TRzSpacer;
    actCadastroBanco: TAction;
    Cadastros1: TMenuItem;
    DadosBancarios1: TMenuItem;
    Cadastrodebancos1: TMenuItem;
    procedure Cadastrodebancos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses UKernel_SysUtils, UfrmKernel_Sobre, UfrmLstBanco;

{$R *.dfm}

procedure TfrmPrincipal.Cadastrodebancos1Click(Sender: TObject);
begin
  inherited;
  Kernel_AbreForm(TfrmLstBanco,frmLstBanco);
end;

end.
