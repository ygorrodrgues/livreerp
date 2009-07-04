inherited dmKernel_Colunas: TdmKernel_Colunas
  inherited qryCadBase: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'TLA_TELA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM TLS_TELA WHERE TLA_TELA=:TLA_TELA')
    object qryCadBaseTLA_TELA: TIntegerField
      FieldName = 'TLA_TELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadBaseTLA_NOME: TStringField
      FieldName = 'TLA_NOME'
      Size = 100
    end
    object qryCadBaseTLA_TITULO: TStringField
      FieldName = 'TLA_TITULO'
      Size = 100
    end
    object qryCadBaseTLA_CLASSE: TStringField
      FieldName = 'TLA_CLASSE'
      Size = 100
    end
    object qryCadBaseTLA_TABELA: TStringField
      FieldName = 'TLA_TABELA'
      Size = 100
    end
  end
  inherited qryLstBase: TSQLQuery
    SQL.Strings = (
      'SELECT * FROM VAP_VW_LST_TELAS')
    Top = 88
    object qryLstBaseTLA_TELA: TIntegerField
      FieldName = 'TLA_TELA'
      Required = True
    end
    object qryLstBaseTLA_NOME: TStringField
      FieldName = 'TLA_NOME'
      Size = 100
    end
    object qryLstBaseTLA_TITULO: TStringField
      FieldName = 'TLA_TITULO'
      Size = 100
    end
    object qryLstBaseTLA_CLASSE: TStringField
      FieldName = 'TLA_CLASSE'
      Size = 100
    end
  end
  inherited cdsCadBase: TClientDataSet
    Active = True
    Params = <
      item
        DataType = ftInteger
        Name = 'TLA_TELA'
        ParamType = ptInput
      end>
    object cdsCadBaseTLA_TELA: TIntegerField
      FieldName = 'TLA_TELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCadBaseTLA_NOME: TStringField
      FieldName = 'TLA_NOME'
      Size = 100
    end
    object cdsCadBaseTLA_TITULO: TStringField
      FieldName = 'TLA_TITULO'
      Size = 100
    end
    object cdsCadBaseTLA_CLASSE: TStringField
      FieldName = 'TLA_CLASSE'
      Size = 100
    end
    object cdsCadBaseTLA_TABELA: TStringField
      FieldName = 'TLA_TABELA'
      Size = 100
    end
  end
  inherited cdsLstBase: TClientDataSet
    object cdsLstBaseTLA_TELA: TIntegerField
      FieldName = 'TLA_TELA'
      Required = True
    end
    object cdsLstBaseTLA_NOME: TStringField
      FieldName = 'TLA_NOME'
      Size = 100
    end
    object cdsLstBaseTLA_TITULO: TStringField
      FieldName = 'TLA_TITULO'
      Size = 100
    end
    object cdsLstBaseTLA_CLASSE: TStringField
      FieldName = 'TLA_CLASSE'
      Size = 100
    end
  end
  inherited qryLstAux: TSQLQuery
    Params = <>
  end
  inherited cdsLstTabela: TClientDataSet
    Top = 144
  end
  inherited qryLstItem: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'TLA_TELA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM TLS_COLUNA WHERE TLA_TELA=:TLA_TELA')
    Left = 57
    Top = 304
    object qryLstItemCLN_COLUNA: TIntegerField
      FieldName = 'CLN_COLUNA'
      Required = True
    end
    object qryLstItemCLN_NOME: TStringField
      FieldName = 'CLN_NOME'
      Size = 100
    end
    object qryLstItemTLA_TELA: TIntegerField
      FieldName = 'TLA_TELA'
    end
    object qryLstItemCLN_SOMA: TStringField
      FieldName = 'CLN_SOMA'
      FixedChar = True
      Size = 1
    end
    object qryLstItemCLN_FILTRA: TStringField
      FieldName = 'CLN_FILTRA'
      FixedChar = True
      Size = 1
    end
    object qryLstItemCLN_TAMANHO: TIntegerField
      FieldName = 'CLN_TAMANHO'
    end
    object qryLstItemCLN_ORDEM: TIntegerField
      FieldName = 'CLN_ORDEM'
    end
    object qryLstItemCLN_CHAVE: TStringField
      FieldName = 'CLN_CHAVE'
      FixedChar = True
      Size = 1
    end
    object qryLstItemCLN_CAPTION: TStringField
      FieldName = 'CLN_CAPTION'
      Size = 100
    end
    object qryLstItemSMA_SOMA: TIntegerField
      FieldName = 'SMA_SOMA'
    end
    object qryLstItemCLN_NOME_AMIGAVEL: TWideStringField
      FieldName = 'CLN_NOME_AMIGAVEL'
      FixedChar = True
    end
  end
  inherited dspLstItem: TDataSetProvider
    Left = 57
    Top = 248
  end
  inherited cdsLstItem: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'TLA_TELA'
        ParamType = ptInput
      end>
    Left = 57
    Top = 200
    object cdsLstItemCLN_COLUNA: TIntegerField
      FieldName = 'CLN_COLUNA'
      Required = True
    end
    object cdsLstItemCLN_NOME: TStringField
      FieldName = 'CLN_NOME'
      Size = 100
    end
    object cdsLstItemTLA_TELA: TIntegerField
      FieldName = 'TLA_TELA'
    end
    object cdsLstItemCLN_SOMA: TStringField
      FieldName = 'CLN_SOMA'
      FixedChar = True
      Size = 1
    end
    object cdsLstItemCLN_FILTRA: TStringField
      FieldName = 'CLN_FILTRA'
      FixedChar = True
      Size = 1
    end
    object cdsLstItemCLN_TAMANHO: TIntegerField
      FieldName = 'CLN_TAMANHO'
    end
    object cdsLstItemCLN_ORDEM: TIntegerField
      FieldName = 'CLN_ORDEM'
    end
    object cdsLstItemCLN_CHAVE: TStringField
      FieldName = 'CLN_CHAVE'
      FixedChar = True
      Size = 1
    end
    object cdsLstItemCLN_CAPTION: TStringField
      FieldName = 'CLN_CAPTION'
      Size = 100
    end
    object cdsLstItemSMA_SOMA: TIntegerField
      FieldName = 'SMA_SOMA'
    end
    object cdsLstItemCLN_NOME_AMIGAVEL: TWideStringField
      FieldName = 'CLN_NOME_AMIGAVEL'
    end
  end
  inherited qryCadItem: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'CLN_COLUNA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM TLS_COLUNA WHERE CLN_COLUNA=:CLN_COLUNA')
    Left = 115
    Top = 304
    object qryCadItemCLN_COLUNA: TIntegerField
      FieldName = 'CLN_COLUNA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadItemCLN_NOME: TStringField
      FieldName = 'CLN_NOME'
      Size = 100
    end
    object qryCadItemTLA_TELA: TIntegerField
      FieldName = 'TLA_TELA'
    end
    object qryCadItemCLN_SOMA: TStringField
      FieldName = 'CLN_SOMA'
      FixedChar = True
      Size = 1
    end
    object qryCadItemCLN_FILTRA: TStringField
      FieldName = 'CLN_FILTRA'
      FixedChar = True
      Size = 1
    end
    object qryCadItemCLN_TAMANHO: TIntegerField
      FieldName = 'CLN_TAMANHO'
    end
    object qryCadItemCLN_ORDEM: TIntegerField
      FieldName = 'CLN_ORDEM'
    end
    object qryCadItemCLN_CHAVE: TStringField
      FieldName = 'CLN_CHAVE'
      FixedChar = True
      Size = 1
    end
    object qryCadItemCLN_CAPTION: TStringField
      FieldName = 'CLN_CAPTION'
      Size = 100
    end
    object qryCadItemSMA_SOMA: TIntegerField
      FieldName = 'SMA_SOMA'
    end
    object qryCadItemCLN_NOME_AMIGAVEL: TWideStringField
      FieldName = 'CLN_NOME_AMIGAVEL'
      FixedChar = True
    end
  end
  inherited dspCadItem: TDataSetProvider
    Left = 117
    Top = 248
  end
  inherited cdsCadItem: TClientDataSet
    Active = True
    Params = <
      item
        DataType = ftInteger
        Name = 'CLN_COLUNA'
        ParamType = ptInput
      end>
    Left = 116
    Top = 200
    object cdsCadItemCLN_COLUNA: TIntegerField
      FieldName = 'CLN_COLUNA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCadItemCLN_NOME: TStringField
      FieldName = 'CLN_NOME'
      Size = 100
    end
    object cdsCadItemTLA_TELA: TIntegerField
      FieldName = 'TLA_TELA'
    end
    object cdsCadItemCLN_SOMA: TStringField
      FieldName = 'CLN_SOMA'
      FixedChar = True
      Size = 1
    end
    object cdsCadItemCLN_FILTRA: TStringField
      FieldName = 'CLN_FILTRA'
      FixedChar = True
      Size = 1
    end
    object cdsCadItemCLN_TAMANHO: TIntegerField
      FieldName = 'CLN_TAMANHO'
    end
    object cdsCadItemCLN_ORDEM: TIntegerField
      FieldName = 'CLN_ORDEM'
    end
    object cdsCadItemCLN_CHAVE: TStringField
      FieldName = 'CLN_CHAVE'
      FixedChar = True
      Size = 1
    end
    object cdsCadItemCLN_CAPTION: TStringField
      FieldName = 'CLN_CAPTION'
      Size = 100
    end
    object cdsCadItemSMA_SOMA: TIntegerField
      FieldName = 'SMA_SOMA'
    end
    object cdsCadItemCLN_NOME_AMIGAVEL: TWideStringField
      FieldName = 'CLN_NOME_AMIGAVEL'
    end
  end
  object CdsLstSoma: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT SMA_SOMA, SMA_NOME FROM TLS_SOMA'#13#10'ORDER BY SMA_SOMA'
    Params = <>
    ProviderName = 'dspLstAux'
    Left = 408
    Top = 224
    object CdsLstSomaSMA_SOMA: TIntegerField
      FieldName = 'SMA_SOMA'
      Required = True
    end
    object CdsLstSomaSMA_NOME: TStringField
      FieldName = 'SMA_NOME'
      Size = 100
    end
  end
end
