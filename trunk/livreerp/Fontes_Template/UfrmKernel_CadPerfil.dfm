inherited frmKernel_CadPerfil: TfrmKernel_CadPerfil
  Caption = 'frmKernel_CadPerfil'
  ClientHeight = 398
  ClientWidth = 533
  ExplicitWidth = 539
  ExplicitHeight = 424
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcntrlcadastro: TcxPageControl
    Width = 533
    Height = 277
    ExplicitWidth = 533
    ExplicitHeight = 277
    ClientRectBottom = 277
    ClientRectRight = 533
    inherited tbshtDados: TcxTabSheet
      ExplicitWidth = 533
      ExplicitHeight = 258
      inherited pnlIdentificacao: TRzPanel
        Width = 533
        Height = 258
        ExplicitWidth = 533
        ExplicitHeight = 258
        inherited lblAtalhoF5: TLabel
          Left = 114
          ExplicitLeft = 271
        end
        inherited lblCamposObrigatorio: TLabel
          Left = 238
          Top = 245
          ExplicitLeft = 395
          ExplicitTop = 316
        end
        object Label1: TLabel
          Left = 10
          Top = 27
          Width = 75
          Height = 13
          Caption = 'C'#243'digo do Perfil'
          FocusControl = dbedtCODPERFIL
        end
        object Label2: TLabel
          Left = 10
          Top = 95
          Width = 69
          Height = 13
          Caption = 'Nome do Perfil'
          FocusControl = dbedtNOMEPERFIL
        end
        object dbedtCODPERFIL: TDBEdit
          Left = 10
          Top = 44
          Width = 134
          Height = 21
          TabStop = False
          DataField = 'CODPERFIL'
          DataSource = dsBase
          TabOrder = 0
        end
        object dbedtNOMEPERFIL: TDBEdit
          Left = 10
          Top = 111
          Width = 306
          Height = 21
          DataField = 'NOMEPERFIL'
          DataSource = dsBase
          TabOrder = 1
          OnKeyPress = dbedtNOMEPERFILKeyPress
        end
      end
    end
  end
  inherited PnlTitulo: TRzPanel
    Width = 533
    ExplicitWidth = 533
    inherited Label11: TLabel
      Left = 232
      ExplicitLeft = 389
    end
    inherited DBlcbCadastros: TcxDBLookupComboBox
      Left = 323
      ExplicitLeft = 323
    end
  end
  inherited RzToolbar1: TRzToolbar
    Width = 533
    ExplicitWidth = 533
    ToolbarControls = (
      btnNovo
      btnAlterar
      btnImprimir
      RzSpacer1)
  end
  inherited rzstsbrStatus: TRzStatusBar
    Top = 379
    Width = 533
    ExplicitTop = 379
    ExplicitWidth = 533
  end
  inherited RzPanel1: TRzPanel
    Top = 345
    Width = 533
    ExplicitTop = 345
    ExplicitWidth = 533
    inherited btnCancelarK: TJvXPButton
      Left = 356
      ExplicitLeft = 356
    end
    inherited btnFecharK: TJvXPButton
      Left = 445
      ExplicitLeft = 445
    end
    inherited btnSalvarK: TJvXPButton
      Left = 276
      ExplicitLeft = 276
    end
  end
  inherited dsBase: TDataSource
    DataSet = dmKernel_Perfil.cdsCadBase
  end
end
