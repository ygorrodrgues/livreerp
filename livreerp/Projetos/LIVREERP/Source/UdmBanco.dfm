inherited dmBanco: TdmBanco
  inherited qryCadBase: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'CODBANCO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM BANCO WHERE CODBANCO=:CODBANCO')
    object qryCadBaseCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadBaseNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 100
    end
    object qryCadBaseLICENCABANCO: TStringField
      FieldName = 'LICENCABANCO'
      Size = 100
    end
  end
  inherited qryLstBase: TSQLQuery
    Params = <
      item
        DataType = ftString
        Name = 'CODBANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEBANCO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT * FROM BANCO WHERE CODBANCO LIKE :CODBANCO AND NOMEBANCO ' +
        'LIKE :NOMEBANCO')
    object qryLstBaseCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
      Required = True
    end
    object qryLstBaseNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 100
    end
    object qryLstBaseLICENCABANCO: TStringField
      FieldName = 'LICENCABANCO'
      Size = 100
    end
  end
  inherited cdsCadBase: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'CODBANCO'
        ParamType = ptInput
      end>
    object cdsCadBaseCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCadBaseNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 100
    end
    object cdsCadBaseLICENCABANCO: TStringField
      FieldName = 'LICENCABANCO'
      Size = 100
    end
  end
  inherited cdsLstBase: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'CODBANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEBANCO'
        ParamType = ptInput
      end>
    object cdsLstBaseCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
      Required = True
    end
    object cdsLstBaseNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 100
    end
    object cdsLstBaseLICENCABANCO: TStringField
      FieldName = 'LICENCABANCO'
      Size = 100
    end
  end
end
