unit UfrmKernel_Base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, dxGDIPlusClasses, RzPanel,
  ActnList;

type
  TfrmKernel_Base = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmKernel_Base: TfrmKernel_Base;

implementation

{$R *.dfm}
uses UKernel_Mensagem, UKernel_sysutils, UKernel_DB, UKernel_VariaveisPublic;

procedure TfrmKernel_Base.FormCreate(Sender: TObject);
begin
  // Concatenando strings
  Caption := PropriedadesPrj.str_SoftHouse + ' .: ' + kernel_str_form +  ' :. ';
end;

end.
