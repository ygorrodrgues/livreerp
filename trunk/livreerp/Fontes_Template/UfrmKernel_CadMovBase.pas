unit UfrmKernel_CadMovBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_CadBaseDB, DB, ImgList, ComCtrls, pngimage, JvExControls,
  JvXPCore, JvXPButtons, StdCtrls,  ExtCtrls, Mask, DBCtrls, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, ActnList, RzPanel, RzButton, Buttons,
  JvExMask, JvToolEdit, JvBaseEdits, JvDBControls, dxGDIPlusClasses, cxGraphics,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxLookAndFeelPainters, dxSkinscxPCPainter, cxPC,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzLabel, RzEdit;

type
  TfrmKernel_CadMovBase = class(TfrmKernel_CadBaseDB)
    dsBaseItm: TDataSource;
    actlstItens: TActionList;
    actNovoItem: TAction;
    actAlterarItem: TAction;
    actExcluirItem: TAction;
    RzPanel3: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    dbedtCODIGO: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    actPesquisaProduto: TAction;
    RzLabel9: TRzLabel;
    RzToolbar2: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzToolButton3: TRzToolButton;
    pnlItem: TRzPanel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    btnPesquisaProduto: TSpeedButton;
    RzLabel8: TRzLabel;
    edtCoddesc: TRzEdit;
    edtqtdunit: TJvCalcEdit;
    edtprecounit: TJvCalcEdit;
    cxgrdLst_Base: TcxGrid;
    cxgrdLst_BaseDBTableView1: TcxGridDBTableView;
    cxgrdLst_BaseLevel1: TcxGridLevel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actNovoItemExecute(Sender: TObject);
    procedure actAlterarItemExecute(Sender: TObject);
    procedure actExcluirItemExecute(Sender: TObject);
    procedure cxgrdLst_BaseEnter(Sender: TObject);
    procedure cxgrdLst_BaseDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtprecounitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure AntesExcluirRegistro;
    procedure DepoisExcluirRegistro;
    procedure ExcluirRegistro;
    procedure Executa_ExcluirRegistro;

  public
    procedure HabilitaBotoes(Value :  Boolean); virtual;

    {Executa antes de executar o novo registro}
    procedure AntesNovoRegistro; virtual;
    {Execura o metodo Novo Registro}
    procedure NovoRegistro; virtual;
    {Executa Todo o processo de antes novo depois}
    procedure Executa_NovoRegistro; virtual;
    {Executa Depois de executar o novo registro}
    procedure DepoisNovoRegistro; virtual;

    {Executa antes de executar o Alterar registro}
    procedure AntesAlterarRegistro; virtual;
    {Execura o metodo Alterar Registro}
    procedure AlterarRegistro; virtual;
    {Executa Todo o processo de antes Alterar depois}
    procedure Executa_AlterarRegistro; virtual;
    {Executa Depois de executar o Alterar registro}
    procedure DepoisAlterarRegistro; virtual;

    // ------------- Referente ao itens da tela ----------------------------------

    procedure PesquisaItens(int_codchave: integer); virtual;

    {Executa antes de executar o Excluir registro}
    procedure AntesExcluirRegistroItm; virtual;
    {Execura o metodo Excluir Registro}
    procedure ExcluirRegistroItm; virtual;
    {Executa Todo o processo de antes Excluir depois}
    procedure Executa_ExcluirRegistroItm; virtual;
    {Executa Depois de executar o Excluir registro}
    procedure DepoisExcluirRegistroItm; virtual;

    {Executa antes de executar o novo registro}
    procedure AntesNovoRegistroItm; virtual;
    {Execura o metodo Novo Registro}
    procedure NovoRegistroItm; virtual;
    {Executa Todo o processo de antes novo depois}
    procedure Executa_NovoRegistroItm; virtual;
    {Executa Depois de executar o novo registro}
    procedure DepoisNovoRegistroItm; virtual;

    {Executa antes de executar o Alterar registro}
    procedure AntesAlterarRegistroItm; virtual;
    {Execura o metodo Alterar Registro}
    procedure AlterarRegistroItm; virtual;
    {Executa Todo o processo de antes Alterar depois}
    procedure Executa_AlterarRegistroItm; virtual;
    {Executa Depois de executar o Alterar registro}
    procedure DepoisAlterarRegistroItm; virtual;

    // ------------- Referente ao itens da tela ----------------------------------

    {valida o status do item atual
      Inseri ou atualiza o item
    }
    procedure ValidaItem;   
  end;

var
  frmKernel_CadMovBase: TfrmKernel_CadMovBase;

implementation

uses UKernel_VariaveisPublic, UKernel_SysUtils, UKernel_Mensagem,
  UKernel_Exception, UKernel_DB;

{$R *.dfm}

{ TfrmCadMovBase }


procedure TfrmKernel_CadMovBase.actAlterarItemExecute(Sender: TObject);
begin
  inherited;
  Executa_AlterarRegistroitm;
end;

procedure TfrmKernel_CadMovBase.actExcluirItemExecute(Sender: TObject);
begin
  inherited;
  Executa_ExcluirRegistroitm;
end;

procedure TfrmKernel_CadMovBase.actNovoItemExecute(Sender: TObject);
begin
  inherited;
  Executa_NovoRegistroitm;
end;

procedure TfrmKernel_CadMovBase.AlterarRegistro;
begin

end;

procedure TfrmKernel_CadMovBase.AlterarRegistroItm;
 var
 obj: TForm;
 frmclass: TFormClass;
begin
  // Localiza classe
  frmclass := TFormClass(FindClass(strclassItem));
  try
    // Instancia formulario
    obj := frmclass.Create(self);
    // Executa antes de alterar o registro
    AntesAlterarRegistroitm;

    // Mostra para o usuario
    obj.ShowModal;
  finally
    //if obj.ModalResult = mrok then
      begin
        // Executa depois de alterar o registro
        DepoisAlterarRegistroitm;

        PesquisaItens(DatasetCadastro.FieldByName(Kernel_Cadastro.str_CampoChave).value);

        // Volta o foco para o registro alterado depois de atualizar os dados
        dsBaseItm.DataSet.Locate(Kernel_Cadastro.str_ItemCampoChave, DatasetCadastro.FieldByName(Kernel_Cadastro.str_CampoChave).value,[]);
      end;

    // Libera Instancia da memoria
    FreeAndNil(obj);
  end;

end;

procedure TfrmKernel_CadMovBase.AntesAlterarRegistro;
begin

end;

procedure TfrmKernel_CadMovBase.AntesAlterarRegistroItm;
begin

end;

procedure TfrmKernel_CadMovBase.AntesExcluirRegistro;
begin

end;

procedure TfrmKernel_CadMovBase.AntesExcluirRegistroItm;
begin

end;

procedure TfrmKernel_CadMovBase.AntesNovoRegistro;
begin

end;

procedure TfrmKernel_CadMovBase.AntesNovoRegistroItm;
begin

end;

procedure TfrmKernel_CadMovBase.cxgrdLst_BaseDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
    VK_INSERT : Executa_NovoRegistroItm;
    VK_F2     : Executa_AlterarRegistroItm;
    VK_DELETE : Executa_ExcluirRegistroItm;
  end;
end;

procedure TfrmKernel_CadMovBase.cxgrdLst_BaseEnter(Sender: TObject);
begin
  inherited;
  with DatasetCadastro do
  begin
    if DatasetCadastro.State in [dsinsert] then
    begin
      //AntesSalvarRegistro;

      DatasetCadastro.Post;
      DatasetCadastro.ApplyUpdates(0);

      //DepoisSalvarRegistro;

      DatasetCadastro.edit;

      PesquisaItens(DatasetCadastro.FieldByName(Kernel_Cadastro.str_CampoChave).value);

      // depois de salvar habilita os botoes
      HabilitaBotoes(True);
    end;
  end;
end;

procedure TfrmKernel_CadMovBase.DepoisAlterarRegistro;
begin
  PesquisaItens(DatasetCadastro.FieldByName(Kernel_Cadastro.str_CampoChave).value);
end;

procedure TfrmKernel_CadMovBase.DepoisAlterarRegistroItm;
begin

end;

procedure TfrmKernel_CadMovBase.DepoisExcluirRegistro;
begin

end;

procedure TfrmKernel_CadMovBase.DepoisExcluirRegistroItm;
begin

end;

procedure TfrmKernel_CadMovBase.DepoisNovoRegistro;
begin
  PesquisaItens(DatasetCadastro.FieldByName(Kernel_Cadastro.str_CampoChave).value);
end;

procedure TfrmKernel_CadMovBase.DepoisNovoRegistroItm;
begin

end;

procedure TfrmKernel_CadMovBase.edtprecounitKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    begin
      ValidaItem;
    end;
end;

procedure TfrmKernel_CadMovBase.ExcluirRegistro;
begin

end;

procedure TfrmKernel_CadMovBase.ExcluirRegistroItm;
begin
  Kernel_Apaga_Registro(Kernel_Cadastro.str_ItemTabela, Kernel_Cadastro.str_ItemCampoChave,
    DatasetListagemItem.FieldByName(Kernel_Cadastro.str_ItemCampoChave).Value);
end;

procedure TfrmKernel_CadMovBase.Executa_AlterarRegistro;
begin
  AlterarRegistro;
end;

procedure TfrmKernel_CadMovBase.Executa_AlterarRegistroItm;
begin
  AlterarRegistroItm;
end;

procedure TfrmKernel_CadMovBase.Executa_ExcluirRegistro;
begin

end;

procedure TfrmKernel_CadMovBase.Executa_ExcluirRegistroItm;
var
  int_codigo: Integer;
begin
  // Chama o Evento Antes de Excluir
  AntesExcluirRegistro;

  if Kernel_Confirmacao_acao(Kernel_Confirmacao_Apaga_Registro, 'D') then
    begin
      {Apaga registro atual}
      try
        try
          int_codigo:= DatasetListagem.FieldByName(Kernel_Cadastro.str_CampoChave).Value;

          ExcluirRegistroItm;;

          // Chama o Evento Apos Excluir
          DepoisExcluirRegistroitm;

          Application.MessageBox(pchar(Kernel_Aviso_Exclusao), pchar(Kernel_PropriedadesProjeto.str_SoftHouse), MB_OK + MB_ICONINFORMATION);

          PesquisaItens(DatasetCadastro.FieldByName(Kernel_Cadastro.str_CampoChave).value);

          DatasetListagem.Locate( Kernel_Cadastro.str_CampoChave,int_codigo ,[]);          
        except
          raise Livre_Mensagem_Global.CreateFmt(Kernel_Erro_FalhaInesperada +' o registro %s . ', ['(' +
            IntToStr(DatasetListagem.FieldByName(Kernel_Cadastro.str_CampoChave).Value) + ')']);
        end;
      finally
        Kernel_DestroyAguarde;
      end;
    end;

end;

procedure TfrmKernel_CadMovBase.Executa_NovoRegistro;
Begin
  NovoRegistro;
end;

procedure TfrmKernel_CadMovBase.Executa_NovoRegistroItm;
begin
  NovoRegistroItm;
end;

procedure TfrmKernel_CadMovBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;

end;

procedure TfrmKernel_CadMovBase.FormShow(Sender: TObject);
begin
  inherited;

  {Campo codigo da tabela}
  dbedtCODIGO.DataField := Kernel_Cadastro.str_CampoChave;

  if DatasetCadastro.State in [dsInsert] then
    begin
      HabilitaBotoes(False);
      PesquisaItens(DatasetCadastro.FieldByName(Kernel_Cadastro.str_CampoChave).value);
    end;
end;

procedure TfrmKernel_CadMovBase.HabilitaBotoes(Value : Boolean);
begin
  actNovoItem.Enabled := value;
  actAlterarItem.Enabled := value;
  actExcluirItem.Enabled := value;

  if pnlItem.Visible then
    begin
      edtCoddesc.Enabled := value;
      edtqtdunit.Enabled := value;
      edtprecounit.Enabled := value;
    end;
end;

procedure TfrmKernel_CadMovBase.NovoRegistro;
Begin

end;

procedure TfrmKernel_CadMovBase.NovoRegistroItm;
 var
 obj: TForm;
 frmclass: TFormClass;
begin
  // Localiza classe
  frmclass := TFormClass(FindClass(strclassItem));
  try
    // Instancia formulario
    obj := frmclass.Create(self);
    // Executa antes de novo o registro
    AntesNovoRegistroitm;

    // Mostra para o usuario
    obj.ShowModal;
  finally
   // if obj.ModalResult = mrok then
      begin
        // Executa depois de novo o registro
        DepoisNovoRegistroitm;

        PesquisaItens(DatasetCadastro.FieldByName(Kernel_Cadastro.str_CampoChave).value);

        // Volta o foco para o registro alterado depois de atualizar os dados
        dsBaseItm.DataSet.Locate(Kernel_Cadastro.str_ItemCampoChave, DatasetCadastro.FieldByName(Kernel_Cadastro.str_CampoChave).value,[]);
      end;

    // Libera Instancia da memoria
    FreeAndNil(obj);
  end;
end;

procedure TfrmKernel_CadMovBase.PesquisaItens(int_codchave: integer);
begin
  inherited;
  {Pesquisa os itens da movimentação passada como parametro}
  with DatasetListagemItem do
  begin
    close;
    Params[0].Value := int_codchave;
    open;
  end;
end;

procedure TfrmKernel_CadMovBase.ValidaItem;
begin
  
end;

end.
