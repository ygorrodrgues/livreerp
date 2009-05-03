inherited dmPrincipal: TdmPrincipal
  OldCreateOrder = True
  Height = 264
  Width = 383
  inherited qryKernel_Gerenerica: TSQLQuery
    Left = 120
    Top = 136
  end
  inherited conPrincipalKernel: TSQLConnection
    ConnectionName = 'Livreero'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxint.dll'
    Params.Strings = (
      'DriverName=Interbase'
      'DriverUnit=DBXInterBase'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver120.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=12.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXInterbaseMetaDataCommandFactory,DbxInt' +
        'erBaseDriver120.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXInterbaseMetaDataCommand' +
        'Factory,Borland.Data.DbxInterBaseDriver,Version=12.0.0.0,Culture' +
        '=neutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'BlobSize=-1'
      'CommitRetain=False'
      
        'Database=localhost:D:\Setores\Desenvolvimento\Sistemas\Trabalho\' +
        'Framework\LivreFrameGUI\DBFRAMEWORK.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True'
      'Trim Char=False')
    VendorLib = 'GDS32.DLL'
    Left = 120
    Top = 40
  end
end
