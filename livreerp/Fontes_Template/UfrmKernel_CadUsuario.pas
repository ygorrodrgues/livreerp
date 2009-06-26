unit UfrmKernel_CadUsuario;

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
  dxGDIPlusClasses, ExtCtrls, StdCtrls, cxPC, cxControls, Mask, DBCtrls,
  JvExMask, JvToolEdit, JvMaskEdit, JvDBControls;

type
  TfrmKernel_CadUsuario = class(TfrmKernel_CadBaseDB)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    dbedtNOMEUSU: TDBEdit;
    dblcbCODPERFIL: TcxDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    dbedtLOGINUSU: TDBEdit;
    Label5: TLabel;
    dbedtSENHAUSU: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label8: TLabel;
    dbedtDTEXPIRAUSU: TJvDBMaskEdit;
    dbchkEXPIRASENHAUSU: TDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure dbedtNOMEUSUKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    {Valida os campos obrigatorios da tela}
    function ValidaCampos(): Boolean; override;
    procedure Atualiza_Datasets_Auxiliares; override;    
  end;

var
  frmKernel_CadUsuario: TfrmKernel_CadUsuario;

implementation

uses UdmKernel_Usuario, UKernel_Exception, UKernel_Mensagem, UKernel_DB;{$R *.dfm}

{ TfrmKernel_CadUsuario }

procedure TfrmKernel_CadUsuario.Atualiza_Datasets_Auxiliares;
begin
  inherited;
  with dmKernel_CadUsuario do
  begin
    kernel_RefreshCds(cdsPerfil);
  end;
end;

procedure TfrmKernel_CadUsuario.dbedtNOMEUSUKeyPress(Sender: TObject;
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

procedure TfrmKernel_CadUsuario.FormShow(Sender: TObject);
begin
  inherited;
  DefineControle(dbedtNOMEUSU,dbedtNOMEUSU);
end;

function TfrmKernel_CadUsuario.ValidaCampos: Boolean;
begin
  if dbedtNOMEUSU.Text = '' then
    Begin
      dbedtNOMEUSU.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '  %s  ',['( Nome Completo do Usuário )']);
    End;
  if dbedtLOGINUSU.Text = '' then
    Begin
      dbedtLOGINUSU.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '  %s  ',['( Login do Usuário )']);
    End;
  if dbedtSENHAUSU.Text = '' then
    Begin
      dbedtSENHAUSU.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '  %s  ',['( Senha do Usuário )']);
    End;
  if dblcbCODPERFIL.Text = '' then
    Begin
      dblcbCODPERFIL.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '  %s  ',['( Perfil do Usuário )']);
    End;
  if dbchkEXPIRASENHAUSU.checked then
    if dbedtDTEXPIRAUSU.text = '  /  /  ' then
    Begin
      dbedtDTEXPIRAUSU.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '  %s  ',['( Data de Expiração )']);
    End;
end;

end.
