{
  Primeiro campo Tabstop = 1
  Ultimo campo Tabstop = 2
}

unit UfrmKernel_CadBase;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  UfrmKernel_Base,
  JvExControls,
  JvComponent,
  JvXPCore,
  JvXPButtons,
  ExtCtrls,
  ComCtrls,
  DB,
  DBClient,
  ImgList,
  StdCtrls,
  Grids,
  DBGrids,
  Mask,
  JvExMask,
  JvToolEdit,
  JvMaskEdit,
  JvCheckedMaskEdit,
  JvDatePickerEdit,
  JvDBDatePickerEdit,
  JvExComCtrls,
  JvDateTimePicker,
  JvDBDateTimePicker,
  SqlExpr,
  Provider,
  ActnList,
  RzPanel,
  RzButton,
  Buttons,
  dxGDIPlusClasses,
  JvExDBGrids,
  UKernel_Exception,
  JvDBGrid,
  DBCtrls, RzTabs, RzStatus, cxGraphics, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxSkinscxPCPainter, cxPC, Menus,
  cxLookAndFeelPainters, cxButtons, cxGrid;

type
  TfrmKernel_CadBase = class(TfrmKernel_Base)
    imglPageBase: TImageList;
    ilCadBase: TImageList;
    actlstCadBase: TActionList;
    actNovo: TAction;
    actAlterar: TAction;
    actSalvar: TAction;
    actFechar: TAction;
    actAbrir: TAction;
    actImprimir: TAction;
    dsBase: TDataSource;
    pgcntrlcadastro: TcxPageControl;
    tbshtDados: TcxTabSheet;
    pnlIdentificacao: TRzPanel;
    lblAtalhoF5: TLabel;
    PnlTitulo: TRzPanel;
    imgCadBase: TImage;
    Label11: TLabel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    DBlcbCadastros: TcxDBLookupComboBox;
    actCancelar: TAction;
    actlstCadBaseUser: TActionList;
    ilCadBaseUser: TImageList;
    RzToolbar1: TRzToolbar;
    btnNovo: TRzToolButton;
    btnAlterar: TRzToolButton;
    btnImprimir: TRzToolButton;
    RzStatusBar1: TRzStatusBar;
    RzPanel1: TRzPanel;
    btnCancelarK: TJvXPButton;
    btnFecharK: TJvXPButton;
    RzSpacer1: TRzSpacer;
    btnSalvarK: TJvXPButton;
    lblCamposObrigatorio: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actNovoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBlcbCadastrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actCancelarExecute(Sender: TObject);
  private
    FTableDisplayName: string;
    FKeyField: string;
    FCurHeight: Integer;
    FCurWidth: Integer;
    FMaxHeight: Integer;
    //sdsMetaData: TSimpleDataSet;
    // Variaveis Usadas para controle de permissao
    bol_actAlterar, bol_actnovo, bol_actapagar, bol_salvou: Boolean;
    procedure AbriCadAuxiliar(codtela: Integer); virtual;
  public
    procedure EnableDisableControls(Value: Boolean); virtual;
    function FieldsWrithe(DtSrc: TDataSource): Boolean; virtual;

    procedure PermissoesForm; virtual;
    procedure Restricoes; virtual;

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

    {Executa antes de executar o Salvar registro}
    procedure AntesSalvarRegistro; virtual;
    {Execura o metodo Salvar Registro}
    procedure SalvarRegistro; virtual;
    {Executa Todo o processo de antes Salvar depois}
    procedure Executa_SalvarRegistro; virtual;
    {Executa Depois de executar o Salvar registro}
    procedure DepoisSalvarRegistro; virtual;

    {Executa antes de executar o Fechar}
    procedure AntesFechar; virtual;
    {Execura o metodo Fechar}
    procedure Fechar; virtual;
    {Executa Todo o processo de antes Cancelar depois}
    procedure Executa_Fechar; virtual;
    {Executa Depois de executar o Fechar}
    procedure DepoisFechar; virtual;

    {Executa antes de executar o Imprimir registro}
    procedure AntesImprimirRegistro; virtual;
    {Execura o metodo Imprimir Registro}
    procedure ImprimirRegistro; virtual;
    {Executa Todo o processo de antes Imprimir depois}
    procedure Executa_ImprimirRegistro; virtual;
    {Executa Depois de executar o Imprimir registro}
    procedure DepoisImprimirRegistro; virtual;

    {Executa antes de executar o Cancelarregistro}
    procedure AntesCancelarRegistro; virtual;
    {Execura o metodo Cancelar Registro}
    procedure CancelarRegistro; virtual;
    {Executa Todo o processo de antes Cancelar depois}
    procedure Executa_CancelarRegistro; virtual;
    {Executa Depois de executar o Cancelar registro}
    procedure DepoisCancelarRegistro; virtual;

    {Valida os campos obrigatorios da tela}
    function ValidaCampos(): Boolean; virtual;
    {Joga o foco no primeiro controle da tela}
    procedure primeiroControle;
    {Verifica se o TWincontrol atual e o ultimo da tela}
    function UltimoControle: Boolean;
    {Define qual sao os Primeiro e Ultimos TWincontrol da tela }
    procedure DefineControle(Primeiro, Ultimo: TWinControl); virtual;

    procedure HabilitaBotoes;
  end;

var
  frmKernel_CadBase: TfrmKernel_CadBase;

implementation

uses
  UKernel_Mensagem,
  UKernel_SysUtils,
  UdmPrincipal,
  UfrmKernel_Mensagem,
  UKernel_DB,
  UKernel_VariaveisPublic,
  uKernel_Sistema,
  UdmKernel_Acesso,
  UdmKernel_CadBase;

{$R *.dfm}

{ TfrmCadBase }

procedure TfrmKernel_CadBase.EnableDisableControls(Value: Boolean);
var
  i: integer;
begin
  {: faz um laço em todos os componentes}
  for i := 0 to ComponentCount - 1 do
    begin
      if (Components[i] is TCustomEdit) then
        (Components[i] as TCustomEdit).Enabled := Value;
      {if (Components[i] is TJvXPButton) then
        (Components[i] as TJvXPButton).Enabled := Value;}
      if (Components[i] is TDBRadioGroup) then
        (Components[i] as TDBRadioGroup).Enabled := Value;
      if (Components[i] is TDBLookupComboBox) then
        (Components[i] as TDBLookupComboBox).Enabled := Value;
      if (Components[i] is Tdbgrid) then
        (Components[i] as TDBgrid).Enabled := Value;
      if (Components[i] is TJvDBGrid) then
        (Components[i] as TJvDBGrid).Enabled := Value;
      if (Components[i] is TComboBox) then
        (Components[i] as TComboBox).Enabled := Value;
      if (Components[i] is TJvDBDateTimePicker) then
        (Components[i] as TJvDBDateTimePicker).Enabled := Value;
      if (Components[i] is TcxDBLookupComboBox) then
        (Components[i] as TcxDBLookupComboBox).Enabled := Value;
      if (Components[i] is TDBMemo) then
        (Components[i] as TDBMemo).Enabled := Value;
      if (Components[i] is TcxGrid) then
        (Components[i] as TcxGrid).Enabled := Value;
      if (Components[i] is TcxButton) then
        (Components[i] as TcxButton).Enabled := Value;
    end;
  //actNovo.Enabled := True;
end;

procedure TfrmKernel_CadBase.Fechar;
begin
  // Fecha com Resultado de Ok
  if bol_salvou then
    ModalResult := mrOk
  else
    close;
end;

function TfrmKernel_CadBase.FieldsWrithe(DtSrc: TDataSource): Boolean;
var
  i: integer;
  {: verifica quais os campos que estão em branco no cadastro}
begin
  inherited;
  Result := True; {: assume que estão todos preenchidos}
  for i := 0 to DtSrc.DataSet.FieldCount - 1 do
    if DtSrc.DataSet.Fields[i].Required then
      if (DtSrc.DataSet.Fields[i].IsNull) or
        (Trim(DtSrc.DataSet.Fields[i].AsString) = '') then
        begin
          //MessageDlg('Preencha o campo " '+ DtSrc.DataSet.Fields[i].DisplayLabel + '"', mtWarning,[mbOk], 0);
          Result := False;
          DtSrc.DataSet.Fields[i].FocusControl; {: coloca o foco no controle}
          Break;
        end;
end;

procedure TfrmKernel_CadBase.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if not btnSalvarK.Enabled then
    ModalResult := mrOk;
end;

procedure TfrmKernel_CadBase.FormCreate(Sender: TObject);
begin
  kernel_str_form := 'Cadastro de ' + kernel_srt_nmformbase;
  inherited;
  // Adicionar nome da tela no Label
  lblTitulo.caption := kernel_str_form;
end;

procedure TfrmKernel_CadBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F2: Executa_AlterarRegistro;
    VK_INSERT: Executa_NovoRegistro;
    Vk_F7: Executa_SalvarRegistro;
    Vk_F8:   Executa_SalvarRegistro;
    Vk_F3: Executa_AlterarRegistro;
    Vk_F12: Executa_Fechar;
  end;
end;

procedure TfrmKernel_CadBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // Se a Tecla Pressionada for Enter
{ if Key = #13 then
    begin
      // Invalida a Tecla
      key := #0;
      // se for o ultimo controle
      if UltimoControle then
        begin
          actSalvar.Execute;
        end
      else
        begin
          // Avança para o Próximo Controle
          Perform(WM_NEXTDLGCTL, 0, 0);
        end;
    end;    }
end;

procedure TfrmKernel_CadBase.FormShow(Sender: TObject);
begin
  inherited;
  // Verifica permissao do usuario na tela
  // PermissoesForm;

  // Seta Primeira opcao pro comobox de Telas
  DBlcbCadastros.ItemIndex := 0;

  {Joga o foco na primeira pagina do pagecontrol}
  pgcntrlcadastro.ActivePageIndex := 0;

  // Desabilita botoes/actions de acoes
  actNovo.Enabled := False;
  actAlterar.Enabled := False;

  // Joga o foco no primeiro registro
  primeiroControle;

  bol_salvou := False;
end;

procedure TfrmKernel_CadBase.HabilitaBotoes;
begin
  actNovo.Enabled := not actNovo.Enabled;
  actAlterar.Enabled := not actAlterar.Enabled;
  actCancelar.Enabled := not actCancelar.Enabled;
  actSalvar.Enabled := not actSalvar.Enabled;

  // So deixar o botão imprimir habilitado quando for edição ou inserção
  actImprimir.Enabled:= dsbase.DataSet.state in [dsEdit, dsinsert];
end;

procedure TfrmKernel_CadBase.ImprimirRegistro;
begin
  // aqui sera codificado no filhos
end;

procedure TfrmKernel_CadBase.NovoRegistro;
begin
  if actFechar.Enabled then
   Exit;
end;

procedure TfrmKernel_CadBase.PermissoesForm;
begin
  // Se não for administrador verifica permissões
  if not (Kernel_Login.str_adminusu = 'T') then
    begin
      // permissoes por perfil
      with dmKernel_Acesso, cdsDireitoAcesso do
      begin
        Close;
        Params.ParamByName('CODUSU').value := Kernel_Login.int_codusu;
        Params.ParamByName('CODMENU').value := kernel_CodMenu;
        Open;

        // Habilita Botoes de Controle Conforme Permisao
        bol_actAlterar := FieldByName('actalterar').AsString = 'T';
        actAlterar.Visible := bol_actAlterar;

        bol_actnovo := FieldByName('actNOVO').AsString = 'T';
        actNovo.Visible := bol_actnovo;
      end;

      // permissoes por usario
      with dmKernel_Acesso, cdsDireitoAcessoUsuario do
      begin
        Close;
        Params.ParamByName('CODUSU').value := Kernel_Login.int_codusu;
        Params.ParamByName('CODMENU').value := kernel_CodMenu;
        Open;

        if not IsEmpty then
          begin
            // Habilita Botoes de Controle Conforme Permisao
            bol_actAlterar := FieldByName('actalterar').AsString = 'T';
            actalterar.Visible := bol_actAlterar;

            bol_actnovo := FieldByName('actNOVO').AsString = 'T';
            actNovo.Visible := bol_actnovo;
          end;
      end;
    end;
end;

procedure TfrmKernel_CadBase.primeiroControle;
var
  i: Integer;
begin
  for i := 0 to pnlIdentificacao.ControlCount - 1 do
  begin
    if pnlIdentificacao.Controls[i] is TWinControl then
      begin
        if TWinControl(pnlIdentificacao.Controls[i]).TabStop = true then
          if TWinControl(pnlIdentificacao.Controls[i]).enabled = true then
            begin
              ActiveControl := (pnlIdentificacao.Controls[i] as TWinControl);
              Break;
            end;
      end;
  end;
end;

procedure TfrmKernel_CadBase.Restricoes;
begin
  // aqui sera codificado no filhos
end;

procedure TfrmKernel_CadBase.SalvarRegistro;
begin
  // Habilita somente os contoles necessarios

end;

function TfrmKernel_CadBase.UltimoControle: Boolean;
var
  i: Integer;
begin
  result := False;

  for i := 0 to pnlIdentificacao.ControlCount - 1 do
  begin
    if pnlIdentificacao.Controls[i] is TWinControl then
      begin
        if TWinControl(pnlIdentificacao.Controls[i]).Tag = 2 then
          begin
            if TWinControl(pnlIdentificacao.Controls[i]).Focused then
              Result := True;
            Break;
          end;
      end;
  end;
end;

function  TfrmKernel_CadBase.ValidaCampos(): Boolean;
begin
  // aqui sera codificado no filhos
end;

procedure TfrmKernel_CadBase.Executa_AlterarRegistro;
begin
  AntesAlterarRegistro;
  AlterarRegistro;
  DepoisAlterarRegistro;
end;


procedure TfrmKernel_CadBase.Executa_CancelarRegistro;
begin
  AntesCancelarRegistro;
  CancelarRegistro;
  DepoisCancelarRegistro;
end;

procedure TfrmKernel_CadBase.Executa_Fechar;
begin
  AntesFechar;
  Fechar;
  DepoisFechar;
end;

procedure TfrmKernel_CadBase.Executa_ImprimirRegistro;
begin
  AntesImprimirRegistro;
  ImprimirRegistro;
  DepoisImprimirRegistro;
end;

procedure TfrmKernel_CadBase.Executa_NovoRegistro;
begin
  AntesNovoRegistro;
  NovoRegistro;
  DepoisNovoRegistro;
end;

procedure TfrmKernel_CadBase.Executa_SalvarRegistro;
begin
  antesSalvarRegistro;
  SalvarRegistro;
  DepoisSalvarRegistro;
end;

procedure TfrmKernel_CadBase.AbriCadAuxiliar(codtela: Integer);
begin
  //Sera codificada no filho
end;

procedure TfrmKernel_CadBase.actAlterarExecute(Sender: TObject);
begin
  inherited;
  Executa_AlterarRegistro;
end;

procedure TfrmKernel_CadBase.actCancelarExecute(Sender: TObject);
begin
  inherited;
  Executa_CancelarRegistro;
end;

procedure TfrmKernel_CadBase.actFecharExecute(Sender: TObject);
begin
  inherited;
  Executa_Fechar;
end;

procedure TfrmKernel_CadBase.actImprimirExecute(Sender: TObject);
begin
  inherited;
  Executa_ImprimirRegistro;
end;

procedure TfrmKernel_CadBase.actNovoExecute(Sender: TObject);
begin
  inherited;
  Executa_NovoRegistro;
end;

procedure TfrmKernel_CadBase.actSalvarExecute(Sender: TObject);
begin
  inherited;
  Executa_SalvarRegistro;
end;

procedure TfrmKernel_CadBase.AlterarRegistro;
begin
  // Habilita todos os controles
  //EnableDisableControls(True);
end;

procedure TfrmKernel_CadBase.AntesAlterarRegistro;
begin
  // aqui sera codificado no filhos
end;

procedure TfrmKernel_CadBase.AntesCancelarRegistro;
begin
  // aqui sera codificado no filhos
end;

procedure TfrmKernel_CadBase.AntesFechar;
begin
  // aqui sera codificado no filhos
end;

procedure TfrmKernel_CadBase.AntesImprimirRegistro;
begin
  {Se nao tiver registro nao deixa imprimir}
  if DatasetCadastro.IsEmpty then
    Exit;
end;

procedure TfrmKernel_CadBase.AntesNovoRegistro;
begin
  // aqui sera codificado no filhos
end;

procedure TfrmKernel_CadBase.AntesSalvarRegistro;
begin
  {Valida se os campos obrigatorios estao todos preechidos}
  ValidaCampos;
end;

procedure TfrmKernel_CadBase.CancelarRegistro;
begin

end;

procedure TfrmKernel_CadBase.DBlcbCadastrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_return then
    // afz alguma coisa decidir depois
end;

procedure TfrmKernel_CadBase.DefineControle(Primeiro, Ultimo: TWinControl);
begin
  Primeiro.Tag := 1;
  Ultimo.Tag := 2;
end;

procedure TfrmKernel_CadBase.DepoisAlterarRegistro;
begin
  primeiroControle;
  HabilitaBotoes;
  EnableDisableControls(true);  
end;

procedure TfrmKernel_CadBase.DepoisCancelarRegistro;
begin
  EnableDisableControls(False);
  HabilitaBotoes;
  // aqui sera codificado no filhos
end;

procedure TfrmKernel_CadBase.DepoisFechar;
begin
  // aqui sera codificado no filhos
end;

procedure TfrmKernel_CadBase.DepoisImprimirRegistro;
begin
  HabilitaBotoes;
  // aqui sera codificado no filhos
end;

procedure TfrmKernel_CadBase.DepoisNovoRegistro;
begin
  primeiroControle;
  HabilitaBotoes;
  EnableDisableControls(true);
end;

procedure TfrmKernel_CadBase.DepoisSalvarRegistro;
begin
  EnableDisableControls(False);
  HabilitaBotoes;
  // aqui sera codificado no filhos

  bol_salvou := True;

  {Quando salvar foca o foco no botao, pq se o usuario quiser sair e so dar
  mais um ENTER }
  btnFecharK.setfocus; 
end;

end.

