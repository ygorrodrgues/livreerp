unit UfrmConfiguracoesProjeto;

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
  dxSkinscxPCPainter, DB, ActnList, ImgList, JvExControls, JvXPCore,
  JvXPButtons, StdCtrls, Buttons, dxGDIPlusClasses, ExtCtrls, RzPanel, cxPC,
  cxControls, Mask, DBCtrls, DBClient;

type
  TfrmConfiguracoesProjeto = class(TfrmKernel_Parametro)
    Label1: TLabel;
    dbedtPASTAPROJETO: TDBEdit;
    Label2: TLabel;
    dbedtPASTATEMPLATE: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure dbedtPASTATEMPLATEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedtPASTAPROJETOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracoesProjeto: TfrmConfiguracoesProjeto;

implementation

uses Udmprincipal, UKernel_VariaveisPublic, UKernel_SysUtils;

{$R *.dfm}

procedure TfrmConfiguracoesProjeto.actSalvarExecute(Sender: TObject);
begin
  //inherited;
  ValidaCampos;

  if not (dsBase.DataSet.State in [dsEdit,dsInsert]) then
    begin
      dsBase.DataSet.Edit;
      dsBase.DataSet.post;
    end
   else
    dsBase.DataSet.post;
end;

procedure TfrmConfiguracoesProjeto.dbedtPASTAPROJETOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    dbedtPASTATEMPLATE.SetFocus;
end;

procedure TfrmConfiguracoesProjeto.dbedtPASTATEMPLATEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    btnSalvar.SetFocus;
end;

procedure TfrmConfiguracoesProjeto.FormCreate(Sender: TObject);
begin
  kernel_str_form := 'Configuração do Framework';
  inherited;

end;

procedure TfrmConfiguracoesProjeto.FormShow(Sender: TObject);
begin
  //inherited;
  dsBase.DataSet.close;
  dsBase.DataSet.Open;
  
  if not dsBase.DataSet.IsEmpty then
    dsBase.DataSet.Edit
   else
    dsBase.DataSet.Append;
    
   dbedtPASTAPROJETO.SetFocus;
end;

end.
