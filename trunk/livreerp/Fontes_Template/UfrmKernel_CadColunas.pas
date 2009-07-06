unit UfrmKernel_CadColunas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_CadMovBase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ActnList, ImgList, JvExControls,
  JvXPCore, JvXPButtons, RzPanel, DBCtrls, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  dxGDIPlusClasses, ExtCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, JvExMask, JvToolEdit, JvBaseEdits, RzEdit, Buttons, RzButton,
  StdCtrls, Mask, RzLabel, cxPC;

type
  TfrmKernel_CadColunas = class(TfrmKernel_CadMovBase)
    Label1: TLabel;
    Label2: TLabel;
    dbedtTLA_TITULO: TDBEdit;
    Label3: TLabel;
    dbedtTLA_CLASSE: TDBEdit;
    Label4: TLabel;
    dbedtTLA_TABELA: TDBEdit;
    cxgrdLst_BaseDBTableView1CLN_COLUNA: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1CLN_NOME: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1TLA_TELA: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1CLN_SOMA: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1CLN_FILTRA: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1CLN_TAMANHO: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1CLN_ORDEM: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1CLN_CHAVE: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1CLN_CAPTION: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1SMA_SOMA: TcxGridDBColumn;
    cxgrdLst_BaseDBTableView1CLN_NOME_AMIGAVEL: TcxGridDBColumn;
    dbedtTLA_NOME: TDBEdit;
    procedure dbedtTLA_TABELAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedtTLA_NOMEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    {Valida os campos obrigatorios da tela}
    function ValidaCampos(): Boolean; override;
  end;

var
  frmKernel_CadColunas: TfrmKernel_CadColunas;

implementation

uses UdmKernel_Colunas, UfrmKernel_CadItemColunas, UKernel_Exception,
  UKernel_Mensagem, UKernel_DB;

{$R *.dfm}

{ TfrmKernel_CadColunas }

procedure TfrmKernel_CadColunas.dbedtTLA_NOMEKeyPress(Sender: TObject;
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

procedure TfrmKernel_CadColunas.dbedtTLA_TABELAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if KEY = VK_RETURN then
    cxgrdLst_Base.SETFOCUS;  
end;

function TfrmKernel_CadColunas.ValidaCampos: Boolean;
begin
  if dbedtTLA_NOME.Text = '' then
    Begin
      dbedtTLA_NOME.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '%s ',['(Nome da View)']);
    End;

  {if dbedtTLA_TITULO.Text = '' then
    Begin
      dbedtTLA_TITULO.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '%s ',['(Titulo da Tela)']);
    End;   }

 { if dbedtTLA_CLASSE.Text = '' then
    Begin
      dbedtTLA_CLASSE.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '%s ',['(Classe Tela de Cadastro)']);
    End;   }

  if dbedtTLA_TABELA.Text = '' then
    Begin
      dbedtTLA_TABELA.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '%s ',['(Nome da Tabela)']);
    End;            
end;

initialization
  RegisterClass(TfrmKernel_CadItemColunas);

end.
