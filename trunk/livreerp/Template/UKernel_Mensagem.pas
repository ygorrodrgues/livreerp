unit UKernel_Mensagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls;

Const
   Kernel_arquivo_ConexaoDB : string = 'Conexao.conf'; // arquivo de configuracoes da conexao com o db
   Kernel_arquivo_Terminal : string = 'Terminal.conf'; // arquivo de configuracoes do modulo de pedido

   Kernel_RegLivreFrame = '\Software\LivreFrameWizard\';

  //------------------------------------------------------------------------------
  // Mensagens de Erros do kernel
  //------------------------------------------------------------------------------

  Kernel_Erro_FalhaInesperada : PAnsiChar = 'Atenção: Ocorreu uma falha ao tentar excluir ';

  //------------------------------------------------------------------------------
  // Mensagens de Confirmação/Decisao do kernel
  //------------------------------------------------------------------------------

  Kernel_Confirmacao_ImportarDados : PAnsiChar = 'Deseja Realmente Importar esse dados?';
  Kernel_Confirmacao_ExportarDados :  PAnsiChar = 'Deseja Realmente Exportar esse dados?';
  Kernel_Confirmacao_Sair_Aplicacao : PAnsiChar = 'Deseja Realmente Finalizar a Aplicação?';
  Kernel_Confirmacao_Apaga_Registro :  PAnsiChar = 'Deseja Realmente Excluir esse Registro?';
  Kernel_Confirmacao_Abandonar_Alteracoes :  PAnsiChar = 'Deseja Realmente Abandonar Alterações?';
  Kernel_Confirmacao_Confirmacao_Saida : PAnsiChar = 'Deseja Realmente Confirmar essa Operação ?';

  //==============================================================================
  // Mensagens de Avisos do kernel
  //==============================================================================

  Kernel_Aviso_TabelaVazia_Filtro  : string = 'Nenhum Registro Encontrado no filtro utilizado !';
  Kernel_Aviso_TabelaVazia  : string = 'Nenhum Registro Encontrado no filtro utilizado !';
  Kernel_Aviso_CampoObrigatorio : string = 'Impossível : Campo Obrigatório não preenchido';
  Kernel_Aviso_Exclusao : string = 'Registro Excluído com Sucesso!';
  Kernel_Aviso_Insercao : string = 'Registro Inserido com Sucesso!';
  Kernel_Aviso_Alteracao : string = 'Registro Alterado com Sucesso!';
  Kernel_Aviso_RegistrosVinculados : string = 'Exclusão Impossível. '+ #13 +
                      ' Motivo : Existe Registros Cadastrados com estas Informações.';
  Kernel_Aviso_Exclusao_RegistroPadrao : string = 'Exclusão Impossivel. '+ #13 +
                           ' Motivo: Registro Padrão do Banco de Dados';
  Kernel_Aviso_Alteracao_RegistroPadrao : string = 'Alteração Impossivel. '+ #13 +
                           ' Motivo: Registro Padrão do Banco de Dados';
  Kernel_Aviso_FecharSistema : string = 'O sistema será encerrado automaticamente para evitar futuros problemas!';

  //==============================================================================
  // Mensagens do Empresa de SoftHouse
  //==============================================================================

  Kernel_Nome_Projeto : string = 'LivreFrame - Framework';
  Kernel_Frase_SoftHouse : string = 'Sua necessidade! Nossa Inspiração';
  Kernel_SuporteTecnico : string = 'Qualquer dúvida entre em contato com o Suporte Técnico ou Administrador do Sistema.';

  
implementation

end.
