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
unit ufrmLstBaseDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmLstBase, DB, ImgList, ActnList, Grids,
  DBGrids, StdCtrls, Buttons, pngextra, ComCtrls, ExtCtrls;

type
  TfrmLstBaseDB = class(TfrmLstBase)
    procedure actAnteriorExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PreencheComboFiltro(J: Integer; cbb : TComboBox); override;
    procedure ImprimeCombox(codrel: integer); override;
    procedure NovoCadastro; override;
    procedure AlterarCadastro; override;
    procedure ExcluirCadastro; override;
    procedure PesquisaBase; override;
  end;

var
  frmLstBaseDB: TfrmLstBaseDB;

implementation

{$R *.dfm}

{ TfrmLstBaseDB }

procedure TfrmLstBaseDB.AlterarCadastro;
begin
  inherited;
  // Função Implementada no Filho
end;

procedure TfrmLstBaseDB.ExcluirCadastro;
begin
  inherited;
  // Função Implementada no Filho
end;

procedure TfrmLstBaseDB.ImprimeCombox(codrel: integer);
begin
  inherited;
  // Função Implementada no Filho
end;

procedure TfrmLstBaseDB.NovoCadastro;
begin
  inherited;
  // Função Implementada no Filho
end;

procedure TfrmLstBaseDB.PesquisaBase;
begin
  inherited;
  // Função Implementada no Filho
end;

procedure TfrmLstBaseDB.PreencheComboFiltro(J: Integer; cbb: TComboBox);
begin
  inherited;
  // Função Implementada no Filho
end;

procedure TfrmLstBaseDB.actAnteriorExecute(Sender: TObject);
begin
  inherited;
  if dsBase.DataSet.Active then
    dsBase.DataSet.Prior;
end;

procedure TfrmLstBaseDB.actPrimeiroExecute(Sender: TObject);
begin
  inherited;
  if dsBase.DataSet.Active then
    dsBase.DataSet.First;
end;

procedure TfrmLstBaseDB.actProximoExecute(Sender: TObject);
begin
  inherited;
  if dsBase.DataSet.Active then
    dsBase.DataSet.Next;
end;

procedure TfrmLstBaseDB.actUltimoExecute(Sender: TObject);
begin
  inherited;
  if dsBase.DataSet.Active then
    dsBase.DataSet.Last;
end;

end.
