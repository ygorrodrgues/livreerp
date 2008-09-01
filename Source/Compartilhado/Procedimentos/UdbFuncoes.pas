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
unit UdbFuncoes;

interface

  uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls, DBClient, Provider,FMTBcd,
   SqlExpr, Variants ;

  // Ordena colunas Clicada no Grid
  procedure OrdenaColunas(cds: TclientDataset; grid: TDBGrid; Column: TColumn);
  // Desativa Indexação do campos do Clientdataset
  procedure TiraOrdenacao(cds: TclientDataset);
  {: atualiza o ClientDataSet (principalmente para Relatórios)}
  procedure RefreshCds (aCds : TClientDataSet);

implementation

procedure OrdenaColunas(cds: TclientDataset; grid: TDBGrid; Column: TColumn);
var
  sIndexName : string;
  Options: TIndexOptions;
  I : integer;
begin
 // Alterar as cores do título de um DBGrid em tempo execução
  for i:= 0 to grid.Columns.count-1 do
  begin
    // Coloca Todas Colunas com Cor padrão
    grid.Columns[i].Title.Color := clBtnFace;
    grid.Columns[i].Title.Font.Color := clBlack;
    grid.Columns[i].Title.Font.Style := [];
  end;

  cds.IndexDefs.Update;
  //  Muda o Tipo de Ordenação
  if cds.IndexName = Column.FieldName + '_ASC' then
  begin
    sIndexName := Column.FieldName + '_DESC';
    Options := [ixDescending];
  end
  else
  begin
    sIndexName := Column.FieldName + '_ASC';
    Options := [];
  end;

  if cds.IndexDefs.IndexOf(sIndexName) < 0 then
    cds.AddIndex(sIndexName, Column.FieldName, Options);

  cds.IndexName := sIndexName;

  // Pinta somente a coluna selecionada
  // Column.Title.color := ClYellow;
  Column.Title.Font.Style := [fsBold];
  // Column.Title.Font.Color := clRed;
end;

procedure TiraOrdenacao(cds: TclientDataset);
Begin
  cds.IndexDefs.Update;
  //  Verifica se existe algum indice, se existir limpa
  if cds.IndexName <> '' then
    cds.IndexName :=  '';
end;

procedure RefreshCds (aCds : TClientDataSet);
begin
  {: atualiza o ClientDataSet (principalmente para Relatórios)}
  aCds.Close;
  aCds.Open;
end;


end.
 