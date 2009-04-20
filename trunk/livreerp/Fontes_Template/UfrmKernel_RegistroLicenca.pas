unit UfrmKernel_RegistroLicenca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmKernel_Base, ExtCtrls, StdCtrls, Buttons;

type
  TfrmKernel_RegistroLicenca = class(TfrmKernel_Base)
    Panel1: TPanel;
    imgLogo: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKernel_RegistroLicenca: TfrmKernel_RegistroLicenca;

implementation

{$R *.dfm}

end.
