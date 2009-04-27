unit UfrmKernel_PesquisaBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Base, ExtCtrls, RzPanel, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ImgList, ActnList, RzStatus, StdCtrls, RzLabel,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxGDIPlusClasses, JvExControls,
  JvXPCore, JvXPButtons, RzButton;

type
  TfrmKernel_PesquisaBase = class(TfrmKernel_Base)
    RzPanel1: TRzPanel;
    grdbtblvwPesquisa: TcxGridDBTableView;
    grdlvlPesquisa: TcxGridLevel;
    cxgrdPesquisa: TcxGrid;
    RzPanel3: TRzPanel;
    actlstPesquisa: TActionList;
    ilPesquisa: TImageList;
    dsPesquisa: TDataSource;
    actPesquisar: TAction;
    actFechar: TAction;
    rzstsbrbase: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    lblSubtitulo: TLabel;
    lblTitulo: TLabel;
    imgCadBase: TImage;
    RzToolbar1: TRzToolbar;
    btnPesquisar: TRzToolButton;
    btnFechar: TRzToolButton;
    RzSpacer1: TRzSpacer;
    actNovo: TAction;
    actAlterar: TAction;
    actExcluir: TAction;
    btnNovo: TRzToolButton;
    RzSpacer2: TRzSpacer;
    procedure grdbtblvwPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdbtblvwPesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    // Pesquisa do produto registros conforme os parametros informados
    procedure PesquisaBase; virtual;
    procedure Antes_PesquisaBase; virtual;
    procedure Depois_PesquisaBase; virtual;
    procedure Executa_PesquisaBase; virtual;
    // Inseri o registro selecionado no grid na tabela informada no filho
    procedure InseriBase; virtual;
    // Abre um a Tela de cadastrar novo produto[SC]
    procedure Kernel_Abre_Cadasto; virtual;

    function AnalisaPodePesquisa(): Boolean; virtual;

    procedure Inseri_Novo_Registro; virtual;
    procedure Alterar_Registro; virtual;
  end;

var
  frmKernel_PesquisaBase: TfrmKernel_PesquisaBase;

implementation

uses UfrmKernel_Aguarde, UKernel_VariaveisPublic;

{$R *.dfm}

{ TfrmPesquisaBase }

procedure TfrmKernel_PesquisaBase.Kernel_Abre_Cadasto;
begin

end;

procedure TfrmKernel_PesquisaBase.actFecharExecute(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmKernel_PesquisaBase.actPesquisarExecute(Sender: TObject);
begin
  inherited;
  Executa_PesquisaBase;
end;

procedure TfrmKernel_PesquisaBase.Alterar_Registro;
begin

end;

function TfrmKernel_PesquisaBase.AnalisaPodePesquisa: Boolean;
Var 
  i : Integer;
Begin
  Result := False;
  
  for i := 0 to ComponentCount -1 do
  Begin
    if Components[i] is TEdit then
      begin
       if TEdit(Components[i]).Text <> '' then
         begin
           Result := True;
         end;
      end;

    if Components[i] is TComboBox then
      begin
       if TComboBox(Components[i]).Text <> '' then
         begin
           Result := True;
         end;
      end;
  End;
end;

procedure TfrmKernel_PesquisaBase.Antes_PesquisaBase;
begin

end;

procedure TfrmKernel_PesquisaBase.grdbtblvwPesquisaDblClick(Sender: TObject);
begin
  inherited;
  // Se de dois cliques inseri itm
  if not (dsPesquisa.DataSet.IsEmpty) then
    InseriBase;
end;

procedure TfrmKernel_PesquisaBase.grdbtblvwPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  // Se for Enter [SC]   
  case key of
    VK_RETURN : Begin
                  // Verifica se tem registros [SC]
                  if not (dsPesquisa.DataSet.IsEmpty) then
                    InseriBase;
                End;
                
    VK_INSERT : Kernel_Abre_Cadasto;
    VK_Escape : close;
  end;
end;

procedure TfrmKernel_PesquisaBase.Depois_PesquisaBase;
begin

end;

procedure TfrmKernel_PesquisaBase.Executa_PesquisaBase;
begin
  if AnalisaPodePesquisa then
    Begin
      if not Assigned(frmKernel_Aguarde) then
        Application.CreateForm(TfrmKernel_Aguarde, frmKernel_Aguarde);
      try
        frmKernel_Aguarde.Show;
        frmKernel_Aguarde.Update;
        Application.ProcessMessages;

        PesquisaBase;
        
      finally
        if Assigned(frmKernel_Aguarde) then
          FreeAndNil(frmKernel_aguarde);
      end;
    End;
end;

procedure TfrmKernel_PesquisaBase.FormCreate(Sender: TObject);
begin
  kernel_str_form := 'Pesquisa de ' + kernel_srt_nmformbase;
  lblTitulo.caption:= kernel_str_form;
  lblSubtitulo.Caption := 'Pesquisa/Filtro de ' + kernel_srt_nmformbase;
  inherited;

end;

procedure TfrmKernel_PesquisaBase.InseriBase;
begin

end;

procedure TfrmKernel_PesquisaBase.Inseri_Novo_Registro;
begin

end;

procedure TfrmKernel_PesquisaBase.PesquisaBase;
begin

end;

end.
