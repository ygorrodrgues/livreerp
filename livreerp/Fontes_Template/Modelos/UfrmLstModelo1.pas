unit UfrmLstModelo1;

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
  cxEdit, DB, cxDBData, cxGridTableView, ActnList, ImgList, AppEvnts, RzPanel,
  RzButton, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, StdCtrls,
  dxGDIPlusClasses, ExtCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid;

type
  TfrmLstModelo1 = class(TfrmKernel_LstBase)
  private
    { Private declarations }
  public
    procedure PesquisaBase; override;
    {Execura o metodo Imprimir Registro}
    procedure ImprimirRegistro(int_codrel: Integer); override;
  end;

var
  frmLstModelo1: TfrmLstModelo1;

implementation

uses UfrmCadModelo1, UdmModelo1, UKernel_VariaveisPublic;

{$R *.dfm}

{ TfrmLstModelo1 }

procedure TfrmLstModelo1.ImprimirRegistro(int_codrel: Integer);
begin
  inherited;

end;

procedure TfrmLstModelo1.PesquisaBase;
begin
  inherited;

end;

initialization
  RegisterClass(TfrmCadModelo1);

end.
