unit UfrmKernel_Confirma_Exclusao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Base, RzPanel, ExtCtrls, StdCtrls, RzEdit, ImgList,
  ActnList, JvExControls, JvXPCore, JvXPButtons, dxGDIPlusClasses, jpeg, GIFImg;

type
  TfrmKernel_Confirma_Exclusao = class(TfrmKernel_Base)
    imgExclusao: TImage;
    pnlTop: TRzPanel;
    pnlBottom: TRzPanel;
    actlstExclusao: TActionList;
    iltExclusao: TImageList;
    btnExcluir: TJvXPButton;
    actExcluir: TAction;
    actFechar: TAction;
    btnFechar: TJvXPButton;
    imgCadBase: TImage;
    lblSubtitulo: TLabel;
    lblTitulo: TLabel;
    RzPanel1: TRzPanel;
    mmoMotivoExclusao: TRzMemo;
    mmoExclusao: TRzMemo;
    lblMotivoExclusao: TLabel;
    procedure FormShow(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKernel_Confirma_Exclusao: TfrmKernel_Confirma_Exclusao;

implementation

uses UKernel_DB, UKernel_VariaveisPublic, UKernel_Exception, UKernel_Mensagem,
  UKernel_SysUtils;

{$R *.dfm}

procedure TfrmKernel_Confirma_Exclusao.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if mmoMotivoExclusao.Text = '' then
    Begin
      mmoMotivoExclusao.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio +  ' %s',['(Motivo da Exclusão)']);
    End;

  kernel_str_DescExclusao := mmoMotivoExclusao.Text;

  // So apaga o registro do db se o tipo de exclusão
  if Kernel_Tipo_Exclusao = ExApagar then
    begin
      Kernel_Apaga_Registro(Kernel_Cadastro.str_Tabela, Kernel_Cadastro.str_CampoChave,
        DatasetListagem.FieldByName(Kernel_Cadastro.str_CampoChave).Value);

      {Faz exclussão dos itens}
      if Kernel_Cadastro.str_ItemTabela <> '' then
        begin

        end;

    end;

  ModalResult := mrok;  
end;

procedure TfrmKernel_Confirma_Exclusao.actFecharExecute(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmKernel_Confirma_Exclusao.FormCreate(Sender: TObject);
begin
  //inherited;
  caption := 'Exclusão de ' +  kernel_srt_nmformbase;

end;

procedure TfrmKernel_Confirma_Exclusao.FormShow(Sender: TObject);
begin
  inherited;
  mmoMotivoExclusao.SetFocus;
end;

end.
