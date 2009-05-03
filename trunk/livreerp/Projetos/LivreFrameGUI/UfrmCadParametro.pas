unit UfrmCadParametro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Parametro, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, JvExControls, JvSpeedButton, StdCtrls, Mask, DBCtrls, DB,
  ActnList, ImgList, JvXPCore, JvXPButtons, Buttons, dxGDIPlusClasses, ExtCtrls,
  RzPanel, cxPC, cxControls, JvBaseDlg, JvSelectDirectory;

type
  TfrmCadParametro = class(TfrmKernel_Parametro)
    slcDtyParametro: TJvSelectDirectory;
    Label1: TLabel;
    dbedtPASTA_PROJETO: TDBEdit;
    Label2: TLabel;
    dbedtTEMPLATE_PROJETO: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure dbedtPASTA_PROJETOKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function ValidaCampos(): Boolean; override;
  end;

var
  frmCadParametro: TfrmCadParametro;

implementation

uses UKernel_Exception, UKernel_Mensagem, udmParametro, UKernel_VariaveisPublic;

{$R *.dfm}

{ TfrmKernel_Parametro1 }

procedure TfrmCadParametro.dbedtPASTA_PROJETOKeyPress(Sender: TObject;
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

procedure TfrmCadParametro.FormCreate(Sender: TObject);
begin
  {Informa o nome do datamodule}
  strdmclasss := 'TdmParametro';
  inherited;

end;

procedure TfrmCadParametro.FormShow(Sender: TObject);
begin
  inherited;
  {Informa que nao vai existir cadastros auxiliares}
  Habilita_Cadastro_Axilizar(False);
  
  dbedtPASTA_PROJETO.setfocus;
end;

function TfrmCadParametro.ValidaCampos: Boolean;
begin
  if dbedtPASTA_PROJETO.Text = '' then
    Begin
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '  %s  ',['( Pasta do Projeto )']);
      dbedtPASTA_PROJETO.SetFocus;
    End;

  if dbedtTEMPLATE_PROJETO.Text = '' then
    Begin
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '  %s  ',['( Pasta dos Templates)']);
      dbedtTEMPLATE_PROJETO.SetFocus;
    End;
end;

initialization
  RegisterClass(TdmParametro);

end.

