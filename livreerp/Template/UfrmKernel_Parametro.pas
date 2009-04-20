unit UfrmKernel_Parametro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Base, StdCtrls, Buttons, dxGDIPlusClasses, ExtCtrls, DB,
  ActnList, ImgList, dxSkinsCore,  JvExControls, JvXPCore, JvXPButtons,
  RzPanel, cxPC, cxControls, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, DBClient, JvSpeedButton;


type
  TfrmKernel_Parametro = class(TfrmKernel_Base)
    ilCadBase: TImageList;
    actlstCadBase: TActionList;
    actCancelar: TAction;
    actSalvar: TAction;
    actFechar: TAction;
    actAbrir: TAction;
    dsBase: TDataSource;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    imgCadBase: TImage;
    lblCadAuxiliar: TLabel;
    cbbCadAuxiliar: TComboBox;
    btnSalvar: TJvXPButton;
    btnCancelar: TJvXPButton;
    Label4: TLabel;
    Label5: TLabel;
    btnAbrirCadAuxiliar: TJvSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    obj_Dt: TDataModule;
  public
    {Valida os campos obrigatorios da tela}
   function ValidaCampos(): Boolean; virtual;
   {Habilita a opção que escolher / abrir cadastros auxiliares
     bol_acao = True =  Habilita os controles
     bol_acao = False = Não Habilita os controles     
      }
   procedure Habilita_Cadastro_Axilizar(bol_acao: Boolean); virtual;
  end;

  TDataModuleClass = class of TDataModule;

var
  frmKernel_Parametro: TfrmKernel_Parametro;

implementation

uses UKernel_VariaveisPublic;

{$R *.dfm}

procedure TfrmKernel_Parametro.actCancelarExecute(Sender: TObject);
begin
  inherited;
  if dsBase.DataSet.State in [dsedit, dsinsert] then
    dsBase.DataSet.Cancel;
    
  close;
end;

procedure TfrmKernel_Parametro.actSalvarExecute(Sender: TObject);
begin
  inherited;
  ValidaCampos;
  
  dsBase.DataSet.post;
  TClientDataSet(dsBase.DataSet).ApplyUpdates(0);

  dsBase.DataSet.edit;
end;

procedure TfrmKernel_Parametro.FormCreate(Sender: TObject);
var
  dmClass : TDataModuleClass;
begin
  // Localiza classe
  dmClass := TDataModuleClass(FindClass(strdmclasss));
  try
    // Verifica se nao existe o objeto na memoria
    if not Assigned(obj_Dt) then
      // se nao existir cria
      obj_Dt := dmClass.Create(self);
  except
    FreeAndNil(obj_Dt);
  end;
  
  kernel_str_form := 'Cadastro de ' + kernel_srt_nmformbase;
  
  inherited;

end;

procedure TfrmKernel_Parametro.FormDestroy(Sender: TObject);
begin
  inherited;
  // Verifica se o objeto existe na memoria
  if Assigned(obj_Dt) then
    // Se existir libera da memoria
    FreeAndNil(obj_Dt);
end;

procedure TfrmKernel_Parametro.FormShow(Sender: TObject);
begin
  inherited;
  dsBase.DataSet.close;
  dsBase.DataSet.Open;

  if not (dsBase.DataSet.IsEmpty) then
    dsBase.DataSet.Edit
   else
    dsBase.DataSet.Append;
end;

procedure TfrmKernel_Parametro.Habilita_Cadastro_Axilizar(bol_acao: Boolean);
begin
  lblCadAuxiliar.Visible := bol_acao;
  cbbCadAuxiliar.Visible := bol_acao;
  btnAbrirCadAuxiliar.Visible := bol_acao;    
end;

function TfrmKernel_Parametro.ValidaCampos(): Boolean;
begin
  // AQUI SERA CODIFICADO NO FILHO
end;

end.
