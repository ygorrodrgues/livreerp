{*******************************************************}
{                                                       }
{       SUPRIM                                          }
{                                                       }
{       Copyright (C) 2007 SACI Soluções                 }
{                                                       }
{*******************************************************}
unit UfrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, pngextra, pngimage, DBTables, ComCtrls,
  jpeg, adodb;

type
  TfrmLogin = class(TForm)
    edtPSW: TEdit;
    Label3: TLabel;
    edtNOMFUN: TEdit;
    Label2: TLabel;
    imgLogo: TImage;
    Label4: TLabel;
    Label5: TLabel;
    statBase: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure edtPSWKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PNGButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNOMFUNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
     procedure validaUsuario(const usuario, senha: string);
     procedure VerificaDados;
     function QuantidadeTentativas: Integer;
     function IndexOfPos(Lista : TStrings; S: string; SomenteInicio : Boolean): Integer;
  public
    CodUsu :integer;
    NomeUsu : string;
    Admin, ExpiraUsu  : string[1];
    DataExpUsu : TDate; // Date por que não existe uma hora para expirar
    Tentativas, LimiteTentativas : Integer; // Numero de Tentativa para logar
    DiasUties : Integer;
  end;

var
  frmLogin: TfrmLogin;
  //nomeusuario: string;

implementation

uses UdmPrincipal, DB, UfrmMensagem, UMensagem, UFuncoesDATA, USecurity,
  UVariaveisGerais, UDBFuncoes,  UFuncoesX, SqlExpr;

{$R *.dfm}

{ TfrmLogin }

procedure TfrmLogin.validaUsuario(const usuario, senha: string);
begin
  with dmPrincipal.cdsAux2 do
  begin
    if Tentativas < LimiteTentativas then
      begin
        inc(Tentativas);

        close;
        CommandText :='';
        {Seleciona os campos na tabela onde o usuario e senha sejam igual
        aos passados nos edits.}
        CommandText := 'SELECT CODUSU, NOMEUSU, EXPIRASENHAUSU, DTEXPIRAUSU, PRIVADMUSU ' +
                   '  FROM USUARIO ' +
                   ' WHERE LOGINUSU = ' + QuotedStr(usuario) +
                   '   AND SENHAACESSO = ' + QuotedStr( senha);
        Open;

        if not IsEmpty then // Se não retornar vazio
          Begin
            Codusu        :=  Fields[0].AsInteger;
            NomeUsu       :=  Fields[1].AsString;
            ExpiraUsu     :=  Fields[2].AsString;
            DataExpUsu    :=  Fields[3].AsDateTime;
            admin         :=  Fields[4].AsString;

            if not (Admin = 'T') then // se não for admin
              Begin
                if ExpiraUsu= 'T' then // se o usuario expira
                  Begin
                    if DataExpUsu > Date  then // se a data e maior qe o dia atual
                      DiasUties :=  StrToInt(DifDias(DataExpUsu,Date))
                     else
                      begin
                        if DataExpUsu < Date  then // Verifica se a date e menor que a de Expiração
                          begin
                            TfrmMensagem.Mensagem(' Senha Expirada ! '  +#13#10+
                                                 '  - Seu acesso ao Sistema está Bloqueado '  +#13#10+
                                                 ' - Em caso de Dúvida entre em Contato ' +#13#10+                                                 
                                                 '  - Administrador do Sistema ' ,'E',[mbOK]);
                            Application.Terminate; // Termina Aplicação
                          end;
                      end;
                  end
                 else // Se o usuário não expira abre
                  ModalResult   :=  mrok;
          end
         else // se for admin entra
          ModalResult   :=  mrok;
       end
     else
       Begin
         TfrmMensagem.Mensagem('Usuário ou Senha Inválidos ' +#13#10+
                               ' - Tentativa '+ IntToStr(Tentativas) + ' de ' +  IntToStr(LimiteTentativas) ,'E',[mbOK]);
         statBase.Panels[3].Text := IntToStr(Tentativas);
         edtNOMFUN.SetFocus;
       end;
   end
  else
   begin
     TfrmMensagem.Mensagem('Limite de Tentativas Execido ' +#13#10+
                           ' - Em caso de Dúvida entre em Contato ' +#13#10+
                           ' - Administrador do Sistema ' ,'E',[mbOK]);
     Application.Terminate; // Termina Aplicação
   end; 
  end;
end;

{-------------------------------------------------------------------------------
  Procedure: TfrmLogin.VerificaDados
  Author:    Administrador
  DateTime:  2007.08.16
  Arguments: None
  Result:    None
-------------------------------------------------------------------------------}
procedure TfrmLogin.VerificaDados;
begin
if edtNOMFUN.Text = '' then
  Begin
    TfrmMensagem.Mensagem('Informe o usuário' ,'E',[mbOK]);
    edtNOMFUN.SetFocus;
    exit;
  end;

  if edtPSW.Text = '' then
  Begin
    TfrmMensagem.Mensagem('Informe a Senha' ,'E',[mbOK]);
    edtPSW.SetFocus;
    exit;
  end;
  validaUsuario(AnsiUpperCase(edtNOMFUN.Text), edtPSW.Text);
end;

procedure TfrmLogin.edtPSWKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key= vk_return then VerificaDados;
end;

procedure TfrmLogin.PNGButton1Click(Sender: TObject);
begin
  Application.Terminate;
end;

function TfrmLogin.QuantidadeTentativas: Integer;
var
  Qry:TsqlQuery;
begin
  qry := TsqlQuery.Create(nil); {: cria uma instância do objeto}
  try
    Qry.sqlConnection:= dmPrincipal.convap; {: componente de conexão}
    Qry.close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT QTDTentParam from parametrosistema');
    Qry.Open;

    result := qry.FieldByName('QTDTentParam').asinteger;

  finally
    FreeAndNil(Qry);  {: libera o objeto da memória}
  end;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
 str : TStringList;
begin
  // Mostra a Quantidade de Tentativas
  statBase.Panels[1].Text := IntToStr(QuantidadeTentativas);
  Tentativas              := 0;
  LimiteTentativas        := QuantidadeTentativas;
  statBase.Panels[3].Text := IntToStr(LimiteTentativas);
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  MostraFotoImage('LogoSoftHouse','LogoSoftHouse',imgLogo);
  edtNOMFUN.SetFocus;
end;

function TfrmLogin.IndexOfPos(Lista: TStrings; S: string;
  SomenteInicio: Boolean): Integer;
var
  Temp : string;
  I : Integer;
begin
  S := UpperCase(S);
  I := Length(S);
  for Result := 0 to Lista.Count - 1 do
  begin
    Temp := UpperCase(Lista[Result]); // item atual em maisculo
    if SomenteInicio then // se for true
    begin
      if S = Copy(Temp, 1, I) then  // se o 
        Exit;
    end else
      if Pos(S, Temp) > 0 then
        Exit;
  end;
  Result := -1; 
end;

procedure TfrmLogin.edtNOMFUNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then edtPSW.SetFocus;
end;

end.
