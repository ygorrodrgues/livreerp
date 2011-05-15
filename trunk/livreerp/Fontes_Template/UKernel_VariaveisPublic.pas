unit UKernel_VariaveisPublic;

interface

  uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
    IniFiles, Registry, ShellAPI,ComObj, ExtCtrls, DBClient, Provider,SqlExpr,
    // Declara a classe de cadastro
    UclKernel_Conexao,
    // Declara a classe de cadastro
    UclKernel_Cadastro,
    // Declara a classe de Login
    UclKernel_Login,
    // Declara a classe de Propriedades do projeto    
    UclKernel_PropriedadesProjeto,
    // Declara a classe responsavel por ler e gravar em ini    
    Uclkernel_config,
    untKernel_Interface_RegrasBD,
    uclKernel_Terminal;

type
  // Tipo de Exclusao adotado nos cadastros
  TExclusao_Cadastro = (ExHistorico, ExApagar);
  var
    // ----------------- variaveis de classe ----------------------

   Tipo_DB: TTipoBD;

   Tipo_CON: TTipo_CON;

    // Variavel recebe classe de conexao
    Kernel_Conexao: TKernel_Conexao;

    // Variavel recebe classe de cadastro
    Kernel_Cadastro: TKernel_Cadastro;

    // Variavel recebe classe de Login
    Kernel_Login: TKernel_Login;

    Kernel_Terminal : TKernel_Terminal;

    // Variavel recebe classe de Propriedades Projeto
    PropriedadesPrj: TKernel_PropriedadesProjeto;

    Kernel_Tipo_Exclusao: TExclusao_Cadastro;

    kernel_config : Tkernel_config;
    // Variavel recebe classe de leitura e gravação de ini

    // Variavel que representa a conexao princial para o kernel
    FConexao : TSQLConnection;

    // Usada para autoinstanciamento de formularios
    strclass, strclassItem,strclass_anterior, strclassItem_anterior, strdmclasss : string;

    /// -------------------------- variaveis gerais ---------------///

    // Variavel que guarda o motivo de exclusao 
    kernel_str_DescExclusao : string;

    // Codigo da Empresa Logada
    kernel_codemp: integer;

    // Codigo do Menu
    kernel_CodMenu : Integer;

    // Guarda o codigo do registro atual da tela de ListagemBase
    int_chave: Integer;

    // Guarda o codigo da pessoa juridica do procedimento medico
    int_pessjuri: Integer;

    // Data usado para o cadastro 
    DatasetCadastro: TClientDataSet;
    DatasetListagem: TClientDataSet;
    DatasetCadastroItem: TClientDataSet;
    DatasetListagemItem: TClientDataSet;
    DatasetColunas: TClientDataSet;
    DatasetColunasFiltro: TClientDataSet;    
    DatasetqryCadastro: TSQLQuery;

    DatasetCadastro_Anterior: TClientDataSet;
    DatasetListagem_Anterior: TClientDataSet;
    DatasetCadastroItem_Anterior: TClientDataSet;
    DatasetListagemItem_Anterior: TClientDataSet;
    DatasetColunas_Anterior: TClientDataSet;
    DatasetqryCadastro_Anterior: TSQLQuery;

    {Define nome da tela}
    kernel_str_form, kernel_srt_nmformbase: string;

implementation


end.

