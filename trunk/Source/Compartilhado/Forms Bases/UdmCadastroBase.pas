{
Projeto ERP Livre - Sistema de Gestão Comercial Livre
Copyright (c) 2008 Sérgio Guedes

O ERP Livre é um software de livre distribuição, que pode ser copiado e
distribuído sob os termos da Licença Pública Geral GNU, conforme publicada
pela Free Software Foundation, versão 2 da licença ou qualquer versão posterior.

Este programa é distribuído na expectativa de ser útil aos seus usuários,
porém  NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licença Pública Geral GNU para maiores detalhes.

@project-name: ERP Livre
@project-email: ERPLivre@yahoo.com.br
@autor-name: Sérgio Guedes
@autor-email: sergio_rj45@yahoo.com.br

}
unit UdmCadastroBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBase, FMTBcd, DBClient, Provider, DB, SqlExpr, AppEvnts,
  XPMan, DbCommon;

type
  TdmCadastroBase = class(TdmBase)
    qryLstBase: TSQLQuery;
    dspLstBase: TDataSetProvider;
    cdsLstBase: TClientDataSet;
    qryCadBase: TSQLQuery;
    dspCadBase: TDataSetProvider;
    cdsCadBase: TClientDataSet;
  private
    { Private declarations }
  public
    {Formata todos os campos currency} 
    procedure FormatarValoresMonetarios;
    function NomedaTabela(DataSet: TDataSet): String;
    procedure LabelCampo(Tabela: String; DataSet: TDataSet);   
  end;

var
  dmCadastroBase: TdmCadastroBase;

implementation

uses Udmprincipal;

{$R *.dfm}

{ TdmCadastroBase }

function NomedaTabela(DataSet: TDataSet): String;
begin
//  Result:= GetTableNameFromSQL(((FindComponent((DataSet as TClientDataSet).ProviderName) as
//  TDataSetProvider).DataSet as  TSQLQuery).Text)
end;

procedure LabelCampo(Tabela: String; DataSet: TDataSet);
Var Teste: TSQLQuery;
    C: Integer;
    Campo: String;
begin
  Teste:=TSQLQuery.Create(Teste);
  Teste.SQLConnection:= Dados.Dados;

  With Teste, SQL do
  Begin
    Close;
    Clear;
    Add('SELECT RDB$DESCRIPTION AS DESCRICAO, RDB$FIELD_NAME AS CAMPO FROM RDB$RELATION_FIELDS');
    Add('WHERE (RDB$RELATION_NAME = '''+Tabela+''')');
    Add('ORDER BY RDB$RELATION_NAME');
    Open;
    While not Eof do
    Begin
      Try
       Campo:=Trim(FieldByName('CAMPO').AsString);
       DataSet.FieldByName(Campo).DisplayLabel:=FieldByName('DESCRICAO').AsString;
       Case DataSet.FieldByName(Campo).DataType of
        ftCurrency, ftFloat: Begin
                                 TFloatField(DataSet.FieldByName(Campo)).DisplayFormat:='###,###,##0.00';
                              DataSet.FieldByName(Campo).OnSetText:=Dados.FormataFloat;
                             End;
        ftDateTime, ftDate:  Begin
                              TDateField(DataSet.FieldByName(Campo)).DisplayFormat:='dd/mm/yyyy';
                              DataSet.FieldByName(Campo).EditMask:='99/99/9999';
                              DataSet.FieldByName(Campo).OnSetText:=Dados.LimpaData;
                             End;
        ftTime: Begin
                 TTimeField(DataSet.FieldByName(Campo)).DisplayFormat:='hh:mm:ss';
                 DataSet.FieldByName(Campo).EditMask:='99:99:99';
                 DataSet.FieldByName(Campo).OnSetText:=Dados.LimpaHora;
                End;
        Else
         If DataSet.FieldByName(Campo).DataType<>ftInteger Then
          DataSet.FieldByName(Campo).OnSetText:=Dados.LimpaCampo;
       end;
      Except
      End;

      Application.ProcessMessages;
      Next;
    End;
    Close;
  End;
end;   

procedure TdmCadastroBase.FormatarValoresMonetarios;
var
  I, J : Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDataSet then
    begin
      with TDataSet(Components[I]) do
      begin
        for J := 0 to Fields.Count - 1 do
        begin                              
          if (Fields[J] is TFloatField) or (Fields[J] is TBCDField) or (Fields[J] is TFMTBCDField) then
          begin
            TNumericField(Fields[J]).DisplayFormat := '##,###,##0.00';
          end;
        end;
      end;
    end;
  end;
end;

end.
