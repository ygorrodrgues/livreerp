inherited dmKernel_Perfil: TdmKernel_Perfil
  inherited qryCadBase: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'CODPERFIL'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM PERFIL WHERE CODPERFIL=:CODPERFIL')
    object qryCadBaseCODPERFIL: TIntegerField
      FieldName = 'CODPERFIL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadBaseNOMEPERFIL: TStringField
      FieldName = 'NOMEPERFIL'
      Size = 150
    end
  end
  inherited qryLstBase: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'CODPERFIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEPERFIL'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM PERFIL WHERE CODPERFIL LIKE :CODPERFIL'
      'AND NOMEPERFIL LIKE :NOMEPERFIL')
    object qryLstBaseCODPERFIL: TIntegerField
      FieldName = 'CODPERFIL'
      Required = True
    end
    object qryLstBaseNOMEPERFIL: TStringField
      FieldName = 'NOMEPERFIL'
      Size = 150
    end
  end
  inherited cdsCadBase: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'CODPERFIL'
        ParamType = ptInput
      end>
    object cdsCadBaseCODPERFIL: TIntegerField
      FieldName = 'CODPERFIL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCadBaseNOMEPERFIL: TStringField
      FieldName = 'NOMEPERFIL'
      Size = 150
    end
  end
  inherited cdsLstBase: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'CODPERFIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEPERFIL'
        ParamType = ptInput
      end>
    object cdsLstBaseCODPERFIL: TIntegerField
      FieldName = 'CODPERFIL'
      Required = True
    end
    object cdsLstBaseNOMEPERFIL: TStringField
      FieldName = 'NOMEPERFIL'
      Size = 150
    end
  end
end
