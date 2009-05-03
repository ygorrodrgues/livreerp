inherited frmCadParametro: TfrmCadParametro
  Caption = 'frmCadParametro'
  ClientHeight = 380
  ClientWidth = 658
  ExplicitWidth = 666
  ExplicitHeight = 414
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    Width = 658
    Height = 311
    ExplicitWidth = 658
    ExplicitHeight = 227
    ClientRectBottom = 311
    ClientRectRight = 658
    inherited tbshtDadosBasicos: TcxTabSheet
      ExplicitTop = 24
      ExplicitWidth = 658
      ExplicitHeight = 203
      object Label1: TLabel
        Left = 24
        Top = 32
        Width = 84
        Height = 13
        Caption = 'PASTA_PROJETO'
        FocusControl = dbedtPASTA_PROJETO
      end
      object Label2: TLabel
        Left = 24
        Top = 104
        Width = 102
        Height = 13
        Caption = 'TEMPLATE_PROJETO'
        FocusControl = dbedtTEMPLATE_PROJETO
      end
      object dbedtPASTA_PROJETO: TDBEdit
        Left = 24
        Top = 48
        Width = 500
        Height = 21
        DataField = 'PASTA_PROJETO'
        DataSource = dsBase
        TabOrder = 0
      end
      object dbedtTEMPLATE_PROJETO: TDBEdit
        Left = 24
        Top = 120
        Width = 500
        Height = 21
        DataField = 'TEMPLATE_PROJETO'
        DataSource = dsBase
        TabOrder = 1
      end
    end
  end
  inherited RzPanel1: TRzPanel
    Width = 658
    ExplicitWidth = 658
    inherited lblCadAuxiliar: TLabel
      Left = 300
      Top = 15
      ExplicitLeft = 300
      ExplicitTop = 15
    end
    inherited btnAbrirCadAuxiliar: TJvSpeedButton
      Left = 630
      Top = 8
      ExplicitLeft = 630
      ExplicitTop = 8
    end
    inherited cbbCadAuxiliar: TComboBox
      Left = 436
      Top = 11
      ExplicitLeft = 436
      ExplicitTop = 11
    end
  end
  inherited RzPanel2: TRzPanel
    Top = 349
    Width = 658
    ExplicitTop = 265
    ExplicitWidth = 658
    inherited btnSalvar: TJvXPButton
      Left = 480
      Top = 5
      ExplicitLeft = 480
      ExplicitTop = 5
    end
    inherited btnCancelar: TJvXPButton
      Left = 568
      Top = 5
      ExplicitLeft = 568
      ExplicitTop = 5
    end
  end
  object slcDtyParametro: TJvSelectDirectory [5]
    Left = 344
    Top = 232
  end
  inherited dsBase: TDataSource
    DataSet = dmParametro.cdsCadBase
  end
end
