unit UfrmKernel_CadItemColunas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_CadItemBase, ImgList, Menus, ActnList, DB, StdCtrls,
  Buttons, JvExControls, JvXPCore, JvXPButtons, ExtCtrls, RzPanel, Mask, DBCtrls,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmKernel_CadItemColunas = class(TfrmKernel_CadItemBase)
    Label1: TLabel;
    dbedtCLN_COLUNA: TDBEdit;
    Label2: TLabel;
    dbedtCLN_NOME: TDBEdit;
    Label4: TLabel;
    dbchkCLN_FILTRA: TDBCheckBox;
    dbchkCLN_SOMA: TDBCheckBox;
    Label5: TLabel;
    dbedtCLN_NOME_AMIGAVEL: TDBEdit;
    Label6: TLabel;
    dbedtCLN_TAMANHO: TDBEdit;
    dbchkCLN_CHAVE: TDBCheckBox;
    dsLstSoma: TDataSource;
    dbcbbSMA_SOMA: TcxDBLookupComboBox;
    dbedtCLN_CAPTION: TDBEdit;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    {Valida os campos obrigatorios da tela}
    function ValidaCampos(): Boolean; override;
  end;

var
  frmKernel_CadItemColunas: TfrmKernel_CadItemColunas;

implementation

uses UdmKernel_Colunas, UKernel_DB, UKernel_Mensagem, UKernel_Exception;

{$R *.dfm}

procedure TfrmKernel_CadItemColunas.FormShow(Sender: TObject);
begin
  inherited;
  with dmKernel_Colunas do
  begin
    kernel_RefreshCds(CdsLstSoma);
  end;
end;

function TfrmKernel_CadItemColunas.ValidaCampos: Boolean;
begin
  if dbedtCLN_NOME.Text = '' then
    Begin
      dbedtCLN_NOME.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '%s ',['(Nome do Campo)']);
    End;

  if dbedtCLN_TAMANHO.Text = '' then
    Begin
      dbedtCLN_TAMANHO.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '%s ',['(Tamanho da Coluna)']);
    End;

  if dbedtCLN_CAPTION.Text = '' then
    Begin
      dbedtCLN_CAPTION.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '%s ',['(Titulo Coluna)']);
    End;

  if dbcbbSMA_SOMA.Text = '' then
    Begin
      dbcbbSMA_SOMA.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '%s ',['(Tipo de Totalização)']);
    End;

  if dbedtCLN_NOME_AMIGAVEL.Text = '' then
    Begin
      dbedtCLN_NOME_AMIGAVEL.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '%s ',['(Nome Amigavel)']);
    End;                
end;

end.
