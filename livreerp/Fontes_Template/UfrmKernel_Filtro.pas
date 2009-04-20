unit UfrmKernel_Filtro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Base, ExtCtrls, cxControls, cxFilterControl, StdCtrls,
  Buttons, ActnList, ImgList, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxDBFilterControl,
  RzPanel;

type
  TfrmKernel_Filtro = class(TfrmKernel_Base)
    actlstFiltro: TActionList;
    ilFiltro: TImageList;
    actAplicarFiltro: TAction;
    cxDBFilterControl1: TcxDBFilterControl;
    cxFilterControl1: TcxFilterControl;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKernel_Filtro: TfrmKernel_Filtro;

implementation

{$R *.dfm}

end.
