unit UdmKernel_Relatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UdmKernel_Base, frxDesgn, frxClass,SqlExpr;

type
  TdmKernel_Relatorio = class(TdmKernel_Base)
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
  private
    { Private declarations }
  public
    procedure Kernel_Imprimir(str_relatorio: string);
    procedure Kernel_Cabecalho_Relatorio;
  end;

var
  dmKernel_Relatorio: TdmKernel_Relatorio;

implementation

uses UKernel_DB, UKernel_VariaveisPublic;

{$R *.dfm}

{ TdmKernel_Relatorio }

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

procedure TdmKernel_Relatorio.Kernel_Imprimir(str_relatorio: string);
begin
  with rprtCadBase do
  begin
    LoadFromFile(str_relatorio);
    // Passa as informacoes da empresa por parametro
    Kernel_Cabecalho_Relatorio;
    // Passa o usuario logado por parametro
    Variables['usuario']:= Kernel_Terminal.int_filial;
    
    ShowReport();
  end;
end;

end.
