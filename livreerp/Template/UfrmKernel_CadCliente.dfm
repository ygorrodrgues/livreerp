inherited frmKernel_CadCliente: TfrmKernel_CadCliente
  Caption = 'frmKernel_CadCliente'
  ClientHeight = 519
  ClientWidth = 681
  ExplicitWidth = 687
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcntrlcadastro: TcxPageControl
    Width = 681
    Height = 398
    ExplicitWidth = 770
    ExplicitHeight = 398
    ClientRectBottom = 398
    ClientRectRight = 681
    inherited cxTabSheet1: TcxTabSheet
      ExplicitWidth = 770
      ExplicitHeight = 379
      inherited pnlIdentificacao: TRzPanel
        Width = 681
        Height = 379
        ExplicitWidth = 770
        ExplicitHeight = 379
        inherited lblAtalhoF5: TLabel
          Left = 165
        end
        inherited lblCamposObrigatorio: TLabel
          Left = 295
        end
      end
    end
  end
  inherited PnlTitulo: TRzPanel
    Width = 681
    ExplicitWidth = 770
    inherited Label11: TLabel
      Left = 380
      ExplicitLeft = 469
    end
    inherited DBlcbCadastros: TcxDBLookupComboBox
      Left = 471
      ExplicitLeft = 560
    end
  end
  inherited RzToolbar1: TRzToolbar
    Width = 681
    ExplicitWidth = 770
    ToolbarControls = (
      btnNovo
      btnAlterar
      btnImprimir)
  end
  inherited RzStatusBar1: TRzStatusBar
    Top = 500
    Width = 681
    ExplicitTop = 500
    ExplicitWidth = 770
  end
  inherited RzPanel1: TRzPanel
    Top = 466
    Width = 681
  end
  inherited actlstCadBaseUser: TActionList
    Left = 328
    Top = 2
  end
  inherited ImageList1: TImageList
    Left = 360
    Top = 2
  end
end
