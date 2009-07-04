inherited frmKernel_LstColunas: TfrmKernel_LstColunas
  Caption = 'frmKernel_LstColunas'
  PixelsPerInch = 96
  TextHeight = 13
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
  inherited cxspyBase: TcxStyleRepository
    inherited GridTableViewStyleSheetUserFormat2: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
end
