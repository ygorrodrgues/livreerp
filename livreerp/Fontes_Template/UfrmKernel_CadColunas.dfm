inherited frmKernel_CadColunas: TfrmKernel_CadColunas
  Caption = 'frmKernel_CadColunas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcntrlcadastro: TcxPageControl
    inherited tbshtDados: TcxTabSheet
      inherited pnlIdentificacao: TRzPanel
        Height = 132
        ExplicitHeight = 132
        inherited lblCamposObrigatorio: TLabel
          Top = 111
          ExplicitTop = 111
        end
        object Label1: TLabel [3]
          Left = 10
          Top = 40
          Width = 71
          Height = 13
          Caption = 'Nome da View:'
        end
        object Label2: TLabel [4]
          Left = 223
          Top = 40
          Width = 68
          Height = 13
          Caption = 'Titulo da Tela:'
          FocusControl = dbedtTLA_TITULO
        end
        object Label3: TLabel [5]
          Left = 529
          Top = 40
          Width = 120
          Height = 13
          Caption = 'Classe Tela de Cadastro:'
          FocusControl = dbedtTLA_CLASSE
        end
        object Label4: TLabel [6]
          Left = 10
          Top = 84
          Width = 81
          Height = 13
          Caption = 'Nome da Tabela:'
          FocusControl = dbedtTLA_TABELA
        end
        inherited dbedtCODIGO: TDBEdit
          DataField = 'TLA_TELA'
        end
        object dbedtTLA_TITULO: TDBEdit
          Left = 223
          Top = 58
          Width = 300
          Height = 21
          DataField = 'TLA_TITULO'
          DataSource = dsBase
          TabOrder = 2
          OnKeyPress = dbedtTLA_NOMEKeyPress
        end
        object dbedtTLA_CLASSE: TDBEdit
          Left = 529
          Top = 56
          Width = 200
          Height = 21
          DataField = 'TLA_CLASSE'
          DataSource = dsBase
          TabOrder = 3
          OnKeyPress = dbedtTLA_NOMEKeyPress
        end
        object dbedtTLA_TABELA: TDBEdit
          Left = 10
          Top = 103
          Width = 200
          Height = 21
          DataField = 'TLA_TABELA'
          DataSource = dsBase
          TabOrder = 4
          OnKeyDown = dbedtTLA_TABELAKeyDown
        end
        object dbedtTLA_NOME: TDBEdit
          Left = 9
          Top = 57
          Width = 208
          Height = 21
          DataField = 'TLA_NOME'
          DataSource = dsBase
          TabOrder = 1
          OnKeyPress = dbedtTLA_NOMEKeyPress
        end
      end
      inherited RzToolbar2: TRzToolbar
        Top = 132
        ExplicitTop = 132
        ToolbarControls = (
          RzToolButton1
          RzToolButton2
          RzToolButton3)
      end
      inherited pnlItem: TRzPanel
        Top = 161
        ExplicitTop = 161
      end
      inherited cxgrdLst_Base: TcxGrid
        Top = 202
        Height = 144
        ExplicitTop = 202
        ExplicitHeight = 144
        inherited cxgrdLst_BaseDBTableView1: TcxGridDBTableView
          object cxgrdLst_BaseDBTableView1CLN_COLUNA: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CLN_COLUNA'
            Width = 92
          end
          object cxgrdLst_BaseDBTableView1CLN_ORDEM: TcxGridDBColumn
            Caption = 'Ordem'
            DataBinding.FieldName = 'CLN_ORDEM'
            Width = 57
          end
          object cxgrdLst_BaseDBTableView1CLN_NOME: TcxGridDBColumn
            Caption = 'Nome Campo'
            DataBinding.FieldName = 'CLN_NOME'
            Width = 98
          end
          object cxgrdLst_BaseDBTableView1TLA_TELA: TcxGridDBColumn
            DataBinding.FieldName = 'TLA_TELA'
            Visible = False
          end
          object cxgrdLst_BaseDBTableView1CLN_SOMA: TcxGridDBColumn
            DataBinding.FieldName = 'CLN_SOMA'
            Visible = False
            Width = 53
          end
          object cxgrdLst_BaseDBTableView1CLN_FILTRA: TcxGridDBColumn
            DataBinding.FieldName = 'CLN_FILTRA'
            Visible = False
          end
          object cxgrdLst_BaseDBTableView1CLN_TAMANHO: TcxGridDBColumn
            Caption = 'Tamanho'
            DataBinding.FieldName = 'CLN_TAMANHO'
          end
          object cxgrdLst_BaseDBTableView1CLN_CHAVE: TcxGridDBColumn
            DataBinding.FieldName = 'CLN_CHAVE'
            Visible = False
          end
          object cxgrdLst_BaseDBTableView1CLN_CAPTION: TcxGridDBColumn
            Caption = 'Titulo Coluna'
            DataBinding.FieldName = 'CLN_CAPTION'
            Width = 257
          end
          object cxgrdLst_BaseDBTableView1SMA_SOMA: TcxGridDBColumn
            DataBinding.FieldName = 'SMA_SOMA'
            Visible = False
          end
          object cxgrdLst_BaseDBTableView1CLN_NOME_AMIGAVEL: TcxGridDBColumn
            Caption = 'Nome Amigavel'
            DataBinding.FieldName = 'CLN_NOME_AMIGAVEL'
            Width = 176
          end
        end
      end
    end
  end
  inherited RzToolbar1: TRzToolbar
    ToolbarControls = (
      btnNovo
      btnAlterar
      btnImprimir
      RzSpacer1)
  end
  inherited imglPageBase: TImageList
    Left = 440
    Top = 186
  end
  inherited dsBaseItm: TDataSource
    DataSet = dmKernel_Colunas.cdsLstItem
  end
  inherited actlstItens: TActionList
    Left = 352
    Top = 56
  end
  inherited dsBase: TDataSource
    DataSet = dmKernel_Colunas.cdsCadBase
  end
  inherited actlstCadBaseUser: TActionList
    Left = 416
    Top = 186
  end
end
