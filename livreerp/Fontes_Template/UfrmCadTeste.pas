unit UfrmCadTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_CadBaseDB, DB, ActnList, ImgList, RzPanel, RzButton,
  StdCtrls, Buttons, dxGDIPlusClasses, ExtCtrls, ComCtrls, JvExControls,
  JvXPCore, JvXPButtons, RzTabs, RzStatus, cxGraphics, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxPC, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Menus, cxLookAndFeelPainters, cxButtons, cxLookAndFeels;

type
  TfrmCadTeste = class(TfrmKernel_CadBaseDB)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    {Valida os campos obrigatorios da tela}
    function ValidaCampos(): Boolean; override;
  end;

var
  frmCadTeste: TfrmCadTeste;

implementation

uses UdmTeste, UKernel_DB, UKernel_Mensagem;

{$R *.dfm}

{ TfrmCadTeste }

procedure TfrmCadTeste.FormShow(Sender: TObject);
begin
  inherited;
  {Define qual sao os Primeiro e Ultimos TWincontrol da tela }
  //DefineControle(dbedtPLM_NOME,DBlcbCDVEND );
end;


function TfrmCadTeste.ValidaCampos: Boolean;
begin

end;

end.
