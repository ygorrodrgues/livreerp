unit UfrmCadModelo1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_CadBaseDB, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxGraphics, DB, ActnList, ImgList, JvExControls, JvXPCore,
  JvXPButtons, RzPanel, RzButton, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  dxGDIPlusClasses, ExtCtrls, StdCtrls, cxPC, cxControls;

type
  TfrmCadModelo1 = class(TfrmKernel_CadBaseDB)
  private
    { Private declarations }
  public
    {Valida os campos obrigatorios da tela}
    function ValidaCampos(): Boolean; override;
  end;

var
  frmCadModelo1: TfrmCadModelo1;

implementation

uses UdmModelo1, UKernel_Exception, UKernel_Mensagem;

{$R *.dfm}

{ TfrmCadModelo1 }

function TfrmCadModelo1.ValidaCampos: Boolean;
begin

end;

end.
