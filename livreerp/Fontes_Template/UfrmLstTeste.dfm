inherited frmLstTeste: TfrmLstTeste
  Caption = 'frmLstTeste'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltro: TRzPanel
    Height = 53
    Visible = True
    ExplicitHeight = 53
  end
  inherited cxgrdLst_Base: TcxGrid
    Top = 121
    Height = 382
    ExplicitTop = 121
    ExplicitHeight = 382
  end
  inherited RzToolbar1: TRzToolbar
    ToolbarControls = (
      btnNovo
      btnAlterar
      btnImprimir
      btnFechar)
    inherited btnImprimir: TRzToolButton
      Left = 185
      ExplicitLeft = 185
    end
    inherited btnFechar: TRzToolButton
      Left = 281
      ExplicitLeft = 281
    end
  end
  inherited cxspyBase: TcxStyleRepository
    inherited GridTableViewStyleSheetUserFormat2: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
end
