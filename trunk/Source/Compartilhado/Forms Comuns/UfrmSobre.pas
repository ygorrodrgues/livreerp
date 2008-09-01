{*******************************************************}
{                                                       }
{       SUPRIM                                          }
{                                                       }
{       Copyright (C) 2007 SACI Soluções                 }
{                                                       }
{*******************************************************}
unit UfrmSobre;

interface

uses
  Windows, UfrmBase, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, ComCtrls;

type
  TfrmSobre = class(TfrmBase)
    Panel1: TPanel;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnlEmpresa: TPanel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblempresa: TLabel;
    lblCodigo: TLabel;
    lblChave: TLabel;
    Panel3: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    mmoMembros: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses UVariaveisGerais;

{$R *.dfm}

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  strnomeform := 'Sobre - Livre ERP';
  inherited;

end;

end.
