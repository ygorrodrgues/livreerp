
unit UfrmLstBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_LstBase, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxContainer, cxGridTableView, ActnList, ImgList, AppEvnts, StdCtrls,
  RzPanel, RzButton, cxTextEdit, cxMaskEdit, cxDropDownEdit, JvExControls,
  JvXPCore, JvXPButtons, dxGDIPlusClasses, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid;

type
  TfrmLstBanco = class(TfrmKernel_LstBase)
    edtcodbanco: TEdit;
    edtnomebanco: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    cxgrdLst_BaseDBTableView1CODBANCO: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1NOMEBANCO: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1LICENCABANCO: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtnomebancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcodbancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure PesquisaBase; override;
  end;

var
  frmLstBanco: TfrmLstBanco;

implementation

uses UdmBanco, UfrmCadBanco;

{$R *.dfm}

procedure TfrmLstBanco.edtcodbancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    edtcodbanco.SetFocus;
end;

procedure TfrmLstBanco.edtnomebancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    actFiltrar.Execute;
end;

procedure TfrmLstBanco.FormCreate(Sender: TObject);
begin
  if not Assigned(dmBanco) then
    application.CreateForm(TdmBanco, dmBanco);
  inherited;

end;

procedure TfrmLstBanco.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(dmBanco) then
    FreeAndNil(dmBanco);
end;

procedure TfrmLstBanco.FormShow(Sender: TObject);
begin
  inherited;
  edtcodbanco.SetFocus;
end;

procedure TfrmLstBanco.PesquisaBase;
begin
  inherited;
  with dmBanco do
  begin
    cdsLstBase.Close;
    cdsLstBase.Params[0].AsString := Trim(edtcodbanco.Text)+'%';
    cdsLstBase.Params[1].AsString := Trim(edtnomebanco.Text)+'%';
    cdsLstBase.Open;
  end;

end;

initialization
  RegisterClass(TfrmCadBanco);

end.
