unit UfrmCadBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_CadBaseDB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxContainer, cxEdit, DB, ActnList, ImgList, JvExControls,
  JvXPCore, JvXPButtons, RzPanel, RzButton, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  dxGDIPlusClasses, ExtCtrls, StdCtrls, cxPC, Mask, DBCtrls;

type
  TfrmCadBanco = class(TfrmKernel_CadBaseDB)
    Label1: TLabel;
    dbedtCODBANCO: TDBEdit;
    Label2: TLabel;
    dbedtNOMEBANCO: TDBEdit;
    Label3: TLabel;
    dbedtLICENCABANCO: TDBEdit;
    procedure dbedtNOMEBANCOKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    {Valida os campos obrigatorios da tela}
    function ValidaCampos(): Boolean; override;
    { usado para quando for novo pela listagem, novo e alterar pela tela
      de cadastro, ja vim no foco no componente certo}
    procedure Foco_Inicial; override;
  end;

var
  frmCadBanco: TfrmCadBanco;

implementation

uses UdmBanco, UKernel_DB, UKernel_Mensagem, UKernel_Exception;

{$R *.dfm}

procedure TfrmCadBanco.dbedtNOMEBANCOKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  {: troca ENTER por TAB}
  if key = #13 then
    begin
      Perform (CM_DialogKey, VK_TAB, 0);
      key:=#0;
    end;
end;

procedure TfrmCadBanco.Foco_Inicial;
begin
  inherited;
  dbedtNOMEBANCO.SetFocus;
end;

function TfrmCadBanco.ValidaCampos: Boolean;
begin

  if dbedtNOMEBANCO.Text = '' then
  Begin
    dbedtNOMEBANCO.SetFocus;
    raise Livre_Mensagem_Global.CreateFmt
      (Kernel_Aviso_CampoObrigatorio + '  %s  ', ['( Nome do Banco )']);
  End;

end;

end.
