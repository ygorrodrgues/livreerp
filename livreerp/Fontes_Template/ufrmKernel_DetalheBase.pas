unit ufrmKernel_DetalheBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Base, ImgList, ActnList, ExtCtrls, RzPanel, JvExControls,
  JvXPCore, JvXPButtons, dxGDIPlusClasses, StdCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmKernel_DetalheBase = class(TfrmKernel_Base)
    RzPanel1: TRzPanel;
    actlstDetalhe: TActionList;
    ildetalhe: TImageList;
    actFechar: TAction;
    JvXPButton1: TJvXPButton;
    RzPanel2: TRzPanel;
    lblSubtitulo: TLabel;
    lblTitulo: TLabel;
    imgCadBase: TImage;
    cxgrdLst_Base: TcxGrid;
    cxgrdLst_BaseDBTableView1: TcxGridDBTableView;
    cxgrdLst_BaseLevel1: TcxGridLevel;
    dsDetalhe: TDataSource;
    procedure actFecharExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Pesquisa_detalhe; virtual;
  end;

var
  frmKernel_DetalheBase: TfrmKernel_DetalheBase;

implementation

{$R *.dfm}

procedure TfrmKernel_DetalheBase.actFecharExecute(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmKernel_DetalheBase.Pesquisa_detalhe;
begin

end;

end.
