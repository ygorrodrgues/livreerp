inherited frmKernel_CadUsuario: TfrmKernel_CadUsuario
  Caption = 'frmKernel_CadUsuario'
  ClientHeight = 510
  ClientWidth = 557
  ExplicitWidth = 563
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcntrlcadastro: TcxPageControl
    Width = 557
    Height = 389
    ExplicitWidth = 557
    ExplicitHeight = 389
    ClientRectBottom = 389
    ClientRectRight = 557
    inherited tbshtDados: TcxTabSheet
      ExplicitWidth = 557
      ExplicitHeight = 370
      inherited pnlIdentificacao: TRzPanel
        Width = 557
        Height = 370
        ExplicitWidth = 557
        ExplicitHeight = 370
        inherited lblAtalhoF5: TLabel
          Left = 138
          ExplicitLeft = 138
        end
        inherited lblCamposObrigatorio: TLabel
          Left = 262
          Top = 357
          ExplicitLeft = 262
          ExplicitTop = 357
        end
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 37
          Height = 13
          Caption = 'C'#243'digo:'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 16
          Top = 64
          Width = 79
          Height = 13
          Caption = 'Nome Completo:'
          FocusControl = dbedtNOMEUSU
        end
        object Label3: TLabel
          Left = 200
          Top = 120
          Width = 28
          Height = 13
          Caption = 'Perfil:'
          FocusControl = dbedtNOMEUSU
        end
        object Label4: TLabel
          Left = 319
          Top = 64
          Width = 81
          Height = 13
          Caption = 'Login de Acesso:'
          FocusControl = dbedtLOGINUSU
        end
        object Label5: TLabel
          Left = 16
          Top = 120
          Width = 74
          Height = 13
          Caption = 'Senha Secreta:'
          FocusControl = dbedtSENHAUSU
        end
        object Label8: TLabel
          Left = 171
          Top = 177
          Width = 88
          Height = 13
          Caption = 'Data de Expira'#231#227'o'
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 35
          Width = 134
          Height = 21
          TabStop = False
          DataField = 'CODUSU'
          DataSource = dsBase
          TabOrder = 0
        end
        object dbedtNOMEUSU: TDBEdit
          Left = 16
          Top = 80
          Width = 297
          Height = 21
          DataField = 'NOMEUSU'
          DataSource = dsBase
          TabOrder = 1
          OnKeyPress = dbedtNOMEUSUKeyPress
        end
        object dblcbCODPERFIL: TcxDBLookupComboBox
          Left = 200
          Top = 136
          DataBinding.DataField = 'CODPERFIL'
          DataBinding.DataSource = dsBase
          Properties.KeyFieldNames = 'CODPERFIL'
          Properties.ListColumns = <
            item
              FieldName = 'CODPERFIL'
            end
            item
              FieldName = 'NOMEPERFIL'
            end>
          Properties.ListFieldIndex = 1
          Properties.ListSource = dmKernel_CadUsuario.dsPerfil
          TabOrder = 4
          OnKeyPress = dbedtNOMEUSUKeyPress
          Width = 178
        end
        object dbedtLOGINUSU: TDBEdit
          Left = 319
          Top = 80
          Width = 205
          Height = 21
          DataField = 'LOGINUSU'
          DataSource = dsBase
          TabOrder = 2
          OnKeyPress = dbedtNOMEUSUKeyPress
        end
        object dbedtSENHAUSU: TDBEdit
          Left = 16
          Top = 136
          Width = 161
          Height = 21
          DataField = 'SENHAUSU'
          DataSource = dsBase
          PasswordChar = '*'
          TabOrder = 3
          OnKeyPress = dbedtNOMEUSUKeyPress
        end
        object DBCheckBox1: TDBCheckBox
          Left = 404
          Top = 138
          Width = 97
          Height = 17
          Caption = 'Administrador'
          DataField = 'PRIVADMUSU'
          DataSource = dsBase
          TabOrder = 5
          ValueChecked = 'T'
          ValueUnchecked = 'F'
          OnKeyPress = dbedtNOMEUSUKeyPress
        end
        object dbedtDTEXPIRAUSU: TJvDBMaskEdit
          Left = 171
          Top = 194
          Width = 115
          Height = 21
          DataField = 'DTEXPIRAUSU'
          DataSource = dsBase
          MaxLength = 8
          TabOrder = 7
          EditMask = '!99/99/00;1;_'
          OnKeyPress = dbedtNOMEUSUKeyPress
        end
        object dbchkEXPIRASENHAUSU: TDBCheckBox
          Left = 16
          Top = 196
          Width = 149
          Height = 14
          Caption = 'Senha do usu'#225'rio Expira ?'
          DataField = 'EXPIRASENHAUSU'
          DataSource = dsBase
          TabOrder = 6
          ValueChecked = 'T'
          ValueUnchecked = 'F'
          OnKeyPress = dbedtNOMEUSUKeyPress
        end
      end
    end
  end
  inherited PnlTitulo: TRzPanel
    Width = 557
    ExplicitWidth = 557
    inherited Label11: TLabel
      Left = 256
      ExplicitLeft = 256
    end
    inherited DBlcbCadastros: TcxDBLookupComboBox
      Left = 347
      ExplicitLeft = 347
    end
  end
  inherited RzToolbar1: TRzToolbar
    Width = 557
    ExplicitWidth = 557
    ToolbarControls = (
      btnNovo
      btnAlterar
      btnImprimir
      RzSpacer1)
  end
  inherited rzstsbrStatus: TRzStatusBar
    Top = 491
    Width = 557
    ExplicitTop = 491
    ExplicitWidth = 557
  end
  inherited RzPanel1: TRzPanel
    Top = 457
    Width = 557
    ExplicitTop = 457
    ExplicitWidth = 557
    inherited btnCancelarK: TJvXPButton
      Left = 380
      ExplicitLeft = 380
    end
    inherited btnFecharK: TJvXPButton
      Left = 469
      ExplicitLeft = 469
    end
    inherited btnSalvarK: TJvXPButton
      Left = 300
      ExplicitLeft = 300
    end
  end
  inherited dsBase: TDataSource
    DataSet = dmKernel_CadUsuario.cdsCadBase
  end
end
