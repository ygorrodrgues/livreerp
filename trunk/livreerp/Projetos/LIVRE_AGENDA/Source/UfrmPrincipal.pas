unit UfrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Principal, Menus, ImgList, RzStatus, ExtCtrls, RzPanel,
  ToolWin, ActnMan, ActnCtrls, StdCtrls, dxGDIPlusClasses, jpeg, ActnList,
  RzButton;

type
  TfrmPrincipal = class(TfrmKernel_Principal)
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

end.
