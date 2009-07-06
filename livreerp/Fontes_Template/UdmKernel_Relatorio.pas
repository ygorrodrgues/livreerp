unit UdmKernel_Relatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_Base, frxDesgn, frxClass,SqlExpr, frxDBSet,
  frxDBXComponents, FMTBcd, Provider, DB, DBClient;

type
  TdmKernel_Relatorio = class(TdmKernel_Base)
    rprtCadBase: TfrxReport;
    dsgnrCadBase: TfrxDesigner;
    cdsLstEmpresa: TClientDataSet;
    qryLstAux: TSQLQuery;
    dspLstAux: TDataSetProvider;
    cdsLstEmpresaEMP_EMPRESA: TIntegerField;
    cdsLstEmpresaEMP_ENDERECO: TStringField;
    cdsLstEmpresaEMP_BAIRRO: TStringField;
    cdsLstEmpresaEMP_TELEFONE: TStringField;
    cdsLstEmpresaEMP_EMAIL: TStringField;
    cdsLstEmpresaEMP_FANTASIA: TStringField;
    cdsLstEmpresaEMP_NUMERO: TStringField;
    cdsLstEmpresaEMP_CIDADE: TStringField;
    cdsLstEmpresaEMP_ESTADO: TStringField;
    cdsLstEmpresaEMP_FAX: TStringField;
    cdsLstEmpresaEMP_SITE: TStringField;
    dbdtstLstEmpresa: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Kernel_Imprimir(str_relatorio: string; Mostra_Cabecalho: Boolean = False);
    // Preenche informações do cabeçalho do relatorio baseado no template do framework
    procedure Kernel_Cabecalho_Relatorio;
    procedure Adicionar_Parametro(str_parametro, str_vl_parametro: string);
  end;

var
  dmKernel_Relatorio: TdmKernel_Relatorio;

implementation

uses UKernel_DB, UKernel_VariaveisPublic, UKernel_SysUtils, UKernel_Exception,
  UKernel_Mensagem, UdmPrincipal;

{$R *.dfm}

{ TdmKernel_Relatorio }

procedure TdmKernel_Relatorio.Adicionar_Parametro(str_parametro,  str_vl_parametro: string);
begin
  with rprtCadBase do
  begin
    Variables[str_parametro] :=str_vl_parametro;
  end;
end;

procedure TdmKernel_Relatorio.DataModuleCreate(Sender: TObject);
begin
  inherited;
  // Dados da empresa
  kernel_RefreshCds(cdsLstEmpresa);
end;

procedure TdmKernel_Relatorio.Kernel_Cabecalho_Relatorio;
var
 qry: TSQLQuery;
begin
  with Qry do
  begin
    qry := InstanciaQuery; {: cria uma instância do objeto}
    try
      SQL.Add('SELECT * FROM LSTPADRAORELATORIO WHERE CODEMP='+ QuotedStr(IntToStr(Kernel_Terminal.int_filial)) );
      Open;

      with rprtCadBase do
      begin
        Variables['moEmpresa'] := Qry.FieldByName('NOMEEMP').Value;
        Variables['moEndereco'] := Qry.FieldByName('ENDERECOEMP').Value;
        Variables['moBairro'] := Qry.FieldByName('NOMEBAIRRO').Value;
        Variables['moTelefone'] := Qry.FieldByName('FONEEMP').Value;
        Variables['moEmail'] := Qry.FieldByName('EMAILEMP').Value;
        Variables['moFantasia'] := Qry.FieldByName('FANTASIAEMP').Value;
        Variables['moNumero'] := Qry.FieldByName('NUMEROEMP').Value;
        Variables['moCidade'] := Qry.FieldByName('NOMECIDADE').Value;
        Variables['moEstado'] := Qry.FieldByName('NOMEESTADO').Value;
        Variables['moFax'] := Qry.FieldByName('FAXEMP').Value;
        Variables['moSite'] := Qry.FieldByName('SITEEMP').Value;
      end;
    finally
      FreeAndNil(Qry);  {: libera o objeto da memória}
    end;
  end;

end;

procedure TdmKernel_Relatorio.Kernel_Imprimir(str_relatorio: string; Mostra_Cabecalho: Boolean = False);
begin
  with rprtCadBase do
  begin
    if Kernel_Caminho_Relatorio('PARAMETRO','CAMINHORELATORIO') = '' then
      begin
        raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_Relatorio_NaoEncontrado,['( '+ str_relatorio +' )']);
      end;

    str_relatorio := Kernel_DiretorioBarras(Kernel_Caminho_Relatorio('PARAMETRO','CAMINHORELATORIO'))+ str_relatorio;

    if FileExists(str_relatorio) then
      Begin
        LoadFromFile(str_relatorio);

        // Passa as informacoes da empresa por parametro
        if Mostra_Cabecalho then       
          Kernel_Cabecalho_Relatorio;
          
        // Passa o usuario logado por parametro
        Variables['usuario']:= Kernel_Terminal.int_filial;

        ShowReport();
       // DesignReport();
      End
    else
      Begin
        raise Livre_Mensagem_Global.CreateFmt(Kernel_Aviso_Relatorio_NaoEncontrado,['( '+ str_relatorio +' )']);
      End; 
  end;
end;

end.
