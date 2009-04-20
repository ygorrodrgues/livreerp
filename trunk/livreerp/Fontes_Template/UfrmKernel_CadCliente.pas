unit UfrmKernel_CadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_CadBaseDB, cxGraphics, DB, ActnList, ImgList, RzPanel,
  RzButton, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxGDIPlusClasses, ExtCtrls,
  StdCtrls, cxPC, cxControls, Mask, DBCtrls, JvExControls, JvXPCore, JvXPButtons;

type
  TfrmKernel_CadCliente = class(TfrmKernel_CadBaseDB)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKernel_CadCliente: TfrmKernel_CadCliente;

implementation

{$R *.dfm}

end.
