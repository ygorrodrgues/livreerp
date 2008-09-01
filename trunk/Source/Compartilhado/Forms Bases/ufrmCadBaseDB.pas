unit ufrmCadBaseDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCadBase, ImgList, ActnList, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, DB, SqlExpr, DBXpress, DBClient;

type
  TfrmCadBaseDB = class(TfrmCadBase)
    dsBase: TDataSource;
    procedure actSalvarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure NovoRegistro; override;
    procedure AlterarRegistro; override;
    procedure ConfirmarRegistro; override;
    procedure CancelarRegistro; override;
    procedure salvarRegistro; override;
    procedure EnableDisableControls(Value: Boolean); override;
  end;

var
  frmCadBaseDB: TfrmCadBaseDB;

implementation

uses UFuncoes_Gerais, Udmprincipal, UfrmMensagem;

{$R *.dfm}

{ TfrmCadBaseDB }

procedure TfrmCadBaseDB.AlterarRegistro;
begin
  inherited;
  dsBase.DataSet.edit;
end;

procedure TfrmCadBaseDB.CancelarRegistro;
begin
  inherited;
  dsBase.DataSet.Cancel;
end;

procedure TfrmCadBaseDB.ConfirmarRegistro;
begin

end;

procedure TfrmCadBaseDB.EnableDisableControls(Value: Boolean);
begin
  inherited;

end;

procedure TfrmCadBaseDB.NovoRegistro;
begin
  inherited;
  dsBase.DataSet.Append;
end;

procedure TfrmCadBaseDB.salvarRegistro;
begin
  inherited;

end;

procedure TfrmCadBaseDB.actSalvarExecute(Sender: TObject);
var
  TD: TTransactionDesc;
  i: Integer;
begin
  inherited;
  TD.TransactionId := 1;
  TD.IsolationLevel := xilREADCOMMITTED;

  if dsBase.State in [dsinsert] then
    i := 1
   else
    i := 2;

  if not dmPrincipal.conPrincipal.InTransaction then
    dmPrincipal.conPrincipal.StartTransaction(TD);// Inicia transação
  try
    dsBase.DataSet.Post;

    if dsBase.DataSet is TClientDataSet then
      Begin
        if (TClientDataSet(dsBase.DataSet).ApplyUpdates(0) = 0) then
          Begin
            dmPrincipal.conPrincipal.Commit(TD);// Confirma Transação

            // Mostra Mensagem
            if i = 1 then
              TFrmMensagem.Mensagem('Atenção : Registro Inserido com sucesso ' ,'I',[mbOk])
             else
              TFrmMensagem.Mensagem('Atenção : Registro Alterado com sucesso ' ,'I',[mbOk]) ;

          end
         else
           dmPrincipal.conPrincipal.RollBack(TD);// Cancela Transação
      end;
  except
    on E: Exception do
    dmPrincipal.conPrincipal.RollBack(TD); // Volta as Alterações
  end;
end;

end.
