unit UdmKernelPrincipal;

interface

uses
  SysUtils, Classes, WideStrings, ADODB, DB, SqlExpr, Dialogs, Forms,
  FMTBcd, DBXDynalink, DbxMsSql,untKernel_Interface_RegrasBD,
   UntKernel_Classe_Firebird,UclKernel_Conexao, UntKernel_Classe_SQLServer,
    UclKernel_Cadastro;

type
  TdmKernelPrincipal = class(TDataModule)
    qryKernel_Gerenerica: TSQLQuery;
    conPrincipalKernel: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private

  public
    procedure ConectaServidor; virtual;
    procedure DesconectaServidor; virtual;

    procedure AntesConectaServidor; virtual;
    procedure DepoisConectaServidor; virtual;

  end;

var
  dmKernelPrincipal: TdmKernelPrincipal;

implementation

uses UKernel_VariaveisPublic, // Unit de variaveis publicas a todo kernel
  UclKernel_Login, UclKernel_PropriedadesProjeto, UclKernel_Terminal,
  UKernel_Exception, UfrmKernel_Mensagem;

{$R *.dfm}

procedure TdmKernelPrincipal.AntesConectaServidor;
begin
  // Metodo sera codificado nos filhos
end;

procedure TdmKernelPrincipal.ConectaServidor;
var
  vRegrasBD: IRegrasBD;
begin
  AntesConectaServidor;

  with conPrincipalKernel DO
  begin
    Connected := False;
    try
      Params.Clear;
      case TTipoBD(Tipo_DB) of
        bdFirebird:
          Begin
            vRegrasBD := TRegrasFirebird.Create;

            Params.Add('DriverName=' + vRegrasBD.DriverName);
            Params.Add('LibraryName=' + vRegrasBD.LibraryName);
            Params.Add('VendorLib=' + vRegrasBD.VendorLib);
            Params.Add('database=' + Kernel_Conexao.str_database);
            Params.Add('User_Name=' + vRegrasBD.str_usuario);
            Params.Add('password=' + vRegrasBD.str_Senha);
            Params.Add('blobsize=-1');
            Params.Add('commitretain=False');
            Params.Add('localecode=0000');
            Params.Add('rolename=RoleName');
            Params.Add('sqldialect=3');
            Params.Add('interbase transisolation=ReadCommited');
            Params.Add('waitonlocks=True');
            Params.Add('trim char=False');
          End;

        bdSQLServer:
          Begin
            vRegrasBD := TRegrasSQLServer.Create;

            Params.Add('DriverName=' + vRegrasBD.DriverName);
            Params.Add('LibraryName=' + vRegrasBD.LibraryName);
            Params.Add('VendorLib=' + vRegrasBD.VendorLib);
            Params.Add('HostName=' + Kernel_Conexao.str_server);
            Params.Add('DataBase=' + Kernel_Conexao.str_database);
            Params.Add('User_Name=' + vRegrasBD.str_usuario);
            Params.Add('Password=' + vRegrasBD.str_Senha);

            Params.Add('BlobSize=-1');
            Params.Add('ErrorResourceFile=');
            Params.Add('LocaleCode=0000');
            Params.Add('MSSQL TransIsolation=ReadCommited');
            Params.Add('OS Authentication=False');
            Params.Add('Prepare SQL=False');
          End;

        bdOracle:
          Begin
            raise Exception.Create
              ('Banco de dados Oracle ainda não suportado.');
          End;

        bdPostGreeSQL:
          Begin
            raise Exception.Create(
              'Banco de dados PostGreeSQL ainda não suportado.');
          End;


      end;

      Connected := True;

    except
      on E: Exception do
      begin
        TFrmKernel_Mensagem.Mensagem('Problemas ao acessar o banco de dados local! Verifique as configurações do sistema.','I',[mbOk]);
        TFrmKernel_Mensagem.Mensagem('Erro Apresentado: ' + Uppercase(E.Message),'E',[mbOk]);

        //Configura_Conexao_DB;

        Application.Terminate;
        Raise ;
      end;
    end;
  end;

  DepoisConectaServidor;
end;

procedure TdmKernelPrincipal.DataModuleCreate(Sender: TObject);
begin
  {Instancia Classe de parametros de conexao com o banco}
  Kernel_Conexao := TKernel_Conexao.Create;

  {Cria classe de cadastro}
  Kernel_Cadastro := TKernel_Cadastro.Create;  

  {Instancia Classe de parametros de conexao com o banco}
  Kernel_login := TKernel_Login.Create;

  {Instancia Classe de parametros de Propriedades do Projeto}  
  PropriedadesPrj := TKernel_PropriedadesProjeto.create;

  //Kernel_Terminal := TKernel_Terminal.Create();

  {Tenta se conectar ao Servidor}
  ConectaServidor;
end;

procedure TdmKernelPrincipal.DataModuleDestroy(Sender: TObject);
begin
  {Libera objetos da memoria}
  Kernel_Conexao.Free;
  Kernel_login.Free;
  PropriedadesPrj.Free;
  //Kernel_Terminal.Free;
  {Libera classes da memoria}
  Kernel_Cadastro.Free;  

  {Desconecta do servidor}
  DesconectaServidor;
end;

procedure TdmKernelPrincipal.DepoisConectaServidor;
begin
  // Metodo sera codificado nos filhos
end;

procedure TdmKernelPrincipal.DesconectaServidor;
begin
  conPrincipalKernel.Connected := False;
end;

end.
