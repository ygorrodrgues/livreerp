inherited dmPrincipal: TdmPrincipal
  OldCreateOrder = True
  Height = 264
  Width = 383
  inherited qryKernel_Gerenerica: TSQLQuery
    Left = 120
    Top = 136
  end
  inherited conPrincipalKernel: TSQLConnection
    ConnectionName = 'LivreERP'
    DriverName = 'FIREBIRD'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    Params.Strings = (
      'drivername=FIREBIRD'
      'blobsize=-1'
      'commitretain=False'
      'Database=C:\LivreERP\DB\LIVREERP.FDB'
      'localecode=0000'
      'Password=masterkey'
      'rolename=RoleName'
      'sqldialect=3'
      'isolationlevel=ReadCommitted'
      'user_name=sysdba'
      'waitonlocks=True'
      'trim char=False')
    VendorLib = 'fbclient.DLL'
    Left = 120
    Top = 40
  end
end
