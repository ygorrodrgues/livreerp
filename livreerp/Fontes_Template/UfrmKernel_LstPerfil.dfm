inherited frmKernel_LstPerfil: TfrmKernel_LstPerfil
  Caption = 'frmKernel_LstPerfil'
  ExplicitWidth = 751
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltro: TRzPanel
    Visible = True
    object Label1: TLabel
      Left = 12
      Top = 10
      Width = 75
      Height = 13
      Caption = 'C'#243'digo do Perfil'
    end
    object Label2: TLabel
      Left = 172
      Top = 10
      Width = 69
      Height = 13
      Caption = 'Nome do Perfil'
    end
    object edtCODPERFIL: TEdit
      Left = 12
      Top = 26
      Width = 131
      Height = 21
      TabOrder = 0
      OnKeyPress = edtCODPERFILKeyPress
    end
    object edtNOMEPERFIL: TEdit
      Left = 172
      Top = 26
      Width = 178
      Height = 21
      TabOrder = 1
      OnKeyDown = edtNOMEPERFILKeyDown
    end
  end
  inherited cxgrdLst_Base: TcxGrid
    ExplicitTop = 123
    ExplicitHeight = 380
    inherited cxgrdLst_BaseDBTableView1: TcxGridDBTableView
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = cxgrdLst_BaseDBTableView1CODPERFIL
        end>
      object cxgrdLst_BaseDBTableView1CODPERFIL: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'CODPERFIL'
        Width = 60
      end
      object cxgrdLst_BaseDBTableView1NOMEPERFIL: TcxGridDBColumn
        Caption = 'Nome do Perfil'
        DataBinding.FieldName = 'NOMEPERFIL'
        Width = 399
      end
    end
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
  inherited cxspyBase: TcxStyleRepository
    inherited GridTableViewStyleSheetUserFormat2: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
end
