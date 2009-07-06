inherited dmKernel_Relatorio: TdmKernel_Relatorio
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 233
  Width = 417
  object rprtCadBase: TfrxReport
    Version = '4.7.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39922.060748206000000000
    ReportOptions.LastChange = 40000.609851342600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 144
    Top = 48
    Datasets = <
      item
        DataSet = dbdtstLstEmpresa
        DataSetName = 'dbdtstLstEmpresa'
      end
      item
        DataSet = dmTipos.dbdtstTipos
        DataSetName = 'dbdtstTipos'
      end>
    Variables = <
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
      end
      item
        Name = 'Titulo'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
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
          DataField = 'EMP_EMPRESA'
          DataSet = dbdtstLstEmpresa
          DataSetName = 'dbdtstLstEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstLstEmpresa."EMP_EMPRESA"]')
          ParentFont = False
        end
        object moEndereco: TfrxMemoView
          Left = 71.811070000000000000
          Top = 18.456710000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'EMP_ENDERECO'
          DataSet = dbdtstLstEmpresa
          DataSetName = 'dbdtstLstEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstLstEmpresa."EMP_ENDERECO"]')
          ParentFont = False
        end
        object moTelefonne: TfrxMemoView
          Left = 71.811070000000000000
          Top = 55.252010000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'EMP_TELEFONE'
          DataSet = dbdtstLstEmpresa
          DataSetName = 'dbdtstLstEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstLstEmpresa."EMP_TELEFONE"]')
          ParentFont = False
        end
        object moEmail: TfrxMemoView
          Left = 71.811070000000000000
          Top = 75.370130000000000000
          Width = 219.212740000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'EMP_EMAIL'
          DataSet = dbdtstLstEmpresa
          DataSetName = 'dbdtstLstEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstLstEmpresa."EMP_EMAIL"]')
          ParentFont = False
        end
        object moBairro: TfrxMemoView
          Left = 71.811070000000000000
          Top = 36.795300000000000000
          Width = 196.535560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'EMP_BAIRRO'
          DataSet = dbdtstLstEmpresa
          DataSetName = 'dbdtstLstEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstLstEmpresa."EMP_BAIRRO"]')
          ParentFont = False
        end
        object moNumero: TfrxMemoView
          Left = 445.425480000000000000
          Top = 19.677180000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'EMP_NUMERO'
          DataSet = dbdtstLstEmpresa
          DataSetName = 'dbdtstLstEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstLstEmpresa."EMP_NUMERO"]')
          ParentFont = False
        end
        object moCidade: TfrxMemoView
          Left = 328.260050000000000000
          Top = 36.795300000000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'EMP_CIDADE'
          DataSet = dbdtstLstEmpresa
          DataSetName = 'dbdtstLstEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstLstEmpresa."EMP_CIDADE"]')
          ParentFont = False
        end
        object moEstado: TfrxMemoView
          Left = 520.457020000000000000
          Top = 36.795300000000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'EMP_ESTADO'
          DataSet = dbdtstLstEmpresa
          DataSetName = 'dbdtstLstEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstLstEmpresa."EMP_ESTADO"]')
          ParentFont = False
        end
        object moFax: TfrxMemoView
          Left = 422.748300000000000000
          Top = 57.472480000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'EMP_FAX'
          DataSet = dbdtstLstEmpresa
          DataSetName = 'dbdtstLstEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstLstEmpresa."EMP_FAX"]')
          ParentFont = False
        end
        object moSite: TfrxMemoView
          Left = 422.748300000000000000
          Top = 76.149660000000000000
          Width = 241.889920000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'EMP_SITE'
          DataSet = dbdtstLstEmpresa
          DataSetName = 'dbdtstLstEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstLstEmpresa."EMP_SITE"]')
          ParentFont = False
        end
        object cmFantasia: TfrxMemoView
          Left = 445.425480000000000000
          Width = 230.551330000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'EMP_FANTASIA'
          DataSet = dbdtstLstEmpresa
          DataSetName = 'dbdtstLstEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstLstEmpresa."EMP_FANTASIA"]')
          ParentFont = False
        end
      end
      object mstDados: TfrxMasterData
        Height = 22.677180000000000000
        Top = 275.905690000000000000
        Width = 793.701300000000000000
        DataSet = dmTipos.dbdtstTipos
        DataSetName = 'dbdtstTipos'
        RowCount = 0
        object qryLstBaseTIP_TIPO: TfrxMemoView
          Left = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TIP_TIPO'
          DataSet = dmTipos.dbdtstTipos
          DataSetName = 'dbdtstTipos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstTipos."TIP_TIPO"]')
          ParentFont = False
        end
        object qryLstBaseTIP_DESCRICAO: TfrxMemoView
          Left = 98.267780000000000000
          Width = 377.952755910000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TIP_DESCRICAO'
          DataSet = dmTipos.dbdtstTipos
          DataSetName = 'dbdtstTipos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbdtstTipos."TIP_DESCRICAO"]')
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
            '[Usuario]')
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
          Left = 7.559060000000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
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
          Left = 98.267780000000000000
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
    Top = 48
  end
  object cdsLstEmpresa: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'SELECT EMP_EMPRESA, EMP_ENDERECO, EMP_BAIRRO, EMP_TELEFONE, EMP_' +
      'EMAIL,'#13#10' EMP_FANTASIA, EMP_NUMERO, EMP_CIDADE, EMP_ESTADO, EMP_F' +
      'AX, EMP_SITE'#13#10' FROM LCT_EMPRESA'
    Params = <>
    ProviderName = 'dspLstAux'
    Left = 232
    Top = 112
    object cdsLstEmpresaEMP_EMPRESA: TIntegerField
      FieldName = 'EMP_EMPRESA'
      Required = True
    end
    object cdsLstEmpresaEMP_ENDERECO: TStringField
      FieldName = 'EMP_ENDERECO'
      Size = 100
    end
    object cdsLstEmpresaEMP_BAIRRO: TStringField
      FieldName = 'EMP_BAIRRO'
      Size = 100
    end
    object cdsLstEmpresaEMP_TELEFONE: TStringField
      FieldName = 'EMP_TELEFONE'
      Size = 100
    end
    object cdsLstEmpresaEMP_EMAIL: TStringField
      FieldName = 'EMP_EMAIL'
      Size = 100
    end
    object cdsLstEmpresaEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 100
    end
    object cdsLstEmpresaEMP_NUMERO: TStringField
      FieldName = 'EMP_NUMERO'
      Size = 100
    end
    object cdsLstEmpresaEMP_CIDADE: TStringField
      FieldName = 'EMP_CIDADE'
      Size = 100
    end
    object cdsLstEmpresaEMP_ESTADO: TStringField
      FieldName = 'EMP_ESTADO'
      Size = 100
    end
    object cdsLstEmpresaEMP_FAX: TStringField
      FieldName = 'EMP_FAX'
      Size = 100
    end
    object cdsLstEmpresaEMP_SITE: TStringField
      FieldName = 'EMP_SITE'
      Size = 100
    end
  end
  object qryLstAux: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.conPrincipalKernel
    Left = 40
    Top = 112
  end
  object dspLstAux: TDataSetProvider
    DataSet = qryLstAux
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 120
    Top = 112
  end
  object dbdtstLstEmpresa: TfrxDBDataset
    UserName = 'dbdtstLstEmpresa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'EMP_EMPRESA=EMP_EMPRESA'
      'EMP_ENDERECO=EMP_ENDERECO'
      'EMP_BAIRRO=EMP_BAIRRO'
      'EMP_TELEFONE=EMP_TELEFONE'
      'EMP_EMAIL=EMP_EMAIL'
      'EMP_FANTASIA=EMP_FANTASIA'
      'EMP_NUMERO=EMP_NUMERO'
      'EMP_CIDADE=EMP_CIDADE'
      'EMP_ESTADO=EMP_ESTADO'
      'EMP_FAX=EMP_FAX'
      'EMP_SITE=EMP_SITE')
    DataSet = cdsLstEmpresa
    Left = 328
    Top = 112
  end
end
