inherited dmKernel_CadUsuario: TdmKernel_CadUsuario
  inherited qryCadBase: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'CODUSU'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM USUARIO WHERE CODUSU=:CODUSU')
    object qryCadBaseCODUSU: TIntegerField
      FieldName = 'CODUSU'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadBaseCODPERFIL: TIntegerField
      FieldName = 'CODPERFIL'
    end
    object qryCadBaseNOMEUSU: TStringField
      FieldName = 'NOMEUSU'
      Size = 100
    end
    object qryCadBaseSENHAUSU: TStringField
      FieldName = 'SENHAUSU'
    end
    object qryCadBaseLOGINUSU: TStringField
      FieldName = 'LOGINUSU'
      Size = 50
    end
    object qryCadBaseQTDIASUSU: TIntegerField
      FieldName = 'QTDIASUSU'
    end
    object qryCadBasePRIVADMUSU: TStringField
      FieldName = 'PRIVADMUSU'
      FixedChar = True
      Size = 1
    end
    object qryCadBaseEXPIRASENHAUSU: TStringField
      FieldName = 'EXPIRASENHAUSU'
      FixedChar = True
      Size = 1
    end
    object qryCadBaseDTEXPIRAUSU: TSQLTimeStampField
      FieldName = 'DTEXPIRAUSU'
    end
  end
  inherited qryLstBase: TSQLQuery
    Params = <
      item
        DataType = ftString
        Name = 'CODUSU'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEPERFIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEUSU'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOGINUSU'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT U.*, NOMEPERFIL FROM USUARIO U'
      'INNER JOIN PERFIL P ON P.CODPERFIL=U.CODPERFIL'
      'WHERE CODUSU LIKE :CODUSU AND NOMEPERFIL LIKE :NOMEPERFIL'
      'AND NOMEUSU LIKE :NOMEUSU AND LOGINUSU LIKE :LOGINUSU')
    object qryLstBaseCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Required = True
    end
    object qryLstBaseCODPERFIL: TIntegerField
      FieldName = 'CODPERFIL'
    end
    object qryLstBaseNOMEUSU: TStringField
      FieldName = 'NOMEUSU'
      Size = 100
    end
    object qryLstBaseSENHAUSU: TStringField
      FieldName = 'SENHAUSU'
    end
    object qryLstBaseLOGINUSU: TStringField
      FieldName = 'LOGINUSU'
      Size = 50
    end
    object qryLstBaseQTDIASUSU: TIntegerField
      FieldName = 'QTDIASUSU'
    end
    object qryLstBasePRIVADMUSU: TStringField
      FieldName = 'PRIVADMUSU'
      FixedChar = True
      Size = 1
    end
    object qryLstBaseEXPIRASENHAUSU: TStringField
      FieldName = 'EXPIRASENHAUSU'
      FixedChar = True
      Size = 1
    end
    object qryLstBaseDTEXPIRAUSU: TSQLTimeStampField
      FieldName = 'DTEXPIRAUSU'
    end
    object qryLstBaseNOMEPERFIL: TStringField
      FieldName = 'NOMEPERFIL'
      Size = 150
    end
  end
  inherited cdsCadBase: TClientDataSet
    Active = True
    Params = <
      item
        DataType = ftInteger
        Name = 'CODUSU'
        ParamType = ptInput
      end>
    object cdsCadBaseCODUSU: TIntegerField
      FieldName = 'CODUSU'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCadBaseCODPERFIL: TIntegerField
      FieldName = 'CODPERFIL'
    end
    object cdsCadBaseNOMEUSU: TStringField
      FieldName = 'NOMEUSU'
      Size = 100
    end
    object cdsCadBaseSENHAUSU: TStringField
      FieldName = 'SENHAUSU'
    end
    object cdsCadBaseLOGINUSU: TStringField
      FieldName = 'LOGINUSU'
      Size = 50
    end
    object cdsCadBaseQTDIASUSU: TIntegerField
      FieldName = 'QTDIASUSU'
    end
    object cdsCadBasePRIVADMUSU: TStringField
      FieldName = 'PRIVADMUSU'
      FixedChar = True
      Size = 1
    end
    object cdsCadBaseEXPIRASENHAUSU: TStringField
      FieldName = 'EXPIRASENHAUSU'
      FixedChar = True
      Size = 1
    end
    object cdsCadBaseDTEXPIRAUSU: TSQLTimeStampField
      FieldName = 'DTEXPIRAUSU'
    end
  end
  inherited cdsLstBase: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'CODUSU'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEPERFIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEUSU'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOGINUSU'
        ParamType = ptInput
      end>
    object cdsLstBaseCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Required = True
    end
    object cdsLstBaseCODPERFIL: TIntegerField
      FieldName = 'CODPERFIL'
    end
    object cdsLstBaseNOMEUSU: TStringField
      FieldName = 'NOMEUSU'
      Size = 100
    end
    object cdsLstBaseSENHAUSU: TStringField
      FieldName = 'SENHAUSU'
    end
    object cdsLstBaseLOGINUSU: TStringField
      FieldName = 'LOGINUSU'
      Size = 50
    end
    object cdsLstBaseQTDIASUSU: TIntegerField
      FieldName = 'QTDIASUSU'
    end
    object cdsLstBasePRIVADMUSU: TStringField
      FieldName = 'PRIVADMUSU'
      FixedChar = True
      Size = 1
    end
    object cdsLstBaseEXPIRASENHAUSU: TStringField
      FieldName = 'EXPIRASENHAUSU'
      FixedChar = True
      Size = 1
    end
    object cdsLstBaseDTEXPIRAUSU: TSQLTimeStampField
      FieldName = 'DTEXPIRAUSU'
    end
    object cdsLstBaseNOMEPERFIL: TStringField
      FieldName = 'NOMEPERFIL'
      Size = 150
    end
  end
  object cdsPerfil: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM PERFIL ORDER BY NOMEPERFIL'
    Params = <>
    ProviderName = 'dspLstAux'
    Left = 72
    Top = 272
    object cdsPerfilCODPERFIL: TIntegerField
      FieldName = 'CODPERFIL'
      Required = True
    end
    object cdsPerfilNOMEPERFIL: TStringField
      FieldName = 'NOMEPERFIL'
      Size = 150
    end
  end
  object dsPerfil: TDataSource
    DataSet = cdsPerfil
    Left = 144
    Top = 272
  end
end
