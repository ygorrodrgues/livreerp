inherited dmProjeto: TdmProjeto
  Height = 465
  inherited qryCadBase: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM PROJETO WHERE ID_PROJETO=:ID_PROJETO')
    object qryCadBaseID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadBaseNOME_PROJETO: TStringField
      FieldName = 'NOME_PROJETO'
      Size = 255
    end
    object qryCadBaseDATA_CRIACAO_PROJETO: TDateField
      FieldName = 'DATA_CRIACAO_PROJETO'
    end
    object qryCadBaseID_TIPO_PROJETO: TIntegerField
      FieldName = 'ID_TIPO_PROJETO'
    end
    object qryCadBaseID_TIPO_BANCO: TIntegerField
      FieldName = 'ID_TIPO_BANCO'
    end
  end
  inherited cdsCadBase: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    object cdsCadBaseID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCadBaseNOME_PROJETO: TStringField
      FieldName = 'NOME_PROJETO'
      Size = 255
    end
    object cdsCadBaseDATA_CRIACAO_PROJETO: TDateField
      FieldName = 'DATA_CRIACAO_PROJETO'
    end
    object cdsCadBaseID_TIPO_PROJETO: TIntegerField
      FieldName = 'ID_TIPO_PROJETO'
    end
    object cdsCadBaseID_TIPO_BANCO: TIntegerField
      FieldName = 'ID_TIPO_BANCO'
    end
  end
  inherited qryLstAux: TSQLQuery
    Params = <>
  end
  object cdsLstTIPO_BANCO: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM TIPO_BANCO'#13#10'ORDER BY DESC_TIPO_BANCO'
    Params = <>
    ProviderName = 'dspLstAux'
    Left = 80
    Top = 256
    object cdsLstTIPO_BANCOID_TIPO_BANCO: TIntegerField
      FieldName = 'ID_TIPO_BANCO'
      Required = True
    end
    object cdsLstTIPO_BANCODESC_TIPO_BANCO: TStringField
      FieldName = 'DESC_TIPO_BANCO'
      Size = 255
    end
  end
  object dsLstTIPO_BANCO: TDataSource
    DataSet = cdsLstTIPO_BANCO
    Left = 144
    Top = 256
  end
end
