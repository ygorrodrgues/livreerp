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
  csDXFunctions in '..\..\..\Fontes_Template\csDXFunctions.pas',
  UclKernel_Cadastro in '..\..\..\Fontes_Template\UclKernel_Cadastro.pas',
  UclKernel_Conexao in '..\..\..\Fontes_Template\UclKernel_Conexao.pas',
  UclKernel_Login in '..\..\..\Fontes_Template\UclKernel_Login.pas',
  UKernel_AcessoSistema in '..\..\..\Fontes_Template\UKernel_AcessoSistema.pas',
  UKernel_DATA in '..\..\..\Fontes_Template\UKernel_DATA.pas',
  UKernel_DB in '..\..\..\Fontes_Template\UKernel_DB.pas',
  UKernel_Exception in '..\..\..\Fontes_Template\UKernel_Exception.pas',
  UKernel_Grid in '..\..\..\Fontes_Template\UKernel_Grid.pas',
  UKernel_Internet in '..\..\..\Fontes_Template\UKernel_Internet.pas',
  UKernel_Mensagem in '..\..\..\Fontes_Template\UKernel_Mensagem.pas',
  UKernel_Mensagem_Usuario in '..\..\..\Fontes_Template\UKernel_Mensagem_Usuario.pas',
  UKernel_Mouse in '..\..\..\Fontes_Template\UKernel_Mouse.pas',
  UKernel_Registry in '..\..\..\Fontes_Template\UKernel_Registry.pas',
  UKernel_Security in '..\..\..\Fontes_Template\UKernel_Security.pas',
  uKernel_Sistema in '..\..\..\Fontes_Template\uKernel_Sistema.pas',
  UKernel_String in '..\..\..\Fontes_Template\UKernel_String.pas',
  UKernel_SysUtils in '..\..\..\Fontes_Template\UKernel_SysUtils.pas',
  UKernel_VariaveisPublic in '..\..\..\Fontes_Template\UKernel_VariaveisPublic.pas',
  UfrmKernel_Base in '..\..\..\Fontes_Template\UfrmKernel_Base.pas' {frmKernel_Base},
  UfrmKernel_Login in '..\..\..\Fontes_Template\UfrmKernel_Login.pas' {frmKernel_Login},
  UfrmKernel_LstBase in '..\..\..\Fontes_Template\UfrmKernel_LstBase.pas' {frmKernel_LstBase},
  UfrmKernel_Mensagem in '..\..\..\Fontes_Template\UfrmKernel_Mensagem.pas' {frmKernel_Mensagem},
  UfrmKernel_Parametro in '..\..\..\Fontes_Template\UfrmKernel_Parametro.pas' {frmKernel_Parametro},
  UfrmKernel_RegistroLicenca in '..\..\..\Fontes_Template\UfrmKernel_RegistroLicenca.pas' {frmKernel_RegistroLicenca},
  UfrmKernel_Sobre in '..\..\..\Fontes_Template\UfrmKernel_Sobre.pas' {frmKernel_Sobre},
  UfrmKernel_Splash in '..\..\..\Fontes_Template\UfrmKernel_Splash.pas' {frmKernel_Splash},
  UfrmLogin in 'UfrmLogin.pas' {frmLogin},
  UdmKernel_Base in '..\..\..\Fontes_Template\UdmKernel_Base.pas' {dmKernel_Base: TDataModule},
  UdmKernel_Acesso in '..\..\..\Fontes_Template\UdmKernel_Acesso.pas' {dmKernel_Acesso: TDataModule},
  UdmKernel_CadBase in '..\..\..\Fontes_Template\UdmKernel_CadBase.pas' {dmKernel_CadBase: TDataModule},
  UdmKernel_CadMovBase in '..\..\..\Fontes_Template\UdmKernel_CadMovBase.pas' {dmKernel_CadMovBase: TDataModule},
  UdmKernelPrincipal in '..\..\..\Fontes_Template\UdmKernelPrincipal.pas' {dmKernelPrincipal: TDataModule},
  UdmPrincipal in 'UdmPrincipal.pas' {dmPrincipal: TDataModule},
  UfrmKernel_Aguarde in '..\..\..\Fontes_Template\UfrmKernel_Aguarde.pas' {frmKernel_Aguarde},
  UfrmKernel_CadBase in '..\..\..\Fontes_Template\UfrmKernel_CadBase.pas' {frmKernel_CadBase},
  UfrmKernel_CadBaseDB in '..\..\..\Fontes_Template\UfrmKernel_CadBaseDB.pas' {frmKernel_CadBaseDB},
  UfrmKernel_CadItemBase in '..\..\..\Fontes_Template\UfrmKernel_CadItemBase.pas' {frmKernel_CadItemBase},
  UfrmKernel_CadMovBase in '..\..\..\Fontes_Template\UfrmKernel_CadMovBase.pas' {frmKernel_CadMovBase},
  UFrmKernel_Exclusao in '..\..\..\Fontes_Template\UFrmKernel_Exclusao.pas' {FrmKernel_Exclusao},
  UfrmKernel_Filtro in '..\..\..\Fontes_Template\UfrmKernel_Filtro.pas' {frmKernel_Filtro},
  UclKernel_PropriedadesProjeto in '..\..\..\Fontes_Template\UclKernel_PropriedadesProjeto.pas',
  UfrmKernel_Principal in '..\..\..\Fontes_Template\UfrmKernel_Principal.pas' {frmKernel_Principal},
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  untKernel_Interface_RegrasBD in '..\..\..\Fontes_Template\untKernel_Interface_RegrasBD.pas',
  UdmTeste in '..\..\..\Fontes_Template\UdmTeste.pas' {dmTeste: TDataModule},
  UfrmCadTeste in '..\..\..\Fontes_Template\UfrmCadTeste.pas' {frmCadTeste},
  UfrmLstTeste in '..\..\..\Fontes_Template\UfrmLstTeste.pas' {frmLstTeste},
  UntKernel_Classe_Firebird in '..\..\..\Fontes_Template\UntKernel_Classe_Firebird.pas',
  UclKernel_Terminal in '..\..\..\Fontes_Template\UclKernel_Terminal.pas',
  UntKernel_Classe_SQLServer in '..\..\..\Fontes_Template\UntKernel_Classe_SQLServer.pas',
  Uclkernel_Config in '..\..\..\Fontes_Template\Uclkernel_Config.pas',
  UUserControl in 'UUserControl.pas',
  UfrmKernel_Confirma_Exclusao in '..\..\..\Fontes_Template\UfrmKernel_Confirma_Exclusao.pas' {frmKernel_Confirma_Exclusao},
  UdmKernel_Relatorio in '..\..\..\Fontes_Template\UdmKernel_Relatorio.pas' {dmKernel_Relatorio: TDataModule},
  UdmBanco in 'UdmBanco.pas' {dmBanco: TDataModule},
  UfrmLstBanco in 'UfrmLstBanco.pas' {frmLstBanco},
  UfrmCadBanco in 'UfrmCadBanco.pas' {frmCadBanco};

{$R *.res}

begin
  Application.Initialize; 
  Application.MainFormOnTaskbar := True;

  {Cria o datamodule principal na memoria}
  Application.Title := 'Livre ERP';
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
