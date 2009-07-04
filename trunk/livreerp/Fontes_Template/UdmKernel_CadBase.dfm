inherited dmKernel_CadBase: TdmKernel_CadBase
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 400
  Width = 489
  object qryCadBase: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      '')
    SQLConnection = dmPrincipal.conPrincipalKernel
    Left = 64
    Top = 32
  end
  object qryLstBase: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.conPrincipalKernel
    Left = 64
    Top = 96
  end
  object dspCadBase: TDataSetProvider
    DataSet = qryCadBase
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspCadBaseAfterUpdateRecord
    Left = 168
    Top = 32
  end
  object dspLstBase: TDataSetProvider
    DataSet = qryLstBase
    Left = 168
    Top = 88
  end
  object cdsCadBase: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadBase'
    AfterInsert = cdsCadBaseAfterInsert
    BeforePost = cdsCadBaseBeforePost
    Left = 272
    Top = 32
  end
  object cdsLstBase: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLstBase'
    Left = 272
    Top = 88
  end
  object cdsLstColunas: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT * FROM VW_LST_COLUNAS'#13#10'WHERE TLA_NOME=:TLS_NOME_TELA'#13#10'ORD' +
      'ER BY CLN_ORDEM'#13#10
    Params = <
      item
        DataType = ftString
        Name = 'TLS_NOME_TELA'
        ParamType = ptInput
      end>
    ProviderName = 'dspLstAux'
    Left = 280
    Top = 152
    object cdsLstColunasTLA_TELA: TIntegerField
      FieldName = 'TLA_TELA'
      Required = True
    end
    object cdsLstColunasTLA_NOME: TStringField
      FieldName = 'TLA_NOME'
      Size = 100
    end
    object cdsLstColunasTLA_TITULO: TStringField
      FieldName = 'TLA_TITULO'
      Size = 100
    end
    object cdsLstColunasTLA_CLASSE: TStringField
      FieldName = 'TLA_CLASSE'
      Size = 100
    end
    object cdsLstColunasCLN_COLUNA: TIntegerField
      FieldName = 'CLN_COLUNA'
      Required = True
    end
    object cdsLstColunasCLN_NOME: TStringField
      FieldName = 'CLN_NOME'
      Size = 100
    end
    object cdsLstColunasCLN_SOMA: TStringField
      FieldName = 'CLN_SOMA'
      FixedChar = True
      Size = 1
    end
    object cdsLstColunasCLN_FILTRA: TStringField
      FieldName = 'CLN_FILTRA'
      FixedChar = True
      Size = 1
    end
    object cdsLstColunasCLN_TAMANHO: TIntegerField
      FieldName = 'CLN_TAMANHO'
    end
    object cdsLstColunasCLN_ORDEM: TIntegerField
      FieldName = 'CLN_ORDEM'
    end
    object cdsLstColunasCLN_CHAVE: TStringField
      FieldName = 'CLN_CHAVE'
      FixedChar = True
      Size = 1
    end
    object cdsLstColunasSMA_NOME: TStringField
      FieldName = 'SMA_NOME'
      Size = 100
    end
    object cdsLstColunasSMA_SOMA: TIntegerField
      FieldName = 'SMA_SOMA'
      Required = True
    end
    object cdsLstColunasCLN_CAPTION: TStringField
      FieldName = 'CLN_CAPTION'
      Size = 100
    end
    object cdsLstColunasCLN_NOME_AMIGAVEL: TStringField
      FieldName = 'CLN_NOME_AMIGAVEL'
      Size = 100
    end
  end
  object qryLstAux: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'TLS_NOME_TELA'
        ParamType = ptInput
      end>
    SQLConnection = dmPrincipal.conPrincipalKernel
    Left = 56
    Top = 160
  end
  object dspLstAux: TDataSetProvider
    DataSet = qryLstAux
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 176
    Top = 160
  end
  object cdsLstTabela: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    CommandText = 
      'SELECT T.TLA_TELA, T.TLA_TABELA, T.TLA_TITULO, T.TLA_CLASSE, C.C' +
      'LN_NOME FROM TLS_COLUNA C, TLS_TELA T'#13#10'  WHERE C.TLA_TELA=T.TLA_' +
      'TELA AND C.CLN_CHAVE='#39'T'#39' AND T.TLA_TELA=:TLA_TELA'
    Params = <
      item
        DataType = ftInteger
        Name = 'TLA_TELA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspLstAux'
    Left = 280
    Top = 208
    object cdsLstTabelaTLA_TELA: TIntegerField
      FieldName = 'TLA_TELA'
      Required = True
    end
    object cdsLstTabelaTLA_TABELA: TStringField
      FieldName = 'TLA_TABELA'
      Size = 100
    end
    object cdsLstTabelaTLA_TITULO: TStringField
      FieldName = 'TLA_TITULO'
      Size = 100
    end
    object cdsLstTabelaTLA_CLASSE: TStringField
      FieldName = 'TLA_CLASSE'
      Size = 100
    end
    object cdsLstTabelaCLN_NOME: TStringField
      FieldName = 'CLN_NOME'
      Size = 100
    end
  end
end
