unit UKernel_Grid;

interface

uses
  DBClient, DBGrids, DB, Graphics;

  {Cria Ordenacao no dbgrid na coluna selecionada} 
  procedure OrdenaColunas(cds: TclientDataset; grid: TDBGrid; Column: TColumn);
  {Tira a ordenacao do dbgrid}
  procedure TiraOrdenacao(cds: TclientDataset);

implementation

procedure TiraOrdenacao(cds: TclientDataset);
Begin
  cds.IndexDefs.Update;
  //  Verifica se existe algum indice, se existir limpa
  if cds.IndexName <> '' then
    cds.IndexName :=  '';
end;

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

end.
