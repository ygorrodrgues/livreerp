object dmKernelPrincipal: TdmKernelPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 327
  Width = 364
  object qryKernel_Gerenerica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conPrincipalKernel
    Left = 96
    Top = 160
  end
  object conPrincipalKernel: TSQLConnection
    ConnectionName = 'framework'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbxmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'HostName=(local)'
      'Database=framework'
      'User_Name=sa'
      'Password=12345')
    TableScope = [tsTable]
    VendorLib = 'oledb'
    Left = 96
    Top = 80
  end
end
