{
  TipoPesquisa
   1  : Clientes Tipos Avalstas
}
unit UfrmKernel_PesquisaGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Base, StdCtrls, ExtCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  ComCtrls, Buttons, pngimage, DB, DBTables, DBClient, Provider, FMTBcd, SqlExpr,
  ImgList, ActnList, frxpngimage;

type
  TfrmKernel_PesquisaGeral = class(TfrmKernel_Base)
    Panel1: TPanel;
    statBase: TStatusBar;
    dbgBase: TJvDBGrid;
    imgBase: TImage;
    edtCodigo: TEdit;
    edtNome: TEdit;
    lblCodigo: TLabel;
    lblNome: TLabel;
    Panel2: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    lblTitulo: TLabel;
    dsPesqBase: TDataSource;
    CdsPesqBase: TClientDataSet;
    DspBase: TDataSetProvider;
    qryBase: TSQLQuery;
    actlstPesquisar: TActionList;
    ilPesquisar: TImageList;
    actFiltrar: TAction;
    actFechar: TAction;
    procedure dbgBaseDblClick(Sender: TObject);
    procedure dbgBaseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFiltrarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PesquisaBase;
    procedure InseriBase;
  end;

var
  frmKernel_PesquisaGeral: TfrmKernel_PesquisaGeral;

  // Campos Genericos
  Tabela, CampoCodigo, CampoNome, CampoData,
  CampoExclusao, Condicaoauxiliar1, CampoStatus: string;

  TipoPesquisa: Integer;

implementation

uses UdmPrincipal, UKernel_VariaveisPublic;

{$R *.dfm}

procedure TfrmKernel_PesquisaGeral.actFecharExecute(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmKernel_PesquisaGeral.actFiltrarExecute(Sender: TObject);
begin
  inherited;
   PesquisaBase;
   dbgbase.setfocus;
end;

procedure TfrmKernel_PesquisaGeral.dbgBaseDblClick(Sender: TObject);
begin
  inherited;
  InseriBase;
end;

procedure TfrmKernel_PesquisaGeral.dbgBaseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    InseriBase;
end;

procedure TfrmKernel_PesquisaGeral.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  {: troca ENTER por TAB}
  if key = #13 then
  begin
    Perform (CM_DialogKey, VK_TAB, 0);
    key:=#0;
  end
end;

procedure TfrmKernel_PesquisaGeral.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key =VK_RETURN then
    btnConfirmar.setfocus;
end;

procedure TfrmKernel_PesquisaGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   Condicaoauxiliar1 := '';
end;

procedure TfrmKernel_PesquisaGeral.FormCreate(Sender: TObject);
begin
  kernel_srt_nmformbase := 'Pesquisa Generica';
  inherited;

end;

procedure TfrmKernel_PesquisaGeral.FormShow(Sender: TObject);
begin
  inherited;
  // Seta Colunas do DbGrid
  dbgBase.Columns[0].FieldName:= CampoCodigo;
  dbgBase.Columns[1].FieldName:= CampoNome;
end;

procedure TfrmKernel_PesquisaGeral.InseriBase;
begin
  if dsPesqBase.DataSet.RecordCount > 0 then
    begin
      // Passa o Valor do Campo Nome pro Campo
      CampoNome :='';
      CampoNome :=  dbgBase.Fields[1].AsString; 
      CampoCodigo :='';
      CampoCodigo := dbgBase.Fields[0].AsString;      
      
      ModalResult:= mrOk;
    end;
end;

procedure TfrmKernel_PesquisaGeral.PesquisaBase;
begin
  with CdsPesqBase do
  Begin
    close;
    CommandText:='';
    CommandText:='select ' + CampoCodigo + ', ' + CampoNome + ' from '+ Tabela;

    if CampoData <> '' then
      CommandText:= CommandText + ' where '+ CampoData + ' is null and '+ CampoExclusao+ ' is null' ;

    if CampoData ='' then
      CommandText:= CommandText + ' Where ' + CampoCodigo + ' like :campocodigo '
     else
     CommandText:= CommandText + ' and ' + CampoCodigo + ' like :campocodigo ';

     CommandText:= CommandText + ' and ' + CampoNome + ' like :camponome ' ;

    if Condicaoauxiliar1 <> '' then
      Begin
        CommandText:= CommandText + condicaoauxiliar1 ;
      End;

    Params[0].Value :=  trim(edtCodigo.Text) + '%';
    Params[1].Value := trim(edtNome.Text) + '%';

    // Pesquisa Por Status
    if CampoStatus <> '' then
      Begin
        case TipoPesquisa of
          1 : begin // CLientes Avalistas
                CommandText:= CommandText + ' and ' + CampoStatus + ' = "T" ' ;
             end;
        end;
      end;

    // Faz Ordenação
    CommandText:= CommandText + ' order by '+ CampoCodigo + ','+ CampoNome;
    Open;

    statBase.Panels[1].Text := IntToStr(Recordcount);
  end;
end;

end.
