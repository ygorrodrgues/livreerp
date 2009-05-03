program LivreFrameGUI;

uses
  Forms,
  UKernel_Mensagem in '..\Template\UKernel_Mensagem.pas',
  UKernel_Mensagem_Usuario in '..\Template\UKernel_Mensagem_Usuario.pas',
  UclKernel_Cadastro in '..\Template\UclKernel_Cadastro.pas',
  UclKernel_Conexao in '..\Template\UclKernel_Conexao.pas',
  UclKernel_Login in '..\Template\UclKernel_Login.pas',
  UclKernel_PropriedadesProjeto in '..\Template\UclKernel_PropriedadesProjeto.pas',
  UdmKernel_Base in '..\Template\UdmKernel_Base.pas' {dmKernel_Base: TDataModule},
  UdmKernel_CadBase in '..\Template\UdmKernel_CadBase.pas' {dmKernel_CadBase: TDataModule},
  UdmKernelPrincipal in '..\Template\UdmKernelPrincipal.pas' {dmKernelPrincipal: TDataModule},
  UfrmKernel_Aguarde in '..\Template\UfrmKernel_Aguarde.pas' {frmKernel_Aguarde},
  UfrmKernel_Base in '..\Template\UfrmKernel_Base.pas' {frmKernel_Base},
  UfrmKernel_CadBase in '..\Template\UfrmKernel_CadBase.pas' {frmKernel_CadBase},
  UfrmKernel_CadBaseDB in '..\Template\UfrmKernel_CadBaseDB.pas' {frmKernel_CadBaseDB},
  UFrmKernel_Exclusao in '..\Template\UFrmKernel_Exclusao.pas' {FrmKernel_Exclusao},
  UfrmKernel_Login in '..\Template\UfrmKernel_Login.pas' {frmKernel_Login},
  UfrmKernel_LstBase in '..\Template\UfrmKernel_LstBase.pas' {frmKernel_LstBase},
  UfrmKernel_Mensagem in '..\Template\UfrmKernel_Mensagem.pas' {frmKernel_Mensagem},
  UfrmKernel_Parametro in '..\Template\UfrmKernel_Parametro.pas' {frmKernel_Parametro},
  UfrmKernel_Principal in '..\Template\UfrmKernel_Principal.pas' {frmKernel_Principal},
  UfrmKernel_RegistroLicenca in '..\Template\UfrmKernel_RegistroLicenca.pas' {frmKernel_RegistroLicenca},
  UfrmKernel_Sobre in '..\Template\UfrmKernel_Sobre.pas' {frmKernel_Sobre},
  UfrmKernel_Splash in '..\Template\UfrmKernel_Splash.pas' {frmKernel_Splash},
  UKernel_Mouse in '..\Template\UKernel_Mouse.pas',
  UKernel_Registry in '..\Template\UKernel_Registry.pas',
  UKernel_Security in '..\Template\UKernel_Security.pas',
  uKernel_Sistema in '..\Template\uKernel_Sistema.pas',
  UKernel_String in '..\Template\UKernel_String.pas',
  UKernel_SysUtils in '..\Template\UKernel_SysUtils.pas',
  UKernel_VariaveisPublic in '..\Template\UKernel_VariaveisPublic.pas',
  UKernel_DATA in '..\Template\UKernel_DATA.pas',
  UKernel_DB in '..\Template\UKernel_DB.pas',
  UKernel_Exception in '..\Template\UKernel_Exception.pas',
  UKernel_Grid in '..\Template\UKernel_Grid.pas',
  UKernel_Internet in '..\Template\UKernel_Internet.pas',
  csDXFunctions in '..\Template\csDXFunctions.pas',
  UdmKernel_Acesso in '..\Template\UdmKernel_Acesso.pas' {dmKernel_Acesso: TDataModule},
  UdmPrincipal in 'UdmPrincipal.pas' {dmPrincipal: TDataModule},
  UfrmLogin in 'UfrmLogin.pas' {frmLogin},
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UKernel_AcessoSistema in '..\Template\UKernel_AcessoSistema.pas',
  UfrmNovoProjeto in 'UfrmNovoProjeto.pas' {frmNovoProjeto},
  VariaveisFramework in 'VariaveisFramework.pas',
  UfrmConfiguracoesProjeto in 'UfrmConfiguracoesProjeto.pas' {frmConfiguracoesProjeto},
  untKernel_Interface_RegrasBD in '..\Template\untKernel_Interface_RegrasBD.pas',
  Uclkernel_Config in '..\Template\Uclkernel_Config.pas',
  UntKernel_Classe_SQLServer in '..\Template\UntKernel_Classe_SQLServer.pas',
  UntKernel_Classe_Firebird in '..\Template\UntKernel_Classe_Firebird.pas',
  udmParametro in 'udmParametro.pas' {dmParametro: TDataModule},
  UfrmCadParametro in 'UfrmCadParametro.pas' {frmCadParametro},
  UclConfiguracoes_Framework in 'UclConfiguracoes_Framework.pas',
  UdmProjeto in 'UdmProjeto.pas' {dmProjeto: TDataModule},
  UclKernel_Terminal in '..\Template\UclKernel_Terminal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Kernel_InicializaVariaveis;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
