unit UfrmKernel_Aguarde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Gauges, jpeg, ExtCtrls, UfrmKernel_Base;

type
  TfrmKernel_Aguarde = class(TfrmKernel_Base)
    pnlCenter: TPanel;
    ProgramIcon: TImage;
    lblAGUARDE: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKernel_Aguarde: TfrmKernel_Aguarde;

implementation

uses UKernel_Mensagem, UKernel_SysUtils, UKernel_VariaveisPublic;

{$R *.dfm}

procedure TfrmKernel_Aguarde.FormCreate(Sender: TObject);
begin
  kernel_str_form := 'Aguardem';
  inherited;

end;

end.
