inherited frmKernel_CadBaseDB: TfrmKernel_CadBaseDB
  Caption = 'frmKernel_CadBaseDB'
  ClientHeight = 435
  ClientWidth = 740
  ExplicitWidth = 746
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcntrlcadastro: TcxPageControl
    Width = 740
    Height = 314
    ExplicitWidth = 740
    ExplicitHeight = 314
    ClientRectBottom = 314
    ClientRectRight = 740
    inherited tbshtDados: TcxTabSheet
      ExplicitWidth = 740
      ExplicitHeight = 295
      inherited pnlIdentificacao: TRzPanel
        Width = 740
        Height = 295
        ExplicitWidth = 740
        ExplicitHeight = 295
        DesignSize = (
          740
          295)
        inherited lblAtalhoF5: TLabel
          Left = 321
          ExplicitLeft = 321
        end
        inherited lblCamposObrigatorio: TLabel
          Left = 445
          Top = 282
          ExplicitLeft = 445
          ExplicitTop = 282
        end
      end
    end
  end
  inherited PnlTitulo: TRzPanel
    Width = 740
    ExplicitWidth = 740
    DesignSize = (
      740
      39)
    inherited imgCadBase: TImage
      ExplicitHeight = 32
    end
    inherited Label11: TLabel
      Left = 439
      ExplicitLeft = 439
    end
    inherited DBlcbCadastros: TcxDBLookupComboBox
      Left = 530
      ExplicitLeft = 530
    end
  end
  inherited RzToolbar1: TRzToolbar
    Width = 740
    ExplicitWidth = 740
    ToolbarControls = (
      btnNovo
      btnAlterar
      btnImprimir
      RzSpacer1)
    inherited btnImprimir: TRzToolButton
      Left = 171
      ExplicitLeft = 171
    end
    inherited RzSpacer1: TRzSpacer
      Left = 260
      ExplicitLeft = 260
    end
  end
  inherited rzstsbrStatus: TRzStatusBar
    Top = 416
    Width = 740
    ExplicitTop = 416
    ExplicitWidth = 740
  end
  inherited RzPanel1: TRzPanel
    Top = 382
    Width = 740
    ExplicitTop = 382
    ExplicitWidth = 740
    DesignSize = (
      740
      34)
    inherited btnCancelarK: TJvXPButton
      Left = 563
      ExplicitLeft = 563
    end
    inherited btnFecharK: TJvXPButton
      Left = 652
      ExplicitLeft = 652
    end
    inherited btnSalvarK: TJvXPButton
      Left = 483
      ExplicitLeft = 483
    end
  end
  inherited imglPageBase: TImageList
    Left = 272
  end
  inherited ilCadBase: TImageList
    Left = 336
  end
  inherited actlstCadBaseUser: TActionList
    Left = 408
  end
  inherited ilCadBaseUser: TImageList
    Left = 480
  end
end
