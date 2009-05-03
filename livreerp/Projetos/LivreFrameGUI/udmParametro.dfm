inherited dmParametro: TdmParametro
  inherited qryCadBase: TSQLQuery
    SQL.Strings = (
      'SELECT * FROM PARAMETRO')
    object qryCadBaseID_PARAMETRO: TIntegerField
      FieldName = 'ID_PARAMETRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadBasePASTA_PROJETO: TStringField
      FieldName = 'PASTA_PROJETO'
      Size = 255
    end
    object qryCadBaseTEMPLATE_PROJETO: TStringField
      FieldName = 'TEMPLATE_PROJETO'
      Size = 255
    end
  end
  inherited cdsCadBase: TClientDataSet
    object cdsCadBaseID_PARAMETRO: TIntegerField
      FieldName = 'ID_PARAMETRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCadBasePASTA_PROJETO: TStringField
      FieldName = 'PASTA_PROJETO'
      Size = 255
    end
    object cdsCadBaseTEMPLATE_PROJETO: TStringField
      FieldName = 'TEMPLATE_PROJETO'
      Size = 255
    end
  end
end
