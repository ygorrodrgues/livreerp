unit UfrmKernel_LstColunas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_LstBase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, ActnList,
  ImgList, AppEvnts, RzPanel, RzButton, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, StdCtrls, dxGDIPlusClasses, ExtCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid,
  pngextra, JvExControls, JvXPCore, JvXPButtons;

type
  TfrmKernel_LstColunas = class(TfrmKernel_LstBase)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PesquisaBase; override;
  end;

var
  frmKernel_LstColunas: TfrmKernel_LstColunas;

implementation

uses UdmKernel_Colunas, UfrmKernel_CadColunas;

{$R *.dfm}

{ TfrmKernel_LstColunas }

procedure TfrmKernel_LstColunas.FormCreate(Sender: TObject);
begin
  if not Assigned(dmKernel_Colunas) then
    application.CreateForm(TdmKernel_Colunas, dmKernel_Colunas);
    
  inherited;

end;

procedure TfrmKernel_LstColunas.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(dmKernel_Colunas) then
    FreeAndNil(dmKernel_Colunas);
end;

procedure TfrmKernel_LstColunas.FormShow(Sender: TObject);
begin
  inherited;
  PesquisaBase;
end;

procedure TfrmKernel_LstColunas.PesquisaBase;
begin
  inherited;
  with dmKernel_Colunas do
  begin
    cdsLstBase.Close;
    cdsLstBase.Open;
  end;
end;

initialization
  RegisterClass(TfrmKernel_CadColunas);

end.
