unit UfrmKernel_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Base, ActnCtrls, ToolWin, ActnMan, ActnMenus, Menus,
  ActnPopup, ActnList, CustomizeDlg, ImgList,
  ComCtrls, ExtCtrls, jpeg, XPStyleActnCtrls, StdCtrls, Buttons, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinsdxRibbonPainter, cxClasses, dxRibbon, cxControls, dxStatusBar,
  dxRibbonStatusBar, dxSkinsdxBarPainter, dxBar, dxsbar, dxBarDBNav,
  dxRibbonGallery, RzPanel, RzStatus, dxGDIPlusClasses, RzButton;

type
  TfrmKernel_Principal = class(TfrmKernel_Base)
    ilPrincipal: TImageList;
    mmPrincipal: TMainMenu;
    Arquivo1: TMenuItem;
    RzStatusBar1: TRzStatusBar;
    Image1: TImage;
    stspnServidor: TRzStatusPane;
    stspnModulo: TRzStatusPane;
    stspnEmpresa: TRzStatusPane;
    stspnUsuario: TRzStatusPane;
    RzClockStatus1: TRzClockStatus;
    RzStatusPane1: TRzStatusPane;
    RzToolbar1: TRzToolbar;
    actlstPrincipal: TActionList;
    RzToolButton1: TRzToolButton;
    actSair: TAction;
    Sair1: TMenuItem;
    actSobre: TAction;
    Sistema1: TMenuItem;
    Sobre1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actSairExecute(Sender: TObject);
    procedure actSobreExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CaregaConfiguracoestela;
  end;

var
  frmKernel_Principal: TfrmKernel_Principal;

implementation

uses UKernel_SysUtils,  UKernel_VariaveisPublic, UfrmKernel_Mensagem,
  UKernel_Mensagem, UfrmKernel_Sobre;

{$R *.dfm}

procedure TfrmKernel_Principal.actFecharExecute(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmKernel_Principal.actSairExecute(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmKernel_Principal.actSobreExecute(Sender: TObject);
begin
  inherited;
  Kernel_AbreForm(TfrmKernel_Sobre,frmKernel_Sobre);
end;

procedure TfrmKernel_Principal.CaregaConfiguracoestela;
begin
  {Atualiza Informacoes do statusbar}
  stspnEmpresa.caption  :=  Kernel_PropriedadesProjeto.str_SoftHouse;
  stspnServidor.caption :=  Kernel_Conexao.str_server+ '  ' + Kernel_Conexao.str_database;
  stspnUsuario.caption  :=  Kernel_Login.str_nomeusu
end;

procedure TfrmKernel_Principal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if (TFrmKernel_Mensagem.Mensagem(Kernel_Confirmacao_Sair_Aplicacao,'Q',[mbSim, mbNao])) then
    begin
      CanClose := True;
    end
   else
    begin
      CanClose := False;
    end; 
end;

procedure TfrmKernel_Principal.FormCreate(Sender: TObject);
begin
  kernel_str_form := Kernel_PropriedadesProjeto.str_TituloPrograma;
  inherited;

  {carega configuracoes basicas da tela}
  CaregaConfiguracoestela;  

  {Mostra a tela como maximizada}
  self.WindowState := wsMaximized;
end;

procedure TfrmKernel_Principal.FormShow(Sender: TObject);
begin
  inherited;
  //imgBackground.Picture.LoadFromFile();
end;

end.

