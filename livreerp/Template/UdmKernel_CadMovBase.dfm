inherited dmKernel_CadMovBase: TdmKernel_CadMovBase
  Height = 428
  Width = 581
  inherited cdsLstColunas: TClientDataSet
    Left = 488
    Top = 96
  end
  inherited qryLstAux: TSQLQuery
    Left = 408
    Top = 144
  end
  inherited dspLstAux: TDataSetProvider
    Left = 408
    Top = 96
  end
  inherited cdsLstTabela: TClientDataSet
    Left = 488
    Top = 152
  end
  object qryLstItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.conPrincipalKernel
    Left = 41
    Top = 280
  end
  object dspLstItem: TDataSetProvider
    DataSet = qryLstItem
    Left = 41
    Top = 224
  end
  object cdsLstItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLstItem'
    Left = 41
    Top = 176
  end
  object qryCadItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.conPrincipalKernel
    Left = 99
    Top = 280
  end
  object dspCadItem: TDataSetProvider
    DataSet = qryCadItem
    UpdateMode = upWhereKeyOnly
    Left = 101
    Top = 224
  end
  object cdsCadItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadItem'
    AfterInsert = cdsCadItemAfterInsert
    BeforePost = cdsCadItemBeforePost
    Left = 100
    Top = 176
  end
  object qryPesqProd: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.conPrincipalKernel
    Left = 264
    Top = 275
  end
  object dspPesqProd: TDataSetProvider
    DataSet = qryPesqProd
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 264
    Top = 227
  end
  object cdsPesqProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqProd'
    Left = 264
    Top = 176
  end
end
