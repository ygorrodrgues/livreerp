inherited frmLstTeste: TfrmLstTeste
  Caption = 'frmLstTeste'
  OnDestroy = FormDestroy
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
      btnSalvar
      btnCancelar
      btnImprimir
      btnFechar
      RzToolButton1)
  end
  inherited cxspyBase: TcxStyleRepository
    inherited GridTableViewStyleSheetUserFormat2: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
end
