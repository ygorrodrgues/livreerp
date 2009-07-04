inherited frmKernel_LstColunas: TfrmKernel_LstColunas
  Caption = 'frmKernel_LstColunas'
  ExplicitWidth = 751
  ExplicitHeight = 554
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxgrdLst_Base: TcxGrid
    ExplicitLeft = 0
    ExplicitTop = 155
    ExplicitWidth = 745
    ExplicitHeight = 348
  end
  inherited RzToolbar1: TRzToolbar
    ToolbarControls = (
      btnNovo
      btnAlterar
      btnExcluir
      RzSpacer1
      btnImprimir
      RzSpacer2
      btnFiltrar
      RzSpacer3
      btnFechar)
  end
  inherited pnlFiltraCampos: TRzPanel
    inherited edtValor: TEdit
      OnKeyDown = nil
      OnKeyPress = nil
    end
  end
  inherited pnlFiltro: TRzPanel
    ExplicitTop = 100
  end
  inherited cxspyBase: TcxStyleRepository
    inherited GridTableViewStyleSheetUserFormat2: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
end
