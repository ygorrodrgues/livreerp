unit UfrmNovoProjeto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Base, StdCtrls, jpeg, ExtCtrls, FileCtrl, Db, dblookup,
  ImgList, ActnList, JvExControls, JvXPCore, JvXPButtons, DBCtrls;

type
  TfrmNovoProjeto = class(TfrmKernel_Base)
    LbFolderName: TLabel;
    LbFolderProject: TLabel;
    PnTitle: TPanel;
    LbTitle1: TLabel;
    LbTitle2: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    EdProject: TEdit;
    EdFolderProjects: TEdit;
    BtnBrowse1: TButton;
    GroupTemplate: TGroupBox;
    LbFolder: TLabel;
    ChFolderDefault: TCheckBox;
    EdFolderTemplate: TEdit;
    BtnBrowse2: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    actlstNovoProjeto: TActionList;
    ilNovoProjeto: TImageList;
    actGerarProjeto: TAction;
    actCancelar: TAction;
    btnGerarProjeto: TJvXPButton;
    JvXPButton2: TJvXPButton;
    dblkcbbDESC_TIPO_BANCO: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnBrowse1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChFolderDefaultClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actGerarProjetoExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  private
    str_NameProject : string;
    ProjectOk: Boolean;
  public
    procedure HabilitaPastaTemplate;
    procedure ConnectXML;
    procedure DisconnectXML;
    function CodeGenerator: Boolean;
    procedure GravaCaminhos;
    procedure LerCaminhos;
  end;

var
  frmNovoProjeto: TfrmNovoProjeto;

implementation

uses UKernel_VariaveisPublic, UKernel_SysUtils, VariaveisFramework, UdmProjeto,
  UdmPrincipal, udmParametro, UKernel_DB, UKernel_Exception, UKernel_Mensagem;

{$R *.dfm}

procedure TfrmNovoProjeto.actCancelarExecute(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmNovoProjeto.actGerarProjetoExecute(Sender: TObject);
begin
  inherited;
  if EdProject.Text = '' then
  Begin
    EdProject.SetFocus;
    raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '  %s  ',['( Nome do Projeto (Pasta) )']);
  End;

  if EdFolderProjects.Text = '' then
    Begin
      EdFolderProjects.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '  %s  ',['( Pasta de Projetos )']);
    End;

  if EdFolderTemplate.Text = '' then
    Begin
      EdFolderTemplate.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '  %s  ',['( Pasta Template )']);
    End;

  if dblkcbbDESC_TIPO_BANCO.Text = '' then
    Begin
      dblkcbbDESC_TIPO_BANCO.SetFocus;
      raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_CampoObrigatorio + '  %s  ',['( Banco de Dados (suportados) )']);
    End;

  {Verifica se a pasta do novo projeto existe}
  if not DirectoryExists(EdFolderProjects.Text) then
    begin
      MessageDlg('Pasta do Projeto não existe', mtWarning, [mbOk], 0);
      EdFolderProjects.SelectAll;
      EdFolderProjects.SetFocus;
      exit;
    end;

  {Verifica se a pasta do template do novo projeto existe}  
  if not DirectoryExists(EdFolderTemplate.Text) then
    begin
      MessageDlg('Pasta Template não encontrada', mtWarning, [mbOk], 0);
      ChFolderDefault.Checked := False;
      EdFolderTemplate.SelectAll;
      EdFolderTemplate.SetFocus;
      exit;
    end;

  // Recebe o nome do Projeto a ser criado
  //str_NameProject := Kernel_DiretorioBarras(EdFolderProjects.Text) + EdProject.Text + '\Source\' + EdProject.Text + csExtProject;
  str_NameProject := trim(EdProject.Text);

  // Verifica se o projeto ja nao existe
  if (kernel_ExisteRelacionamento('PROJETO','NOME_PROJETO','','',QuotedStr(str_NameProject))) then
  begin
    {se existir nao deixa criar novamente}
    MessageDlg('Projeto já existe na pasta Projetos', mtWarning, [mbOk], 0);
    EdProject.SelectAll;
    EdProject.SetFocus;
    exit;
  end;

  {Se nao existir cria o novo projeto}
  try
    // Copia os arquivos padroes/template de todo projeto
    ForceDirectories(Kernel_DiretorioBarras(EdFolderProjects.Text) + EdProject.Text);
    // Pasta onde fica os fontes do projeto
    ForceDirectories(Kernel_DiretorioBarras(EdFolderProjects.Text) + EdProject.Text+'\Source');
    // Pasta onde fica o executavel e arquivos finais do projeto
    ForceDirectories(Kernel_DiretorioBarras(EdFolderProjects.Text) + EdProject.Text+'\Source\Bin');
    // Pasta onde fica o executavel e arquivos finais do projeto
    ForceDirectories(Kernel_DiretorioBarras(EdFolderProjects.Text) + EdProject.Text+'\Source\dcu');    
    // Pasta onde fica as imagens do projeto
    ForceDirectories(Kernel_DiretorioBarras(EdFolderProjects.Text) + EdProject.Text+'\Source\Imagens');
    // Pasta onde fica toda a documentação do Projeto
    ForceDirectories(Kernel_DiretorioBarras(EdFolderProjects.Text) + EdProject.Text+'\Source\Documentação');

    // Cria o projeto na tabela PROJETO
    ConnectXML;
    
    // Cria/Gera o dpr do novo projeto
    if CodeGenerator then
    begin
      // Depiois de Gerar o drp grava caminho de diretorios no regstro
      GravaCaminhos;

      // Terminar de copiar os arquivos necessarios
      case dblkcbbDESC_TIPO_BANCO.keyvalue of
        1 : CopyFileMask(Kernel_DiretorioBarras(EdFolderTemplate.Text)+'Modulos\Bin', Kernel_DiretorioBarras(EdFolderProjects.Text) + EdProject.Text+'\Source\Bin\DB_MSSQL ','*.*');
        2: CopyFileMask(Kernel_DiretorioBarras(EdFolderTemplate.Text)+'Modulos\Bin', Kernel_DiretorioBarras(EdFolderProjects.Text) + EdProject.Text+'\Source\Bin\DB_FIREBIRD','*.*');
      end;

      Close;
    end;
  except
    on Error: Exception do
    begin
      MessageDlg('Erro' + Error.Message, mtError, [mbOk], 0);
    end;
  end;
end;

procedure TfrmNovoProjeto.BtnBrowse1Click(Sender: TObject);
var
  S: String;
begin
  inherited;
  {Recebe diretorio atual}
  S := EdFolderProjects.Text;
  {Se selecionou uma pasta}
  if S <> '' then
  begin
    {recebe nova pasta}
    EdFolderProjects.Text := S;
    EdFolderProjects.SelectAll;
    EdFolderProjects.SetFocus;
  end;
end;

procedure TfrmNovoProjeto.ChFolderDefaultClick(Sender: TObject);
begin
  inherited;
  HabilitaPastaTemplate;
end;

function TfrmNovoProjeto.CodeGenerator: Boolean;
var
  List: TStringList;
begin
  {Cria todos os arquivos do diretorio template para o diretorio do novo projeto. obs: somente os arquivos que podem ser alterados
    no projeto}
  if CopyFileMask(Kernel_DiretorioBarras(EdFolderTemplate.Text)+'Modulos', Kernel_DiretorioBarras(EdFolderProjects.Text) + EdProject.Text+'\Source', '*.*') then
  begin
    CodeGenerator := True; // indica que o codigo foi gerado com sucesso
    try
      // Projeto 
      FileProjectDpr := Kernel_DiretorioBarras(Kernel_DiretorioBarras(EdFolderProjects.Text) + EdProject.Text) +'Source\'+ EdProject.Text + '.dpr';
      List := TStringList.Create;
      List.Add('{');
      List.Add(' Empresa....: ');
      List.Add(' Programa...: '+ EdProject.Text);
      List.Add(' Sistema....: ');
      List.Add(' Data.......: '+ DateToStr(Date));
      List.Add(' Versão.....: ');
      List.Add(' Analista...: ');
      List.Add(' Programador: ');
      List.Add(' Criação....: LivreFrameGUI - Versão:' + str_Version + ' - Release: ' + str_release);
      List.Add(' NºLicença..: ');
      List.Add('}');
      List.Add('');
      List.Add('program '+EdProject.Text+';');
      List.Add('');      
      List.Add('uses');
      List.Add('  Forms,');
      List.Add('  Controls,');
      List.Add('  SysUtils,');
      List.Add('  ActiveX,');      
      List.Add('  csDXFunctions in '+ #39 + '..\..\..\Template\csDXFunctions.pas'+ #39 + ',');
      List.Add('  UclKernel_Cadastro in '+ #39 + '..\..\..\Template\UclKernel_Cadastro.pas'+ #39 + ',');
      List.Add('  UclKernel_Conexao in '+ #39 + '..\..\..\Template\UclKernel_Conexao.pas'+ #39 + ',');
      List.Add('  UclKernel_Login in '+ #39 + '..\..\..\Template\UclKernel_Login.pas'+ #39 + ',');
      List.Add('  UKernel_AcessoSistema in '+ #39 + '..\..\..\Template\UKernel_AcessoSistema.pas'+ #39 + ',');
      List.Add('  Uclkernel_Config in '+ #39 + '..\..\..\Template\Uclkernel_Config.pas'+ #39 + ',');
      List.Add('  UKernel_DATA in '+ #39 + '..\..\..\Template\UKernel_DATA.pas'+ #39 + ',');
      List.Add('  UKernel_DB in '+ #39 + '..\..\..\Template\UKernel_DB.pas'+ #39 + ',');
      List.Add('  UKernel_Exception in '+ #39 + '..\..\..\Template\UKernel_Exception.pas'+ #39 + ',');
      List.Add('  UKernel_Grid in '+ #39 + '..\..\..\Template\UKernel_Grid.pas'+ #39 + ',');
      List.Add('  UKernel_Internet in '+ #39 + '..\..\..\Template\UKernel_Internet.pas'+ #39 + ',');
      List.Add('  UKernel_Mensagem in '+ #39 + '..\..\..\Template\UKernel_Mensagem.pas'+ #39 + ',');
      List.Add('  UKernel_Mensagem_Usuario in '+ #39 + '..\..\..\Template\UKernel_Mensagem_Usuario.pas'+ #39 + ',');
      List.Add('  UKernel_Mouse in '+ #39 + '..\..\..\Template\UKernel_Mouse.pas'+ #39 + ',');
      List.Add('  UKernel_Registry in '+ #39 + '..\..\..\Template\UKernel_Registry.pas'+ #39 + ',');
      List.Add('  UKernel_Security in '+ #39 + '..\..\..\Template\UKernel_Security.pas'+ #39 + ',');
      List.Add('  uKernel_Sistema in '+ #39 + '..\..\..\Template\uKernel_Sistema.pas'+ #39 + ',');
      List.Add('  UKernel_String in '+ #39 + '..\..\..\Template\UKernel_String.pas'+ #39 + ',');
      List.Add('  UKernel_SysUtils in '+ #39 + '..\..\..\Template\UKernel_SysUtils.pas'+ #39 + ',');
      List.Add('  UKernel_VariaveisPublic in '+ #39 + '..\..\..\Template\UKernel_VariaveisPublic.pas'+ #39 + ',');
      List.Add('  UfrmKernel_Base in '+ #39 + '..\..\..\Template\UfrmKernel_Base.pas' +#39 + ' {frmKernel_Base},');
      List.Add('  UfrmKernel_Login in '+ #39 + '..\..\..\Template\UfrmKernel_Login.pas'  +#39 + '{frmKernel_Login},');
      List.Add('  UfrmKernel_LstBase in '+ #39 + '..\..\..\Template\UfrmKernel_LstBase.pas'  +#39 + '{frmKernel_LstBase},');
      List.Add('  UfrmKernel_Mensagem in '+ #39 + '..\..\..\Template\UfrmKernel_Mensagem.pas'  +#39 + '{frmKernel_Mensagem},');
      List.Add('  UfrmKernel_Parametro in '+ #39 + '..\..\..\Template\UfrmKernel_Parametro.pas'  +#39 + '{frmKernel_Parametro},');
      List.Add('  UfrmKernel_RegistroLicenca in '+ #39 + '..\..\..\Template\UfrmKernel_RegistroLicenca.pas'  +#39 + '{frmKernel_RegistroLicenca},');
      List.Add('  UfrmKernel_Sobre in '+ #39 + '..\..\..\Template\UfrmKernel_Sobre.pas'  +#39 + '{frmKernel_Sobre},');
      List.Add('  UfrmKernel_Splash in '+ #39 + '..\..\..\Template\UfrmKernel_Splash.pas'  +#39 + '{frmKernel_Splash},');
      List.Add('  UfrmLogin in '+ #39 + 'UfrmLogin.pas'  +#39 + '{frmLogin},');
      List.Add('  UdmKernel_Base in '+ #39 + '..\..\..\Template\UdmKernel_Base.pas'  +#39 + '{dmKernel_Base: TDataModule},');
      List.Add('  UdmKernel_Acesso in '+ #39 + '..\..\..\Template\UdmKernel_Acesso.pas'  +#39 + '{dmKernel_Acesso: TDataModule},');
      List.Add('  UdmKernel_CadBase in '+ #39 + '..\..\..\Template\UdmKernel_CadBase.pas'  +#39 + '{dmKernel_CadBase: TDataModule},');
      List.Add('  UdmKernel_CadMovBase in '+ #39 + '..\..\..\Template\UdmKernel_CadMovBase.pas'  +#39 + '{dmKernel_CadMovBase: TDataModule},');
      List.Add('  UdmKernelPrincipal in '+ #39 + '..\..\..\Template\UdmKernelPrincipal.pas'  +#39 + '{dmKernelPrincipal: TDataModule},');
      List.Add('  UdmPrincipal in '+ #39 + 'UdmPrincipal.pas'  +#39 + '{dmPrincipal: TDataModule},');
      List.Add('  UfrmKernel_Aguarde in '+ #39 + '..\..\..\Template\UfrmKernel_Aguarde.pas'  +#39 + '{frmKernel_Aguarde},');
      List.Add('  UfrmKernel_CadBase in '+ #39 + '..\..\..\Template\UfrmKernel_CadBase.pas'  +#39 + '{frmKernel_CadBase},');
      List.Add('  UfrmKernel_CadBaseDB in '+ #39 + '..\..\..\Template\UfrmKernel_CadBaseDB.pas'  +#39 + '{frmKernel_CadBaseDB},');
      List.Add('  UfrmKernel_CadItemBase in '+ #39 + '..\..\..\Template\UfrmKernel_CadItemBase.pas'  +#39 + '{frmKernel_CadItemBase},');
      List.Add('  UfrmKernel_CadMovBase in '+ #39 + '..\..\..\Template\UfrmKernel_CadMovBase.pas'  +#39 + '{frmKernel_CadMovBase},');
      List.Add('  UFrmKernel_Exclusao in '+ #39 + '..\..\..\Template\UFrmKernel_Exclusao.pas'  +#39 + '{FrmKernel_Exclusao},');
      List.Add('  UfrmKernel_Filtro in '+ #39 + '..\..\..\Template\UfrmKernel_Filtro.pas'  +#39 + '{frmKernel_Filtro},');
      List.Add('  UclKernel_PropriedadesProjeto in '+ #39 + '..\..\..\Template\UclKernel_PropriedadesProjeto.pas'+ #39 + ',');
      List.Add('  UfrmKernel_Principal in '+ #39 + '..\..\..\Template\UfrmKernel_Principal.pas'  +#39 + '{frmKernel_Principal},');
      List.Add('  UfrmPrincipal in '+ #39 + 'UfrmPrincipal.pas'  +#39 + '{frmPrincipal},');
      List.Add('  untKernel_Interface_RegrasBD in '+ #39 + '..\..\..\Template\untKernel_Interface_RegrasBD.pas'+ #39 + ',');
      List.Add('  Uclkernel_Config in '+ #39 + '..\..\..\Template\Uclkernel_Config.pas'+ #39 + ',');
      List.Add('  UntKernel_Classe_Firebird in '+ #39 + '..\..\..\Template\UntKernel_Classe_Firebird.pas'+ #39 + ',');
      List.Add('  UclKernel_Terminal in '+ #39 + '..\..\..\Template\UclKernel_Terminal.pas'+ #39 + ',');
      List.Add('  UntKernel_Classe_SQLServer in '+ #39 + '..\..\..\Template\UntKernel_Classe_SQLServer.pas'+ #39 + ',');                
      List.Add('  UdmTeste in '+ #39 + '..\..\..\Template\UdmTeste.pas' +#39 + '{dmTeste: TDataModule},');
      List.Add('  UfrmCadTeste in '+ #39 + '..\..\..\Template\UfrmCadTeste.pas' +#39 + '{frmCadTeste},');
      List.Add('  UfrmLstTeste in '+ #39 + '..\..\..\Template\UfrmLstTeste.pas' +#39 + '{frmLstTeste};');

      List.Add('');
      List.Add('');
      List.Add('begin');
      List.Add('  Application.Initialize; ');
      List.Add('  Application.MainFormOnTaskbar := True; ');
      List.Add('');
      List.Add('  {Cria o datamodule principal na memoria}');
      List.Add('  Application.CreateForm(TdmPrincipal, dmPrincipal);');
      List.Add('  Application.CreateForm(TdmKernel_Acesso, dmKernel_Acesso);');
      List.Add('  frmlogin := TfrmLogin.Create(nil);');
      List.Add('');      
      List.Add('  {Inicializa váriaveis importantes para o funcionamento do sistema}');
      List.Add('  Kernel_InicializaVariaveis;');
      List.Add('');
      List.Add('  if frmlogin.showmodal=mrok then ');
      List.Add('    begin ');
      List.Add('      {Carega propriedades do Projeto} ');
      List.Add('      Kernel_CaregaPropriedades; ');

      List.Add('      {Cria Formulario Principal na memoria} ');
      List.Add('      Application.CreateForm(TfrmPrincipal, frmPrincipal); ');
      List.Add('');
      List.Add('     {Libera Login depois do usuario logar}');
      List.Add('      FreeAndNil(frmLogin); ');
      List.Add('');
      List.Add('      Application.Run; ');
      List.Add('    end ');
      List.Add('  else ');
      List.Add('   Begin ');
      List.Add('     {Libera Objetos da memoria}');
      List.Add('     FreeAndNil(dmPrincipal); ');
      List.Add('     FreeAndNil(dmKernel_Acesso); ');
      List.Add('');
      List.Add('     application.terminate; ');
      List.Add('   end; ');
      List.Add(''); 
      List.Add('end.');
      
      // Salva o arquivo drp na pasta do Projeto
      List.SaveToFile(FileProjectDpr);
    finally
      // Libera objeto da memoria
      List.Free;
    end;
  end
 else
  begin
    // Erro ao copiar o template
    MessageDlg('Erro ao copiar template', mtError, [mbOk], 0);
    CodeGenerator := False;
  end;
end;

procedure TfrmNovoProjeto.ConnectXML;
begin
  with dmProjeto, cdsCadBase do
  begin
    close;
    Params[0].value := -1;
    open;

    Append;
    FieldByName('ID_PROJETO').Value := Kernel_Incrementa('PROJETO','ID_PROJETO');
    FieldByName('NOME_PROJETO').Value := Trim(EdProject.text);
    FieldByName('DATA_CRIACAO_PROJETO').Value := Kernel_Data_Servidor;
    FieldByName('ID_TIPO_PROJETO').Value := 1;
    FieldByName('ID_TIPO_BANCO').Value := 2;

    Post;
    ApplyUpdates(0);
  end;
end;

procedure TfrmNovoProjeto.DisconnectXML;
begin

end;

procedure TfrmNovoProjeto.FormCreate(Sender: TObject);
begin
  kernel_str_form := 'Novo Projeto';
  inherited;

  // Se nao existir objetos cria instancia na memoria
  if not Assigned(dmParametro) then
    Application.CreateForm(TdmParametro,dmParametro);

  if not Assigned(dmProjeto) then
    Application.CreateForm(TdmProjeto,dmProjeto);
end;

procedure TfrmNovoProjeto.FormDestroy(Sender: TObject);
begin
  inherited;
  // Se existir objetos libera instancia da memoria
  if Assigned(dmParametro) then
    FreeAndNil(dmParametro);
    
  if Assigned(dmProjeto) then
    FreeAndNil(dmProjeto);
end;

procedure TfrmNovoProjeto.FormShow(Sender: TObject);
begin
  inherited;
  ProjectOk := False;
  FileProjectDpr := '';
  str_Version := '1';
  str_Release := '0';

  HabilitaPastaTemplate;

  LerCaminhos;

  // Mostra os bancos suportados
  kernel_RefreshCds(dmProjeto.cdsLstTIPO_BANCO);

  EdProject.setfocus;
end;

procedure TfrmNovoProjeto.GravaCaminhos;
begin
  with dmParametro, cdscadbase do
  begin
    Close;
    Open;

    edit;
    FieldByName('PASTA_PROJETO').Asstring := EdFolderProjects.Text;
    FieldByName('TEMPLATE_PROJETO').Asstring := EdFolderTemplate.Text;
    Post;
  end;  

end;

procedure TfrmNovoProjeto.HabilitaPastaTemplate;
begin
  EdFolderTemplate.Enabled := not ChFolderDefault.Checked;
  BtnBrowse2.Enabled := not ChFolderDefault.Checked;
end;

procedure TfrmNovoProjeto.LerCaminhos;
begin
  with dmParametro, cdscadbase do
  begin
    Close;
    Open;

    EdFolderProjects.Text := FieldByName('PASTA_PROJETO').Asstring  ;
    EdFolderTemplate.Text := FieldByName('TEMPLATE_PROJETO').Asstring  ;
  end;
end;

end.
