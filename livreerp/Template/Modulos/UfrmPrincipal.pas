unit UfrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Principal, Menus, ImgList, RzStatus, ExtCtrls, RzPanel,
  ToolWin, ActnMan, ActnCtrls, StdCtrls, dxGDIPlusClasses, jpeg, ActnList,
  RzButton;

type
  TfrmPrincipal = class(TfrmKernel_Principal)
    actFechamentoConvenio: TAction;
    RzSpacer1: TRzSpacer;
    actSobre: TAction;
    Sistema1: TMenuItem;
    SobreoSistema1: TMenuItem;
    procedure actSobreExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses UKernel_SysUtils, UfrmKernel_Sobre;

{$R *.dfm}

procedure TfrmPrincipal.actSobreExecute(Sender: TObject);
begin
  inherited;
  Kernel_AbreForm(TfrmKernel_Sobre,frmKernel_Sobre);
end;

end.
