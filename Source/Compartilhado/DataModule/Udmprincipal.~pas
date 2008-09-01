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
unit Udmprincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, udmBase, DBXpress, DB, SqlExpr, AppEvnts, XPMan;

type
  Tdmprincipal = class(TdmBase)
    conPrincipal: TSQLConnection;
  private
    { Private declarations }
  public
    procedure Conectabanco;
  end;

var
  dmprincipal: Tdmprincipal;

implementation

uses UVariaveisGerais;

{$R *.dfm}

procedure Tdmprincipal.Conectabanco;
begin
   with conPrincipal DO
    begin
     Connected := False;
      try
        Params.Clear;
        Params.Add('DriverName=MSSQL');
        Params.Add('HostName=' + strNomeServidor);
        Params.Add('DataBase=' + strNomeBanco);
        Params.Add('User_Name=sa');
        Params.Add('Password=');
        Params.Add('BlobSize=-1');
        Params.Add('ErrorResourceFile=');
        Params.Add('LocaleCode=0000');
        Params.Add('MSSQL TransIsolation=ReadCommited');
        Params.Add('OS Authentication=False');
        Params.Add('Prepare SQL=False');
        Connected := True;
      except on E: Exception do
        begin
          MessageDlg('Ocorreu um erro ao conectar-se ao banco.' + #13 +
            E.Message, mtError, [mbOk], 0);
          Application.Terminate;
        end;
      end;
    end;  
end;

end.
