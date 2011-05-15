unit UfrmKernel_CadBaseDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_CadBase, pngimage, JvExControls, JvComponent, JvXPCore,
  JvXPButtons, ExtCtrls, ComCtrls, DB, DBClient , ImgList, StdCtrls,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, Mask, JvExMask, JvToolEdit, JvMaskEdit,
  JvCheckedMaskEdit, JvDatePickerEdit, JvDBDatePickerEdit, JvExComCtrls,
  JvDateTimePicker, JvDBDateTimePicker, SqlExpr, Provider, ActnList, RzPanel,
  RzButton, Buttons, dxGDIPlusClasses, RzTabs, RzStatus, cxGraphics,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPC, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Menus, cxLookAndFeelPainters, cxButtons, cxLookAndFeels;

type
  TfrmKernel_CadBaseDB = class(TfrmKernel_CadBase)
    procedure FormCreate(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
  private
    { Private declarations }
  public
    {Executa antes de executar o novo registro}
    procedure AntesNovoRegistro; override;
    {Execura o metodo Novo Registro}
    procedure NovoRegistro; override;
    {Executa Todo o processo de antes novo depois}
    procedure Executa_NovoRegistro; override;
    {Executa Depois de executar o novo registro}
    procedure DepoisNovoRegistro; override;

    {Executa antes de executar o Alterar registro}
    procedure AntesAlterarRegistro; override;
    {Execura o metodo Alterar Registro}
    procedure AlterarRegistro; override;
    {Executa Todo o processo de antes Alterar depois}
    procedure Executa_AlterarRegistro; override;
    {Executa Depois de executar o Alterar registro}
    procedure DepoisAlterarRegistro; override;

    {Executa antes de executar o Salvar registro}
    procedure AntesSalvarRegistro; override;
    {Execura o metodo Salvar Registro}
    procedure SalvarRegistro; override;
    {Executa Todo o processo de antes Salvar depois}
    procedure Executa_SalvarRegistro; override;
    {Executa Depois de executar o Salvar registro}
    procedure DepoisSalvarRegistro; override;

    {Executa antes de executar o Cancelarregistro}
    procedure AntesCancelarRegistro; override;
    {Execura o metodo Cancelar Registro}
    procedure CancelarRegistro; override;
    {Executa Todo o processo de antes Cancelar depois}
    procedure Executa_CancelarRegistro; override;
    {Executa Depois de executar o Cancelar registro}
    procedure DepoisCancelarRegistro; override;

    {Executa antes de executar o Fechar}
    procedure AntesFechar; override;
    {Execura o metodo Fechar}
    procedure Fechar; override;
    {Executa Todo o processo de antes Cancelar depois}
    procedure Executa_Fechar; override;
    {Executa Depois de executar o Fechar}
    procedure DepoisFechar; override;

    {Executa antes de executar o Imprimir registro}
    procedure AntesImprimirRegistro; override;
    {Execura o metodo Imprimir Registro}
    procedure ImprimirRegistro; override;
    {Executa Todo o processo de antes Imprimir depois}
    procedure Executa_ImprimirRegistro; override;
    {Executa Depois de executar o Imprimir registro}
    procedure DepoisImprimirRegistro; override;

  end;

var
  frmKernel_CadBaseDB: TfrmKernel_CadBaseDB;

implementation

uses UfrmKernel_Mensagem, UKernel_Mensagem, UdmPrincipal, UKernel_DB, UKernel_VariaveisPublic,
  uKernel_Sistema;

{$R *.dfm}

procedure TfrmKernel_CadBaseDB.actFecharExecute(Sender: TObject);
begin
  inherited;
  {Quando for sair e tiver em alteração ou insert cancela}
  if dsBase.DataSet.state in [dsedit, dsinsert] then
    Begin
      dsBase.DataSet.Cancel;
      TClientDataSet(dsBase.DataSet).CancelUpdates;
    End;
end;

procedure TfrmKernel_CadBaseDB.AlterarRegistro;
begin
  inherited;
  dsBase.DataSet.edit;
end;

procedure TfrmKernel_CadBaseDB.AntesAlterarRegistro;
begin
  inherited;

end;

procedure TfrmKernel_CadBaseDB.AntesCancelarRegistro;
begin

  
  inherited;

end;

procedure TfrmKernel_CadBaseDB.AntesFechar;
begin
  inherited;

end;

procedure TfrmKernel_CadBaseDB.AntesImprimirRegistro;
begin
 inherited;
 
end;

procedure TfrmKernel_CadBaseDB.AntesNovoRegistro;
begin
  inherited;

end;

procedure TfrmKernel_CadBaseDB.AntesSalvarRegistro;
begin
  inherited;

end;

procedure TfrmKernel_CadBaseDB.CancelarRegistro;
begin
  inherited;
  dsBase.DataSet.Cancel;
  TClientDataSet(dsBase.DataSet).CancelUpdates;
end;

procedure TfrmKernel_CadBaseDB.Executa_AlterarRegistro;
begin
  inherited;

end;

procedure TfrmKernel_CadBaseDB.Executa_CancelarRegistro;
begin
  inherited;

end;

procedure TfrmKernel_CadBaseDB.Executa_Fechar;
begin
  inherited;

end;

procedure TfrmKernel_CadBaseDB.Executa_ImprimirRegistro;
begin
  inherited;
  
end;

procedure TfrmKernel_CadBaseDB.Executa_NovoRegistro;
begin
  inherited;
  dsBase.DataSet.Append;
end;

procedure TfrmKernel_CadBaseDB.Executa_SalvarRegistro;
begin
 inherited;

end;

procedure TfrmKernel_CadBaseDB.Fechar;
begin
  inherited;
  // Codificado no Pai
end;


procedure TfrmKernel_CadBaseDB.FormCreate(Sender: TObject);
begin
  inherited;// aqui no pai

end;

procedure TfrmKernel_CadBaseDB.ImprimirRegistro;
begin
 inherited;
 
end;

procedure TfrmKernel_CadBaseDB.NovoRegistro;
begin
  inherited;

end;


procedure TfrmKernel_CadBaseDB.SalvarRegistro;
var
  TD: TTransactionDesc;
  i: Integer;
begin
  dsBase.DataSet.Post;
  TClientDataSet(dsBase.DataSet).ApplyUpdates(0);

  inherited;
 { TD.TransactionId := 1;
  TD.IsolationLevel := xilREADCOMMITTED;

  if dsBase.State in [dsinsert] then
    i := 1
   else
    i := 2;

  if not dmPrincipal.conPrincipalKernel.InTransaction then
    dmPrincipal.conPrincipalKernel.StartTransaction(TD);// Inicia transação
  try
    dsBase.DataSet.Post;

    if dsBase.DataSet is TClientDataSet then
      Begin
        if (TClientDataSet(dsBase.DataSet).ApplyUpdates(0) = 0) then
          Begin
            dmPrincipal.conPrincipalKernel.Commit(TD);// Confirma Transação

            // Mostra Mensagem 
            if i = 1 then
              TfrmKernel_Mensagem.Mensagem('Atenção : Registro Inserido com sucesso ' ,'I',[mbOk])
             else
              TfrmKernel_Mensagem.Mensagem('Atenção : Registro Alterado com sucesso ' ,'I',[mbOk]);              
          end
         else
           begin
             dmPrincipal.conPrincipalKernel.RollBack(TD);// Cancela Transação
             TfrmKernel_Mensagem.Mensagem('Atenção: Aconteceu uma falha na gravação do Registro ' ,'I',[mbOk]);
           end;
      end;
  except
    on E: Exception do
    begin
      TfrmKernel_Mensagem.Mensagem(E.Message ,'I',[mbOk]);
      dmPrincipal.conPrincipalKernel.RollBack(TD); // Volta as Alterações
    end;
  end; }

end;

procedure TfrmKernel_CadBaseDB.DepoisAlterarRegistro;
begin
  inherited;

end;

procedure TfrmKernel_CadBaseDB.DepoisCancelarRegistro;
begin
  inherited;

end;

procedure TfrmKernel_CadBaseDB.DepoisFechar;
begin
  inherited;

end;

procedure TfrmKernel_CadBaseDB.DepoisImprimirRegistro;
begin
 inherited;
end;

procedure TfrmKernel_CadBaseDB.DepoisNovoRegistro;
begin
  inherited;

end;

procedure TfrmKernel_CadBaseDB.DepoisSalvarRegistro;
begin
  inherited;

end;

end.
