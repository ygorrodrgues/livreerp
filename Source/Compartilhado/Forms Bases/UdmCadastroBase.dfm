inherited dmCadastroBase: TdmCadastroBase
  Left = 477
  Top = 184
  Height = 319
  Width = 476
  object qryLstBase: TSQLQuery [0]
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmprincipal.conPrincipal
    Left = 88
    Top = 88
  end
  object dspLstBase: TDataSetProvider [1]
    DataSet = qryLstBase
    Left = 168
    Top = 88
  end
  object cdsLstBase: TClientDataSet [2]
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLstBase'
    Left = 264
    Top = 88
  end
  object qryCadBase: TSQLQuery [3]
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmprincipal.conPrincipal
    Left = 88
    Top = 152
  end
  object dspCadBase: TDataSetProvider [4]
    DataSet = qryCadBase
    UpdateMode = upWhereKeyOnly
    Left = 168
    Top = 152
  end
  object cdsCadBase: TClientDataSet [5]
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadBase'
    Left = 264
    Top = 152
  end
end
