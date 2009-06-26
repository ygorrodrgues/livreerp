{
  Propriedade
  get = Ler o valor da propriedade
  set = Grava o valor da propriedade
}
unit UclKernel_Terminal;

interface

uses
  SysUtils, Forms;

type
  TKernel_Terminal = class
  private
    Fint_terminal: Integer;
    Fint_filial: integer;
    Fint_estoque: integer;
    Fint_porta_print: integer;

    function Getint_terminal: integer;
    procedure setint_terminal(const Value: integer);
    function Getint_estoque: integer;
    function Getint_filial: integer;
    procedure Setint_estoque(const Value: integer);
    procedure Setint_filial(const Value: integer);

    procedure Valida_Terminal(int_valor: Integer);
    procedure Valida_Filial(int_valor: Integer);
    procedure Valida_Estoque(int_valor: Integer);
  public
    // Indentificação do PC
    property int_terminal: integer read Getint_terminal write Setint_terminal;
    property int_filial: integer read Getint_filial write Setint_filial;
    property int_estoque: integer read Getint_estoque write Setint_estoque;

    Constructor Create();
    Destructor Destroy();
  end;

implementation

uses UKernel_Exception, Uclkernel_Config, UKernel_VariaveisPublic,
  UKernel_SysUtils, UKernel_Mensagem, UfrmKernel_Mensagem;

{ TTerminal }

constructor TKernel_Terminal.Create;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + Kernel_arquivo_Terminal) then
    Begin
      int_terminal := Kernel_Config.Kernel_LerInteiro('TERMINAL','NUMERO_TERMINAL', TiTerminal);
      int_filial   := Kernel_Config.Kernel_LerInteiro('TERMINAL','NUMERO_FILIAL', TiTerminal);
      int_estoque  := Kernel_Config.Kernel_LerInteiro('TERMINAL','NUMERO_ESTOQUE', TiTerminal);
    End
   else
    begin
      TFrmKernel_Mensagem.Mensagem('Arquivo de Configuração '+ Kernel_arquivo_Terminal +' não encontrado'+Kernel_SKIP +
        Kernel_Aviso_FecharSistema+Kernel_SKIP +Kernel_SKIP+
        Kernel_SuporteTecnico,'I',[mbOk]);

      Application.Terminate;
    end; 
end;

destructor TKernel_Terminal.Destroy;
begin

end;

function TKernel_Terminal.Getint_estoque: integer;
begin
  {Se nao for um valor de tipo de estoque valido cria excecao}
  Valida_Estoque(Fint_estoque);

  Getint_estoque := Fint_estoque;
end;

function TKernel_Terminal.Getint_filial: integer;
begin
  {Se nao for um valor de finial valido cria excecao}
  Valida_Filial(Fint_filial);

  Getint_filial := Fint_filial;
end;

function TKernel_Terminal.Getint_terminal: integer;
begin
  {Se nao for um valor de terminal valido cria excecao}
  Valida_Terminal(Fint_terminal);

  Getint_terminal := Fint_terminal;
end;

procedure TKernel_Terminal.Setint_estoque(const Value: integer);
begin
  Fint_estoque :=  value;
end;

procedure TKernel_Terminal.Setint_filial(const Value: integer);
begin
  Fint_filial :=  value;
end;

procedure TKernel_Terminal.setint_terminal(const Value: integer);
begin
  {Se nao for um valor de terminal valido cria excecao}
  Valida_Terminal(value);

  Fint_terminal :=  value;
end;

procedure TKernel_Terminal.Valida_Estoque(int_valor: Integer);
begin
  if not (int_valor> 0) then
    begin
      TFrmKernel_Mensagem.Mensagem('Número do Tipo de Estoque '+ inttostr(int_valor) +' deve ser maior que zero.'+Kernel_SKIP +
        'Configure corretamente o número do Tipo de Estoque no arquivo Terminal.conf. '+ Kernel_Aviso_FecharSistema+Kernel_SKIP +
        Kernel_SKIP+Kernel_SKIP + Kernel_SuporteTecnico,'I',[mbOk]);

      Application.Terminate;
    end;
end;

procedure TKernel_Terminal.Valida_Filial(int_valor: Integer);
begin
  if not (int_valor> 0) then
    begin
      TFrmKernel_Mensagem.Mensagem('Número da Empresa/Filial '+ inttostr(int_valor) +' deve ser maior que zero.'+Kernel_SKIP +
        'Configure corretamente o número da Empresa/Filial no arquivo Terminal.conf. '+ Kernel_Aviso_FecharSistema+Kernel_SKIP +
        Kernel_SKIP+Kernel_SKIP + Kernel_SuporteTecnico,'I',[mbOk]);

      Application.Terminate;
    end;
end;

procedure TKernel_Terminal.Valida_Terminal(int_valor: Integer);
begin
  if not (int_valor> 0) then
    begin
      TFrmKernel_Mensagem.Mensagem('Número do Terminal '+ inttostr(int_valor) +' deve ser maior que zero'+Kernel_SKIP +
        'Configure corretamente o número do terminal no arquivo Terminal.conf. '+ Kernel_Aviso_FecharSistema+Kernel_SKIP +
        Kernel_SKIP+Kernel_SKIP + Kernel_SuporteTecnico,'I',[mbOk]);
        
      Application.Terminate;  
    end;
end;

end.
