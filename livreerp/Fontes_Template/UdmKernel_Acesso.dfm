object dmKernel_Acesso: TdmKernel_Acesso
  OldCreateOrder = False
  Height = 278
  Width = 603
  object qryAcessoMenuUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codusu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codmenu'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'declare @codusu int, @codmenu int'
      ''
      'set @codusu=:codusu'
      'set @codmenu=:codmenu'
      ''
      
        'select  actconsultar, actNovo, actAlterar, actApagar from permis' +
        'soesusuario pu'
      'inner join usuario u on pu.codusu=u.codusu'
      'where u.codusu=@codusu'
      ' and pu.codmenu=@codmenu')
    SQLConnection = dmPrincipal.conPrincipalKernel
    Left = 344
    Top = 40
  end
  object dspAcessoMenuUsuario: TDataSetProvider
    DataSet = qryAcessoMenuUsuario
    Left = 408
    Top = 40
  end
  object cdsAcessoMenuUsuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'codusu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codmenu'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcessoMenuUsuario'
    Left = 480
    Top = 40
    object StringField1: TStringField
      FieldName = 'actconsultar'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qryDireitoAcessoUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codusu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codmenu'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'declare @codusu int, @codmenu int'
      ''
      'set @codusu=:codusu'
      'set @codmenu=:codmenu'
      ''
      
        'select  actconsultar, actNovo, actAlterar, actApagar from permis' +
        'soesusuario pu'
      'inner join usuario u on pu.codusu=u.codusu'
      'where u.codusu=@codusu'
      ' and pu.codmenu=@codmenu'
      '')
    SQLConnection = dmPrincipal.conPrincipalKernel
    Left = 344
    Top = 112
  end
  object dspDireitoAcessoUsuario: TDataSetProvider
    DataSet = qryDireitoAcessoUsuario
    Left = 408
    Top = 112
  end
  object cdsDireitoAcessoUsuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'codusu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codmenu'
        ParamType = ptInput
      end>
    ProviderName = 'dspDireitoAcessoUsuario'
    Left = 464
    Top = 112
    object StringField2: TStringField
      FieldName = 'actconsultar'
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField3: TStringField
      FieldName = 'actNovo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'actAlterar'
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField5: TStringField
      FieldName = 'actApagar'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qryDireitoAcesso: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codusu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codmenu'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'declare @codusu int, @codmenu int'
      ''
      'set @codusu=:codusu'
      'set @codmenu=:codmenu'
      ''
      
        'select  actconsultar, actNovo, actAlterar, actApagar from permis' +
        'soesPERFIL pe'
      'inner join perfil p on pe.codperfil=p.codperfil '
      'inner join usuario u on p.codperfil=u.codperfil '
      'where u.codusu=@codusu and pe.codmenu=@codmenu'
      'union '
      
        'select  actconsultar, actNovo, actAlterar, actApagar from permis' +
        'soesusuario pu'
      'inner join usuario u on pu.codusu=u.codusu'
      'where u.codusu=@codusu'
      ' and pu.codmenu=@codmenu'
      '')
    SQLConnection = dmPrincipal.conPrincipalKernel
    Left = 64
    Top = 32
  end
  object dspDireitoAcesso: TDataSetProvider
    DataSet = qryDireitoAcesso
    Left = 136
    Top = 32
  end
  object cdsDireitoAcesso: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'codusu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codmenu'
        ParamType = ptInput
      end>
    ProviderName = 'dspDireitoAcesso'
    Left = 208
    Top = 32
    object cdsDireitoAcessoactconsultar: TStringField
      FieldName = 'actconsultar'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDireitoAcessoactNovo: TStringField
      FieldName = 'actNovo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDireitoAcessoactAlterar: TStringField
      FieldName = 'actAlterar'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDireitoAcessoactApagar: TStringField
      FieldName = 'actApagar'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsAcessoMenu: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'codusu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codmenu'
        ParamType = ptInput
      end>
    ProviderName = 'dspAcessoMenu'
    Left = 208
    Top = 96
    object cdsAcessoMenuactconsultar: TStringField
      FieldName = 'actconsultar'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspAcessoMenu: TDataSetProvider
    DataSet = qryAcessoMenu
    Left = 144
    Top = 96
  end
  object qryAcessoMenu: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codusu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codmenu'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'declare @codusu int, @codmenu int'
      ''
      'set @codusu=:codusu'
      'set @codmenu=:codmenu'
      ''
      'select actconsultar from permissoesPERFIL pe'
      'inner join perfil p on pe.codperfil=p.codperfil '
      'inner join usuario u on p.codperfil=u.codperfil '
      'where u.codusu=@codusu'
      ' and pe.codmenu=@codmenu')
    SQLConnection = dmPrincipal.conPrincipalKernel
    Left = 64
    Top = 96
  end
  object qryAux: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.conPrincipalKernel
    Left = 64
    Top = 184
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 184
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 184
    Top = 184
  end
  object cdsLstEmp: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT CODEMP, NOMEEMP, FANTASIAEMP FROM EMPRESA'
    Params = <>
    ProviderName = 'dspAux'
    Left = 344
    Top = 192
    object cdsLstEmpCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object cdsLstEmpNOMEEMP: TStringField
      FieldName = 'NOMEEMP'
      Size = 100
    end
    object cdsLstEmpFANTASIAEMP: TStringField
      FieldName = 'FANTASIAEMP'
      Size = 100
    end
  end
  object dsLstEmp: TDataSource
    DataSet = cdsLstEmp
    Left = 416
    Top = 192
  end
end
