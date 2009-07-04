inherited dmKernel_Relatorio: TdmKernel_Relatorio
  OldCreateOrder = True
  Height = 233
  Width = 417
  object rprtCadBase: TfrxReport
    Version = '4.7.9'
    ParentReport = '..\Relatorios_Template\Kernel_RelatorioBase.fr3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39922.060748206000000000
    ReportOptions.LastChange = 39998.486535185200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 112
    Top = 64
    Datasets = <
      item
        DataSet = rprtCadBase.qryLstBase
        DataSetName = 'qryLstBase'
      end>
    Variables = <
      item
        Name = ' vr_Titulo'
        Value = Null
      end
      item
        Name = 'moEmpresa'
        Value = Null
      end
      item
        Name = 'moEndereco'
        Value = Null
      end
      item
        Name = 'moBairro'
        Value = Null
      end
      item
        Name = 'moTelefone'
        Value = Null
      end
      item
        Name = 'moEmail'
        Value = Null
      end
      item
        Name = 'moFantasia'
        Value = Null
      end
      item
        Name = 'moNumero'
        Value = Null
      end
      item
        Name = 'moCidade'
        Value = Null
      end
      item
        Name = 'moEstado'
        Value = Null
      end
      item
        Name = 'moFax'
        Value = Null
      end
      item
        Name = 'moSite'
        Value = Null
      end
      item
        Name = ' vr_Cabecalho'
        Value = Null
      end
      item
        Name = 'Periodo'
        Value = Null
      end
      item
        Name = 'Usuario'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object DBXCon: TfrxDBXDatabase
        ConnectionName = 'VAPGESTLIC'
        DriverName = 'MSSQL'
        GetDriverFunc = 'getSQLDriverMSSQL'
        LibraryName = 'dbxmss.dll'
        LoginPrompt = False
        Params.Strings = (
          'DriverName=MSSQL'
          'SchemaOverride=%.dbo'
          'DriverUnit=DBXMSSQL'
          
            'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver120.' +
            'bpl'
          
            'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
            'nd.Data.DbxCommonDriver,Version=12.0.0.0,Culture=neutral,PublicK' +
            'eyToken=91d62ebb5b0d1b1b'
          
            'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
            'iver120.bpl'
          
            'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
            'ory,Borland.Data.DbxMSSQLDriver,Version=12.0.0.0,Culture=neutral' +
            ',PublicKeyToken=91d62ebb5b0d1b1b'
          'HostName=CPD02\SQL'
          'DataBase=CORPORERM'
          'User_Name=SA'
          'Password=12345'
          'BlobSize=-1'
          'ErrorResourceFile='
          'LocaleCode=0000'
          'MSSQL TransIsolation=ReadCommited'
          'OS Authentication=False'
          'Prepare SQL=False')
        VendorLib = 'oledb'
        Connected = True
        pLeft = 92
        pTop = 128
      end
      object qryLstBase: TfrxDBXQuery
        UserName = 'qryLstBase'
        CloseDataSource = True
        IgnoreDupParams = False
        Params = <>
        SQL.Strings = (
          
            'SELECT * FROM VAP_VW_LCT_TIPO                                   ' +
            '  ')
        Database = rprtCadBase.DBXCon
        pLeft = 196
        pTop = 132
        Parameters = <>
      end
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      object ReportTitle1: TfrxReportTitle
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Top = 0.559060000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Empresa:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 18.236240000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Endere'#195#167'o:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 55.031540000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Telefone:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 7.559060000000000000
          Top = 75.149660000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'E-mail:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 36.015770000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Bairro:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 381.732530000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Fantasia:')
          ParentFont = False
        end
        object ptrLogo: TfrxPictureView
          Left = 680.094930000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 83.149660000000000000
          ShowHint = False
          HightQuality = False
        end
        object Memo8: TfrxMemoView
          Left = 381.732530000000000000
          Top = 19.677180000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'N'#195#186'mero:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 275.905690000000000000
          Top = 36.015770000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Cidade:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 467.102660000000000000
          Top = 36.015770000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Estado:')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 381.732530000000000000
          Top = 57.472480000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Fax:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 381.732530000000000000
          Top = 76.149660000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Site:')
          ParentFont = False
        end
        object moEmpresa: TfrxMemoView
          Left = 71.811070000000000000
          Top = 0.779530000000000000
          Width = 302.362400000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[moEmpresa]')
          ParentFont = False
        end
        object moEndereco: TfrxMemoView
          Left = 71.811070000000000000
          Top = 18.456710000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[moEndereco]')
          ParentFont = False
        end
        object moTelefonne: TfrxMemoView
          Left = 71.811070000000000000
          Top = 55.252010000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[moTelefone]')
          ParentFont = False
        end
        object moEmail: TfrxMemoView
          Left = 71.811070000000000000
          Top = 75.370130000000000000
          Width = 219.212740000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[moEmail]')
          ParentFont = False
        end
        object moBairro: TfrxMemoView
          Left = 71.811070000000000000
          Top = 36.795300000000000000
          Width = 196.535560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[moBairro]')
          ParentFont = False
        end
        object moNumero: TfrxMemoView
          Left = 445.425480000000000000
          Top = 19.677180000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[moNumero]')
          ParentFont = False
        end
        object moCidade: TfrxMemoView
          Left = 328.260050000000000000
          Top = 36.795300000000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[moCidade]')
          ParentFont = False
        end
        object moEstado: TfrxMemoView
          Left = 520.457020000000000000
          Top = 36.795300000000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[moEstado]')
          ParentFont = False
        end
        object moFax: TfrxMemoView
          Left = 422.748300000000000000
          Top = 57.472480000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[moFax]')
          ParentFont = False
        end
        object moSite: TfrxMemoView
          Left = 422.748300000000000000
          Top = 76.149660000000000000
          Width = 241.889920000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[moSite]')
          ParentFont = False
        end
        object cmFantasia: TfrxMemoView
          Left = 445.425480000000000000
          Width = 230.551330000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[moFantasia]')
          ParentFont = False
        end
      end
      object mstDados: TfrxMasterData
        Height = 22.677180000000000000
        Top = 275.905690000000000000
        Width = 793.701300000000000000
        DataSet = rprtCadBase.qryLstBase
        DataSetName = 'qryLstBase'
        RowCount = 0
        object qryLstBaseTIP_TIPO: TfrxMemoView
          Left = 11.338590000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TIP_TIPO'
          DataSet = rprtCadBase.qryLstBase
          DataSetName = 'qryLstBase'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[qryLstBase."TIP_TIPO"]')
          ParentFont = False
        end
        object qryLstBaseTIP_DESCRICAO: TfrxMemoView
          Left = 102.047310000000000000
          Width = 377.952755910000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TIP_DESCRICAO'
          DataSet = rprtCadBase.qryLstBase
          DataSetName = 'qryLstBase'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[qryLstBase."TIP_DESCRICAO"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 49.133890000000000000
        Top = 359.055350000000000000
        Width = 793.701300000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 11.338590000000000000
          Top = 15.118120000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Total de Registros: [COUNT(MstDados)]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 15.118120000000000000
          Top = 3.779530000000000000
          Width = 782.362710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.ShadowWidth = 2.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 79.370130000000000000
        Top = 136.063080000000000000
        Width = 793.701300000000000000
        object moTitulo_Relatorio: TfrxMemoView
          Left = 247.582870000000000000
          Top = 3.779530000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'moTitulo_Relatorio')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 11.338590000000000000
          Top = 18.897650000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Usu'#195#161'rio: [Usuario]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 604.724800000000000000
          Top = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'P'#195#161'gina [Page] de [TotalPages]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 245.669450000000000000
          Top = 25.456710000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Per'#195#173'odo: [Periodo]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 604.724800000000000000
          Top = 26.456710000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Data de Emiss'#195#163'o: [Date]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 7.559060000000000000
          Width = 782.362710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.ShadowWidth = 2.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 7.559060000000000000
          Top = 56.692950000000000000
          Width = 782.362710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.ShadowWidth = 2.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 11.338590000000000000
          Top = 56.692950000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'C'#195#179'digo')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 102.047310000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Descri'#195#167#195#163'o')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 430.866420000000000000
        Width = 793.701300000000000000
      end
    end
  end
  object dsgnrCadBase: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    TemplateDir = 'C:\VAP\Sistema Novo\Livre Frame\Relatorios_Template'
    Restrictions = []
    RTLLanguage = False
    Left = 232
    Top = 72
  end
end
