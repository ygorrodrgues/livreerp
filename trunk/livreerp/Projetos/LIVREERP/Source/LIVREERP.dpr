{
 Empresa....: 
 Programa...: LIVREERP
 Sistema....: 
 Data.......: 2/5/2009
 Versão.....: 
 Analista...: 
 Programador: 
 Criação....: LivreFrameGUI - Versão:1 - Release: 0
 NºLicença..: 
}

program LIVREERP;

uses
  Forms,
  Controls,
  SysUtils,
  ActiveX,
  csDXFunctions in '..\..\..\Template\csDXFunctions.pas',
  UclKernel_Cadastro in '..\..\..\Template\UclKernel_Cadastro.pas',
  UclKernel_Conexao in '..\..\..\Template\UclKernel_Conexao.pas',
  UclKernel_Login in '..\..\..\Template\UclKernel_Login.pas',
  UKernel_AcessoSistema in '..\..\..\Template\UKernel_AcessoSistema.pas',
  UKernel_DATA in '..\..\..\Template\UKernel_DATA.pas',
  UKernel_DB in '..\..\..\Template\UKernel_DB.pas',
  UKernel_Exception in '..\..\..\Template\UKernel_Exception.pas',
  UKernel_Grid in '..\..\..\Template\UKernel_Grid.pas',
  UKernel_Internet in '..\..\..\Template\UKernel_Internet.pas',
  UKernel_Mensagem in '..\..\..\Template\UKernel_Mensagem.pas',
  UKernel_Mensagem_Usuario in '..\..\..\Template\UKernel_Mensagem_Usuario.pas',
  UKernel_Mouse in '..\..\..\Template\UKernel_Mouse.pas',
  UKernel_Registry in '..\..\..\Template\UKernel_Registry.pas',
  UKernel_Security in '..\..\..\Template\UKernel_Security.pas',
  uKernel_Sistema in '..\..\..\Template\uKernel_Sistema.pas',
  UKernel_String in '..\..\..\Template\UKernel_String.pas',
  UKernel_SysUtils in '..\..\..\Template\UKernel_SysUtils.pas',
  UKernel_VariaveisPublic in '..\..\..\Template\UKernel_VariaveisPublic.pas',
  UfrmKernel_Base in '..\..\..\Template\UfrmKernel_Base.pas' {frmKernel_Base},
  UfrmKernel_Login in '..\..\..\Template\UfrmKernel_Login.pas' {frmKernel_Login},
  UfrmKernel_LstBase in '..\..\..\Template\UfrmKernel_LstBase.pas' {frmKernel_LstBase},
  UfrmKernel_Mensagem in '..\..\..\Template\UfrmKernel_Mensagem.pas' {frmKernel_Mensagem},
  UfrmKernel_Parametro in '..\..\..\Template\UfrmKernel_Parametro.pas' {frmKernel_Parametro},
  UfrmKernel_RegistroLicenca in '..\..\..\Template\UfrmKernel_RegistroLicenca.pas' {frmKernel_RegistroLicenca},
  UfrmKernel_Sobre in '..\..\..\Template\UfrmKernel_Sobre.pas' {frmKernel_Sobre},
  UfrmKernel_Splash in '..\..\..\Template\UfrmKernel_Splash.pas' {frmKernel_Splash},
  UfrmLogin in 'UfrmLogin.pas' {frmLogin},
  UdmKernel_Base in '..\..\..\Template\UdmKernel_Base.pas' {dmKernel_Base: TDataModule},
  UdmKernel_Acesso in '..\..\..\Template\UdmKernel_Acesso.pas' {dmKernel_Acesso: TDataModule},
  UdmKernel_CadBase in '..\..\..\Template\UdmKernel_CadBase.pas' {dmKernel_CadBase: TDataModule},
  UdmKernel_CadMovBase in '..\..\..\Template\UdmKernel_CadMovBase.pas' {dmKernel_CadMovBase: TDataModule},
  UdmKernelPrincipal in '..\..\..\Template\UdmKernelPrincipal.pas' {dmKernelPrincipal: TDataModule},
  UdmPrincipal in 'UdmPrincipal.pas' {dmPrincipal: TDataModule},
  UfrmKernel_Aguarde in '..\..\..\Template\UfrmKernel_Aguarde.pas' {frmKernel_Aguarde},
  UfrmKernel_CadBase in '..\..\..\Template\UfrmKernel_CadBase.pas' {frmKernel_CadBase},
  UfrmKernel_CadBaseDB in '..\..\..\Template\UfrmKernel_CadBaseDB.pas' {frmKernel_CadBaseDB},
  UfrmKernel_CadItemBase in '..\..\..\Template\UfrmKernel_CadItemBase.pas' {frmKernel_CadItemBase},
  UfrmKernel_CadMovBase in '..\..\..\Template\UfrmKernel_CadMovBase.pas' {frmKernel_CadMovBase},
  UFrmKernel_Exclusao in '..\..\..\Template\UFrmKernel_Exclusao.pas' {FrmKernel_Exclusao},
  UfrmKernel_Filtro in '..\..\..\Template\UfrmKernel_Filtro.pas' {frmKernel_Filtro},
  UclKernel_PropriedadesProjeto in '..\..\..\Template\UclKernel_PropriedadesProjeto.pas',
  UfrmKernel_Principal in '..\..\..\Template\UfrmKernel_Principal.pas' {frmKernel_Principal},
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  untKernel_Interface_RegrasBD in '..\..\..\Template\untKernel_Interface_RegrasBD.pas',
  UdmTeste in '..\..\..\Template\UdmTeste.pas' {dmTeste: TDataModule},
  UfrmCadTeste in '..\..\..\Template\UfrmCadTeste.pas' {frmCadTeste},
  UfrmLstTeste in '..\..\..\Template\UfrmLstTeste.pas' {frmLstTeste},
  UntKernel_Classe_Firebird in '..\..\..\Template\UntKernel_Classe_Firebird.pas',
  UclKernel_Terminal in '..\..\..\Template\UclKernel_Terminal.pas',
  UntKernel_Classe_SQLServer in '..\..\..\Template\UntKernel_Classe_SQLServer.pas',
  Uclkernel_Config in '..\..\..\Template\Uclkernel_Config.pas';

begin
  Application.Initialize; 
  Application.MainFormOnTaskbar := True; 

  {Cria o datamodule principal na memoria}
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TdmKernel_Acesso, dmKernel_Acesso);
  frmlogin := TfrmLogin.Create(nil);

  {Inicializa váriaveis importantes para o funcionamento do sistema}
  Kernel_InicializaVariaveis;

  if frmlogin.showmodal=mrok then 
    begin 
      {Carega propriedades do Projeto} 
      Kernel_CaregaPropriedades; 
      {Cria Formulario Principal na memoria} 
      Application.CreateForm(TfrmPrincipal, frmPrincipal); 

     {Libera Login depois do usuario logar}
      FreeAndNil(frmLogin); 

      Application.Run; 
    end 
  else 
   Begin 
     {Libera Objetos da memoria}
     FreeAndNil(dmPrincipal); 
     FreeAndNil(dmKernel_Acesso); 

     application.terminate; 
   end; 

end.
