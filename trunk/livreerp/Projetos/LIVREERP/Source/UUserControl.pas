unit UUserControl;

interface

  uses Ukernel_variaveisPublic;

  procedure Configura_Controle_Usuario;

implementation

procedure Configura_Controle_Usuario;
Begin
  Kernel_Login.str_Tabela_Parametro := 'CONFIG_PARAMETRO';
  Kernel_Login.str_Qtd_Tent_Login   := 'PRM_QTD_TENTATIVAS';
End;

end.
