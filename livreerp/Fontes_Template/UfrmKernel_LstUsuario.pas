unit UfrmKernel_LstUsuario;

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
  TfrmKernel_LstUsuario = class(TfrmKernel_LstBase)
    edtCODUSU: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNOMEUSU: TEdit;
    edtLOGINUSU: TEdit;
    Label3: TLabel;
    cbbPERFILUSU: TComboBox;
    Label4: TLabel;
    cxgrdLst_BaseDBTableView1CODUSU: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1NOMEUSU: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1LOGINUSU: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1NOMEPERFIL: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCODUSUKeyPress(Sender: TObject; var Key: Char);
    procedure cbbPERFILUSUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure PesquisaBase; override;
    {Execura o metodo Imprimir Registro}
    procedure ImprimirRegistro(int_codrel: Integer); override;
  end;

var
  frmKernel_LstUsuario: TfrmKernel_LstUsuario;

implementation

uses UdmKernel_Usuario, UfrmKernel_CadUsuario, UKernel_VariaveisPublic,
  UKernel_DB;

{$R *.dfm}

procedure TfrmKernel_LstUsuario.cbbPERFILUSUKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key= VK_RETURN then actFiltrar.Execute;
end;

procedure TfrmKernel_LstUsuario.edtCODUSUKeyPress(Sender: TObject;
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

procedure TfrmKernel_LstUsuario.FormCreate(Sender: TObject);
begin
  if not Assigned(dmKernel_CadUsuario) then
    application.CreateForm(TdmKernel_CadUsuario, dmKernel_CadUsuario);

  inherited;

end;

procedure TfrmKernel_LstUsuario.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(dmKernel_CadUsuario) then
    FreeAndNil(dmKernel_CadUsuario);
end;

procedure TfrmKernel_LstUsuario.FormShow(Sender: TObject);
begin
  inherited;
  Kernel_Preenche_TComobox(cbbPERFILUSU,'PERFIL','NOMEPERFIL','');
  PesquisaBase;
end;


procedure TfrmKernel_LstUsuario.ImprimirRegistro(int_codrel: Integer);
begin
  inherited;

end;

procedure TfrmKernel_LstUsuario.PesquisaBase;
begin
  with dmKernel_CadUsuario do
  begin
    with DatasetListagem do
    begin
      Close;
      Params[0].value:= Trim(edtCODUSU.text)+'%';
      Params[1].value:= Trim(cbbPERFILUSU.text)+'%';
      Params[2].value:= Trim(edtNOMEUSU.text)+'%';
      Params[3].value:= Trim(edtLOGINUSU.text)+'%';
      Open;
    end;
  end;
  inherited;

end;

initialization
  RegisterClass(TfrmKernel_CadUsuario);

end.
