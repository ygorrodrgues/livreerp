inherited frmKernel_CadItemColunas: TfrmKernel_CadItemColunas
  Caption = 'frmKernel_CadItemColunas'
  ClientHeight = 356
  ClientWidth = 602
  OnShow = FormShow
  ExplicitWidth = 608
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel1: TRzPanel
    Top = 324
    Width = 602
    ExplicitTop = 324
    ExplicitWidth = 602
    inherited JvXPButton1: TJvXPButton
      Left = 409
      ExplicitLeft = 409
    end
    inherited JvXPButton2: TJvXPButton
      Left = 504
      ExplicitLeft = 504
    end
  end
  inherited RzPanel2: TRzPanel
    Width = 602
    ExplicitWidth = 602
  end
  inherited RzPanel3: TRzPanel
    Width = 602
    Height = 259
    ExplicitWidth = 602
    ExplicitHeight = 259
    object Label1: TLabel
      Left = 11
      Top = 6
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
      FocusControl = dbedtCLN_COLUNA
    end
    object Label2: TLabel
      Left = 11
      Top = 48
      Width = 82
      Height = 13
      Caption = 'Nome do Campo:'
      FocusControl = dbedtCLN_NOME
    end
    object Label4: TLabel
      Left = 12
      Top = 91
      Width = 96
      Height = 13
      Caption = 'Tipo de Totaliza'#231#227'o:'
      FocusControl = dbedtCLN_NOME
    end
    object Label5: TLabel
      Left = 208
      Top = 91
      Width = 77
      Height = 13
      Caption = 'Nome Amigavel:'
      FocusControl = dbedtCLN_NOME_AMIGAVEL
    end
    object Label6: TLabel
      Left = 258
      Top = 48
      Width = 99
      Height = 13
      Caption = 'Tamanho da Coluna:'
      FocusControl = dbedtCLN_TAMANHO
    end
    object Label3: TLabel
      Left = 395
      Top = 45
      Width = 66
      Height = 13
      Caption = 'Titulo Coluna:'
      FocusControl = dbedtCLN_CAPTION
    end
    object dbedtCLN_COLUNA: TDBEdit
      Left = 11
      Top = 22
      Width = 134
      Height = 21
      TabStop = False
      DataField = 'CLN_COLUNA'
      DataSource = dsBase
      ReadOnly = True
      TabOrder = 0
    end
    object dbedtCLN_NOME: TDBEdit
      Left = 11
      Top = 64
      Width = 246
      Height = 21
      DataField = 'CLN_NOME'
      DataSource = dsBase
      TabOrder = 1
    end
    object dbchkCLN_FILTRA: TDBCheckBox
      Left = 13
      Top = 149
      Width = 91
      Height = 17
      Caption = 'Filtra Colunas'
      DataField = 'CLN_FILTRA'
      DataSource = dsBase
      TabOrder = 6
      ValueChecked = 'T'
      ValueUnchecked = 'F'
    end
    object dbchkCLN_SOMA: TDBCheckBox
      Left = 100
      Top = 150
      Width = 91
      Height = 16
      Caption = 'Soma Coluna'
      DataField = 'CLN_SOMA'
      DataSource = dsBase
      TabOrder = 7
      ValueChecked = 'T'
      ValueUnchecked = 'F'
    end
    object dbedtCLN_NOME_AMIGAVEL: TDBEdit
      Left = 208
      Top = 110
      Width = 201
      Height = 21
      DataField = 'CLN_NOME_AMIGAVEL'
      DataSource = dsBase
      TabOrder = 5
    end
    object dbedtCLN_TAMANHO: TDBEdit
      Left = 258
      Top = 64
      Width = 134
      Height = 21
      DataField = 'CLN_TAMANHO'
      DataSource = dsBase
      TabOrder = 2
    end
    object dbchkCLN_CHAVE: TDBCheckBox
      Left = 195
      Top = 150
      Width = 97
      Height = 16
      Caption = 'Campo Chave'
      DataField = 'CLN_CHAVE'
      DataSource = dsBase
      TabOrder = 8
      ValueChecked = 'T'
      ValueUnchecked = 'F'
    end
    object dbcbbSMA_SOMA: TcxDBLookupComboBox
      Left = 12
      Top = 110
      DataBinding.DataField = 'SMA_SOMA'
      DataBinding.DataSource = dsBase
      Properties.KeyFieldNames = 'SMA_SOMA'
      Properties.ListColumns = <
        item
          FieldName = 'SMA_NOME'
        end>
      Properties.ListSource = dsLstSoma
      TabOrder = 4
      Width = 190
    end
    object dbedtCLN_CAPTION: TDBEdit
      Left = 395
      Top = 64
      Width = 201
      Height = 21
      DataField = 'CLN_CAPTION'
      DataSource = dsBase
      TabOrder = 3
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 602
    ExplicitWidth = 602
    inherited Label11: TLabel
      Left = 244
      ExplicitLeft = 244
    end
    inherited SpeedButton1: TSpeedButton
      Left = 575
      ExplicitLeft = 575
    end
    inherited cbbCadAuxiliar: TComboBox
      Left = 381
      ExplicitLeft = 381
    end
  end
  inherited dsBase: TDataSource
    DataSet = dmKernel_Colunas.cdsCadItem
    Left = 344
  end
  object dsLstSoma: TDataSource
    DataSet = dmKernel_Colunas.CdsLstSoma
    Left = 464
  end
end
