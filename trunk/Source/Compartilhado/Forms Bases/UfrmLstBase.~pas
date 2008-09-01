unit UfrmLstBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmBase, StdCtrls, ExtCtrls, pngextra, ComCtrls, ActnList, DB,
  AppEvnts, ImgList, Buttons,DBClient, Grids, DBGrids, XPMan;

type
  TfrmLstBase = class(TfrmBase)
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    Label3: TLabel;
    pnlTop: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    statBase: TStatusBar;
    pnlBottom: TPanel;
    lblAtalhos: TLabel;
    pnlRelBase: TPanel;
    lblTipoRel: TLabel;
    btnImprimir: TPNGButton;
    cbbRelBase: TComboBox;
    Panel7: TPanel;
    btnSair: TPNGButton;
    Panel5: TPanel;
    actlstLstBase: TActionList;
    imgLBase: TImageList;
    dsBase: TDataSource;
    btnNovo: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    actNovo: TAction;
    actAlterar: TAction;
    actExcluir: TAction;
    actAnterior: TAction;
    actPrimeiro: TAction;
    actProximo: TAction;
    actUltimo: TAction;
    actPesquisar: TAction;
    actFechar: TAction;
    actImprimir: TAction;
    dbgrdBase: TDBGrid;
    btnOk: TBitBtn;
    procedure actFecharExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdBaseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdBaseDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrdBaseColEnter(Sender: TObject);
    procedure dbgrdBaseCellClick(Column: TColumn);
    procedure actPesquisarExecute(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ShowHint(Sender: TObject);
    procedure NovoCadastro; virtual;
    procedure AlterarCadastro; virtual;
    procedure ExcluirCadastro; virtual;
    procedure PesquisaBase; virtual;
    // Usado para abrir relatorios
    procedure ImprimeCombox(codrel: integer); Virtual;

    procedure PreencheComboFiltro(J: Integer; cbb : TComboBox); virtual;
    function Poscampo(campo: String): Integer; virtual;
    function AnalisaPodePesquisa(): Boolean; virtual;
  end;

var
  frmLstBase: TfrmLstBase;

  Desc, Campo: Array[1..10] of string;  

implementation

uses UdbFuncoes;

{$R *.dfm}

procedure TfrmLstBase.actFecharExecute(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmLstBase.actImprimirExecute(Sender: TObject);
begin
  inherited;
  // Passa cmo parametro o relatorio desejado
  ImprimeCombox(cbbRelBase.ItemIndex);
end;

procedure TfrmLstBase.actNovoExecute(Sender: TObject);
begin
  inherited;
  NovoCadastro;
end;

procedure TfrmLstBase.actAlterarExecute(Sender: TObject);
begin
  inherited;
  AlterarCadastro;
end;

procedure TfrmLstBase.actExcluirExecute(Sender: TObject);
begin
  inherited;
  ExcluirCadastro;
end;

procedure TfrmLstBase.AlterarCadastro;
begin
  // Função Implementada no Filho
end;

function TfrmLstBase.AnalisaPodePesquisa: Boolean;
begin

end;

procedure TfrmLstBase.ExcluirCadastro;
begin
  // Função Implementada no Filho
end;

procedure TfrmLstBase.ImprimeCombox(codrel: integer);
begin
  // Função Implementada no Filho
end;

procedure TfrmLstBase.NovoCadastro;
begin
  // Função Implementada no Filho
end;

procedure TfrmLstBase.PesquisaBase;
begin
  { Verifica se o Dataset e da Classe TClienteDataset, for limpa os
   indices criados pela ordenação }
  if dsBase.DataSet is TClientDataSet then
    TiraOrdenacao(TClientDataSet(dsBase.DataSet));
end;

function TfrmLstBase.Poscampo(campo: String): Integer;
var
i: integer;
begin
  for i := 1 to 10 do
  begin
    if campo = desc[i] then
      Begin
        Result := i;
        break;
      end;
  end;
end;

procedure TfrmLstBase.PreencheComboFiltro(J: Integer; cbb: TComboBox);
begin

end;

procedure TfrmLstBase.ShowHint(Sender: TObject);
begin
  // Mostra o Hints da Operação Atual no statusBar
  statBase.Panels[0].Text := GetLongHint (Application.Hint);
end;

procedure TfrmLstBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_Insert : NovoCadastro;
    VK_F2     : AlterarCadastro;
    VK_F5     : ImprimeCombox(cbbRelBase.ItemIndex);
    VK_F6     : PesquisaBase;
  end;
end;

procedure TfrmLstBase.dbgrdBaseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // Impede o uso do ctrl + del
  if (Shift = [ssCtrl]) and (Key = 46) Then
  KEY := 0;

  case Key of
    VK_DELETE : ExcluirCadastro;
  end;
end;

procedure TfrmLstBase.dbgrdBaseDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dsbase.DataSet.Active then
    if TDBGrid(Sender).DataSource.DataSet.RecordCount > 0 then
      Begin
      {pinta checkbox}
        if Column.FieldName = TDBGrid(Sender).Columns[0].FieldName then
        begin
          // Configuração padrão
          dbgrdBase.Canvas.FillRect(Rect);
          imgLBase.Draw(TDBGrid(Sender).Canvas, Rect.Left + 10, Rect.Top + 1, 0); // Imagem em Branco

            if TDBGrid(Sender).DataSource.DataSet.FieldByName(TDBGrid(Sender).Columns[0].FieldName).Value = 'T' then
            imgLBase.Draw(TDBGrid(Sender).Canvas, Rect.Left + 10, Rect.Top + 1, 2) // Imagem com a Seta
           else
            imgLBase.Draw(TDBGrid(Sender).Canvas, Rect.Left + 10 , Rect.Top + 1, 1); // Imagem e Branca
        end;
      end;
end;

procedure TfrmLstBase.dbgrdBaseColEnter(Sender: TObject);
begin
  inherited;
  if dsbase.DataSet.Active then
    if TDBGrid(Sender).DataSource.DataSet.RecordCount > 0 then
      Begin
      if TDBGrid(Sender).SelectedField.FieldName = TDBGrid(Sender).Columns[0].FieldName then
        dbgrdBase.Options := dbgrdBase.Options - [dgEditing]
       else
        dbgrdBase.Options := dbgrdBase.Options + [dgEditing];
      end;
end;

procedure TfrmLstBase.dbgrdBaseCellClick(Column: TColumn);
begin
  inherited;
  if dsbase.DataSet.Active then
    if dsbase.DataSet.RecordCount > 0 then
      Begin
        // Quando o usuário clica na Coluna muda o status e atualiza
        if Column.Field.FieldName = dbgrdBase.Columns[0].FieldName then
          begin
            dsBase.DataSet.Edit;
              if (dsBase.DataSet.FieldByName(Column.Field.FieldName).Value = 'F') then
                dsBase.DataSet.FieldByName(Column.Field.FieldName).Value := 'T'
               else
                dsBase.DataSet.FieldByName(Column.Field.FieldName).Value := 'F';
            dsBase.DataSet.Post;
          end;
      end;
end;

procedure TfrmLstBase.actPesquisarExecute(Sender: TObject);
begin
  inherited;
  PesquisaBase;
  dbgrdBase.SetFocus;
end;

procedure TfrmLstBase.btnSairClick(Sender: TObject);
begin
  inherited;
  actFechar.Execute;
end;

procedure TfrmLstBase.btnImprimirClick(Sender: TObject);
begin
  inherited;
  actImprimir.Execute;
end;

end.
