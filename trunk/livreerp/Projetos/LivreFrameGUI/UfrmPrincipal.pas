unit UfrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Principal, Menus, ImgList, RzStatus, ExtCtrls, RzPanel,
  ToolWin, ActnMan, ActnCtrls, StdCtrls, dxGDIPlusClasses, jpeg, ActnList,
  RzButton;

type
  TfrmPrincipal = class(TfrmKernel_Principal)
    RzSpacer1: TRzSpacer;
    actParametro: TAction;
    Parametro1: TMenuItem;
    N1: TMenuItem;
    RzToolButton2: TRzToolButton;
    actNovoProjeto: TAction;
    NovoProjeto1: TMenuItem;
    NovoProjeto2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure actParametroExecute(Sender: TObject);
    procedure actNovoProjetoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure InicilizaFramework;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses UKernel_SysUtils, UfrmKernel_Sobre, VariaveisFramework, UKernel_Registry,
  UdmPrincipal, UfrmKernel_Mensagem, UfrmConfiguracoesProjeto, UfrmNovoProjeto,
  UfrmCadParametro;

{$R *.dfm}

procedure TfrmPrincipal.actNovoProjetoExecute(Sender: TObject);
begin
  inherited;
  Kernel_AbreForm(TfrmNovoProjeto,frmNovoProjeto);
end;

procedure TfrmPrincipal.actParametroExecute(Sender: TObject);
begin
  inherited;
  Kernel_AbreForm(TfrmCadParametro,frmCadParametro);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  InicilizaFramework;
end;

procedure TfrmPrincipal.InicilizaFramework;
begin
  //
end;

end.
