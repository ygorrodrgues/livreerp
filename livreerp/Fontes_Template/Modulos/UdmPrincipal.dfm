inherited dmPrincipal: TdmPrincipal
  OldCreateOrder = True
  Height = 264
  Width = 383
  inherited qryKernel_Gerenerica: TSQLQuery
    Left = 120
    Top = 136
  end
  inherited conPrincipalKernel: TSQLConnection
    ConnectionName = 'systoch'
    Params.Strings = (
      'DriverName=MSSQL'
      'SchemaOverride=%.dbo'
      'DriverUnit=DBXDynalink'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXDynalinkDriver10' +
        '0.bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxDynalinkDriver,Version=11.0.5000.0,Culture=neutral,Pu' +
        'blicKeyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxReadOnl' +
        'yMetaData100.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxReadOnlyMetaData,Version=11.0.5000.0,Culture' +
        '=neutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'HostName=SERGIO-PC'
      'DataBase=SYSTOCH'
      'User_Name=SYS'
      'Password=SYS'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'MSSQL TransIsolation=ReadCommited'
      'OS Authentication=False'
      'Prepare SQL=False')
    Left = 120
    Top = 40
  end
end
