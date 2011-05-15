unit UfrmLstTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_LstBase, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridTableView, ActnList, ImgList, AppEvnts,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, ComCtrls, RzPanel, RzButton, Buttons,
  dxGDIPlusClasses, ExtCtrls, StdCtrls, Menus, cxLookAndFeelPainters, cxButtons,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, JvExControls, JvXPCore, JvXPButtons,
  cxLookAndFeels;

type
  TfrmLstTeste = class(TfrmKernel_LstBase)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PesquisaBase; override;
  end;

var
  frmLstTeste: TfrmLstTeste;

implementation

uses UdmTeste, UfrmCadTeste;

{$R *.dfm}

{ TfrmLstTeste }

procedure TfrmLstTeste.FormCreate(Sender: TObject);
begin
  if not Assigned(dmTeste) then
    application.CreateForm(TdmTeste, dmTeste);

  inherited;
end;

procedure TfrmLstTeste.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(dmTeste) then
    FreeAndNil(dmTeste);
end;

procedure TfrmLstTeste.PesquisaBase;
begin
  inherited;
  with dmTeste do
  begin
    cdsLstBase.Close;
    cdsLstBase.Open;
  end;

end;

initialization
  RegisterClass(TfrmCadTeste);

end.
