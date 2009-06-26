unit UfrmKernel_CadPerfil;

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
  dxGDIPlusClasses, ExtCtrls, StdCtrls, cxPC, cxControls, Mask, DBCtrls;

type
  TfrmKernel_CadPerfil = class(TfrmKernel_CadBaseDB)
    Label1: TLabel;
    dbedtCODPERFIL: TDBEdit;
    Label2: TLabel;
    dbedtNOMEPERFIL: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure dbedtNOMEPERFILKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    function ValidaCampos(): Boolean; override;
  end;

var
  frmKernel_CadPerfil: TfrmKernel_CadPerfil;

implementation

uses UdmKernel_Perfil, UKernel_Exception, UKernel_Mensagem;

{$R *.dfm}

procedure TfrmKernel_CadPerfil.dbedtNOMEPERFILKeyPress(Sender: TObject;
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

procedure TfrmKernel_CadPerfil.FormShow(Sender: TObject);
begin
  inherited;
  DefineControle(dbedtNOMEPERFIL,dbedtNOMEPERFIL);
end;

function TfrmKernel_CadPerfil.ValidaCampos: Boolean;
begin
  if dbedtNOMEPERFIL.Text = '' then
    Begin
      dbedtNOMEPERFIL.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '  %s  ',['( Nome do Perfil )']);
    End;
end;

end.
