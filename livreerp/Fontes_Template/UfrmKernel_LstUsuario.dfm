inherited frmKernel_LstUsuario: TfrmKernel_LstUsuario
  Caption = 'frmKernel_LstUsuario'
  ExplicitWidth = 751
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltro: TRzPanel
    Height = 60
    Visible = True
    ExplicitHeight = 60
    object Label1: TLabel
      Left = 7
      Top = 10
      Width = 87
      Height = 13
      Caption = 'C'#243'digo do Usu'#225'rio'
    end
    object Label2: TLabel
      Left = 107
      Top = 10
      Width = 81
      Height = 13
      Caption = 'Nome do Usu'#225'rio'
    end
    object Label3: TLabel
      Left = 280
      Top = 10
      Width = 79
      Height = 13
      Caption = 'Login do Usu'#225'rio'
    end
    object Label4: TLabel
      Left = 543
      Top = 10
      Width = 78
      Height = 13
      Caption = 'Perfil do Usu'#225'rio'
    end
    object edtCODUSU: TEdit
      Left = 7
      Top = 26
      Width = 94
      Height = 21
      TabOrder = 0
      OnKeyPress = edtCODUSUKeyPress
    end
    object edtNOMEUSU: TEdit
      Left = 107
      Top = 26
      Width = 168
      Height = 21
      TabOrder = 1
      OnKeyPress = edtCODUSUKeyPress
    end
    object edtLOGINUSU: TEdit
      Left = 280
      Top = 26
      Width = 257
      Height = 21
      TabOrder = 2
      OnKeyPress = edtCODUSUKeyPress
    end
    object cbbPERFILUSU: TComboBox
      Left = 543
      Top = 26
      Width = 194
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnKeyDown = cbbPERFILUSUKeyDown
    end
  end
  inherited cxgrdLst_Base: TcxGrid
    Top = 128
    Height = 375
    ExplicitTop = 128
    ExplicitHeight = 375
    inherited cxgrdLst_BaseDBTableView1: TcxGridDBTableView
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = cxgrdLst_BaseDBTableView1CODUSU
        end>
      object cxgrdLst_BaseDBTableView1CODUSU: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'CODUSU'
      end
      object cxgrdLst_BaseDBTableView1NOMEUSU: TcxGridDBColumn
        Caption = 'Nome do Usu'#225'rio'
        DataBinding.FieldName = 'NOMEUSU'
        Width = 181
      end
      object cxgrdLst_BaseDBTableView1LOGINUSU: TcxGridDBColumn
        Caption = 'Login do Usu'#225'rio'
        DataBinding.FieldName = 'LOGINUSU'
        Width = 204
      end
      object cxgrdLst_BaseDBTableView1NOMEPERFIL: TcxGridDBColumn
        Caption = 'Perfil do Usu'#225'rio'
        DataBinding.FieldName = 'NOMEPERFIL'
        Width = 211
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
