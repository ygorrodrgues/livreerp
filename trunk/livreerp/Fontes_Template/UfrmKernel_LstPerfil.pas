unit UfrmKernel_LstPerfil;

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
  TfrmKernel_LstPerfil = class(TfrmKernel_LstBase)
    Label1: TLabel;
    edtCODPERFIL: TEdit;
    edtNOMEPERFIL: TEdit;
    Label2: TLabel;
    cxgrdLst_BaseDBTableView1CODPERFIL: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1NOMEPERFIL: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCODPERFILKeyPress(Sender: TObject; var Key: Char);
    procedure edtNOMEPERFILKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure PesquisaBase; override;
    {Execura o metodo Imprimir Registro}
    procedure ImprimirRegistro(int_codrel: Integer); override;
  end;

var
  frmKernel_LstPerfil: TfrmKernel_LstPerfil;

implementation

uses UdmKernel_Perfil, UKernel_VariaveisPublic, UfrmKernel_CadPerfil;

{$R *.dfm}

procedure TfrmKernel_LstPerfil.edtCODPERFILKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  {: troca ENTER por TAB}
  if key = #13 then
  begin
    Perform (CM_DialogKey, VK_TAB, 0);
    key:=#0;
  end;
end;

procedure TfrmKernel_LstPerfil.edtNOMEPERFILKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key= VK_RETURN then actFiltrar.Execute;
end;

procedure TfrmKernel_LstPerfil.FormCreate(Sender: TObject);
begin
  if not Assigned(dmKernel_Perfil) then
    application.CreateForm(TdmKernel_Perfil, dmKernel_Perfil);

  inherited;

end;

procedure TfrmKernel_LstPerfil.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(dmKernel_Perfil) then
    FreeAndNil(dmKernel_Perfil);
end;

procedure TfrmKernel_LstPerfil.FormShow(Sender: TObject);
begin
  inherited;
  PesquisaBase;
end;

procedure TfrmKernel_LstPerfil.ImprimirRegistro(int_codrel: Integer);
begin
  inherited;

end;

procedure TfrmKernel_LstPerfil.PesquisaBase;
begin
  with dmKernel_Perfil do
  begin
    with DatasetListagem do
    begin
      Close;
      Params[0].value:= Trim(edtCODPERFIL.text)+'%';
      Params[1].value:= Trim(edtNOMEPERFIL.text)+'%';
      Open;
    end;
  end;

  inherited;

end;

initialization
  RegisterClass(TfrmKernel_CadPERFIL);

end.
