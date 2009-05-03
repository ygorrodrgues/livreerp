inherited dmKernel_Relatorio: TdmKernel_Relatorio
  OldCreateOrder = True
  Height = 233
  Width = 417
  object rprtCadBase: TfrxReport
    Version = '4.7.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39886.627655694400000000
    ReportOptions.LastChange = 39933.562989907400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 112
    Top = 64
    Datasets = <
      item
        DataSet = dmFechConv.dtstLstFechamento
        DataSetName = 'dtstLstFechamento'
      end
      item
        DataSet = dmFechConv.dtstPesqProcPrimario
        DataSetName = 'dtstPesqProcPrimario'
      end
      item
        DataSet = dmFechConv.dtstPesqProcSecundario
        DataSetName = 'dtstPesqProcSecundario'
      end
      item
        DataSet = dmFechConv.dtstRelFechConv
        DataSetName = 'dtstRelFechConv'
      end>
    Variables = <>
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
        Height = 139.842610000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 275.905690000000000000
          Top = 34.015770000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Memo.UTF8 = (
            'RELAT'#195#8220'RIO DE MOVIMENTA'#195#8225#195#402'O')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 4.118120000000000000
          Top = 60.472480000000000000
          Width = 563.149970000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 566.929500000000000000
          Top = 60.472480000000000000
          Width = 222.992270000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Left = 7.559060000000000000
          Width = 260.787570000000000000
          Height = 56.692950000000000000
          ShowHint = False
          HightQuality = False
        end
        object dtstLstFechamentoDATAHORAFECH: TfrxMemoView
          Left = 684.094930000000000000
          Top = 64.252010000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'DATAHORAFECH'
          DataSet = dmFechConv.dtstLstFechamento
          DataSetName = 'dtstLstFechamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstLstFechamento."DATAHORAFECH"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 576.268090000000000000
          Top = 66.031540000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Data/Hora Gera'#195#167#195#163'o:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 576.268090000000000000
          Top = 82.929190000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Fechamento n:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 576.268090000000000000
          Top = 98.267780000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'In'#195#173'cio do Per'#195#173'odo:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 576.268090000000000000
          Top = 116.385900000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Final do Per'#195#173'odo:')
          ParentFont = False
        end
        object dtstLstFechamentoCRFECH: TfrxMemoView
          Left = 684.094930000000000000
          Top = 81.629973330000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'CRFECH'
          DataSet = dmFechConv.dtstLstFechamento
          DataSetName = 'dtstLstFechamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstLstFechamento."CRFECH"]')
          ParentFont = False
        end
        object dtstLstFechamentoDATAINIC: TfrxMemoView
          Left = 684.094930000000000000
          Top = 99.007936670000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'DATAINIC'
          DataSet = dmFechConv.dtstLstFechamento
          DataSetName = 'dtstLstFechamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstLstFechamento."DATAINIC"]')
          ParentFont = False
        end
        object dtstLstFechamentoDATAFINA: TfrxMemoView
          Left = 684.094930000000000000
          Top = 116.385900000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'DATAFINA'
          DataSet = dmFechConv.dtstLstFechamento
          DataSetName = 'dtstLstFechamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstLstFechamento."DATAFINA"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 6.559060000000000000
          Top = 65.708720000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'REGISTROS:')
          ParentFont = False
        end
        object dtstRelFechConvIDPESSJURI: TfrxMemoView
          Left = 116.181200000000000000
          Top = 65.708720000000000000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."IDPESSJURI"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 80.606370000000000000
          Top = 65.708720000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'CRE.:')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 151.094620000000000000
          Top = 65.708720000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'CNPJ.:')
          ParentFont = False
        end
        object dtstRelFechConvCNPJ: TfrxMemoView
          Left = 189.346630000000000000
          Top = 65.708720000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'CNPJ'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."CNPJ"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 275.937230000000000000
          Top = 65.708720000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Ins. Estadual.:')
          ParentFont = False
        end
        object dtstRelFechConvINSCESTA: TfrxMemoView
          Left = 347.968770000000000000
          Top = 65.708720000000000000
          Width = 86.929165590000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'INSCESTA'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."INSCESTA"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 6.559060000000000000
          Top = 88.929190000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'EMPRESA:')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 6.559060000000000000
          Top = 112.047310000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'ENDERE'#195#8225'O:')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 434.645950000000000000
          Top = 65.708720000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Ins. Mun.:')
          ParentFont = False
        end
        object dtstRelFechConvINSCMUNI: TfrxMemoView
          Left = 495.897960000000000000
          Top = 65.708720000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'INSCMUNI'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."INSCMUNI"]')
          ParentFont = False
        end
        object dtstRelFechConvPESSJURI: TfrxMemoView
          Left = 98.267780000000000000
          Top = 88.929190000000000000
          Width = 461.102635590000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'PESSJURI'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."PESSJURI"]')
          ParentFont = False
        end
        object dtstRelFechConvENDEPESSJURI: TfrxMemoView
          Left = 98.267780000000000000
          Top = 112.047310000000000000
          Width = 241.889920000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[dtstRelFechConv."ENDEPESSJURI"] , [dtstRelFechConv."NUMEPESSJUR' +
              'I"] - [dtstRelFechConv."BAIRPESSJURI"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 374.173470000000000000
        Width = 793.701300000000000000
        DataSet = dmFechConv.dtstRelFechConv
        DataSetName = 'dtstRelFechConv'
        RowCount = 0
        object dtstRelFechConvDATAABERTPRIM: TfrxMemoView
          Left = 115.385900000000000000
          Top = 2.000000000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DATAABERTPRIM'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."DATAABERTPRIM"]')
          ParentFont = False
        end
        object dtstRelFechConvDATACONCLPRIM: TfrxMemoView
          Left = 236.551330000000000000
          Top = 1.779530000000020000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DATACONCLPRIM'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."DATACONCLPRIM"]')
          ParentFont = False
        end
        object dtstRelFechConvPROCEDIMENTO: TfrxMemoView
          Left = 340.157700000000000000
          Width = 411.968647950000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'PROCEDIMENTO'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."PROCEDIMENTO"]')
          ParentFont = False
        end
        object dtstRelFechConvCRPMS: TfrxMemoView
          Left = 45.354360000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CRPMS'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."CRPMS"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 37.795300000000000000
        Top = 627.401980000000000000
        Width = 793.701300000000000000
        object Memo10: TfrxMemoView
          Left = 7.559060000000000000
          Top = 18.000000000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAL DE PROCEDIMENTOS SECUND'#195#129'RIOS: [count(MasterData1)]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 60.472480000000000000
        Top = 219.212740000000000000
        Width = 793.701300000000000000
        Condition = 'dtstRelFechConv."CRPMPA"'
        object Memo9: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779529999999990000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'PROCEDIMENTO PRIM'#195#129'RIO (C'#195#8220'D. e DESCRI'#195#8225#195#402'O) ==>')
          ParentFont = False
        end
        object dtstRelFechConvDESCPMPA: TfrxMemoView
          Left = 480.000310000000000000
          Top = 4.000000000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DESCPMPA'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Memo.UTF8 = (
            '[dtstRelFechConv."DESCPMPA"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 7.559060000000000000
          Top = 37.795300000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'PMP:')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 62.252010000000000000
          Top = 37.795300000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'ABERTURA')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 155.181200000000000000
          Top = 37.795300000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'CONCLUS'#195#402'O')
          ParentFont = False
        end
        object dtstRelFechConvCRPMPA: TfrxMemoView
          Left = 389.291590000000000000
          Top = 3.779529999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CRPMPA'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Memo.UTF8 = (
            '[dtstRelFechConv."CRPMPA"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 260.787570000000000000
          Top = 37.795300000000000000
          Width = 83.149635590000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'RG / UF:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 347.716760000000000000
          Top = 37.795300000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'FUNCION'#195#129'RIO:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 623.622450000000000000
          Top = 37.795300000000000000
          Width = 166.299271180000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'CBP, CARGO e FUN'#195#8225#195#402'O:')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 6.338590000000000000
          Top = 28.456710000000000000
          Width = 774.803650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 6.559060000000000000
          Top = 58.692950000000000000
          Width = 774.803650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 49.133890000000000000
        Top = 302.362400000000000000
        Width = 793.701300000000000000
        Condition = 'dtstRelFechConv."PRIMNOME"'
        object dtstRelFechConvCRPMP: TfrxMemoView
          Left = 7.559060000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CRPMP'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."CRPMP"]')
          ParentFont = False
        end
        object dtstRelFechConvRGUF: TfrxMemoView
          Left = 260.787570000000000000
          Width = 83.149635590000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'RGUF'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."RGUF"]')
          ParentFont = False
        end
        object dtstRelFechConvPRIMNOME: TfrxMemoView
          Left = 347.716760000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'PRIMNOME'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."PRIMNOME"]')
          ParentFont = False
        end
        object dtstRelFechConvDATAABERT: TfrxMemoView
          Left = 62.252010000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DATAABERT'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."DATAABERT"]')
          ParentFont = False
        end
        object dtstRelFechConvDATACONCL: TfrxMemoView
          Left = 155.181200000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DATACONCL'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."DATACONCL"]')
          ParentFont = False
        end
        object dtstRelFechConvFUNC: TfrxMemoView
          Left = 623.622450000000000000
          Width = 166.299271180000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'FUNC'
          DataSet = dmFechConv.dtstRelFechConv
          DataSetName = 'dtstRelFechConv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstRelFechConv."FUNC"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 45.354360000000000000
          Top = 26.456710000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'PMP:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 115.385900000000000000
          Top = 26.456710000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'ABERTURA')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 236.551330000000000000
          Top = 26.456710000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'CONCLUS'#195#402'O')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 340.937230000000000000
          Top = 25.677180000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'PROCEDIMENTO COMPLEMENTARES (DESCRI'#195#8225#195#402'O)')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 44.220470000000000000
          Top = 47.338590000000000000
          Width = 725.669760000001000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 30.236240000000000000
        Top = 419.527830000000000000
        Width = 793.701300000000000000
        object Memo13: TfrxMemoView
          Left = 7.559060000000000000
          Top = 1.779530000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAL DE PROCEDIMENTOS SECUND'#195#129'RIOS: [count(MasterData1)]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 7.559060000000000000
          Width = 774.803650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 34.015770000000000000
        Top = 687.874460000000000000
        Width = 793.701300000000000000
        object Memo11: TfrxMemoView
          Left = 6.338590000000000000
          Top = 1.677180000000020000
          Width = 774.803650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 184.976500000000000000
          Top = 4.456710000000000000
          Width = 453.543600000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              'NOBRE ASSESSORIA EM SEGURAN'#195#8225'A E SAUDE OCUPACIONAL - 03.603.223/' +
              '0001-31'
            'RUA 24 DE MAIO, 220 - CENTRO - Fone/Fax: (92)32347790')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 22.677180000000000000
        Top = 544.252320000000000000
        Width = 793.701300000000000000
        DataSet = dmFechConv.dtstPesqProcSecundario
        DataSetName = 'dtstPesqProcSecundario'
        RowCount = 0
        object dtstPesqProcSecundarioDESCPMPA: TfrxMemoView
          Left = 7.559060000000000000
          Top = 1.220470000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'PROCEDIMENTO'
          DataSet = dmFechConv.dtstPesqProcSecundario
          DataSetName = 'dtstPesqProcSecundario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstPesqProcSecundario."PROCEDIMENTO"]')
          ParentFont = False
        end
        object dtstPesqProcSecundarioContarDeCRPMP: TfrxMemoView
          Left = 319.260050000000000000
          Top = 2.000000000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'crpmp'
          DataSet = dmFechConv.dtstPesqProcSecundario
          DataSetName = 'dtstPesqProcSecundario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dtstPesqProcSecundario."crpmp"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 49.133890000000000000
        Top = 472.441250000000000000
        Width = 793.701300000000000000
        object Memo34: TfrxMemoView
          Left = 7.559060000000000000
          Top = 26.456710000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Descri'#195#167#195#163'o do(s) Procedimento(s)')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 317.480520000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Quantidade')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 774.803650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
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
    TemplateDir = 
      'D:\Setores\Desenvolvimento\Sistemas\Trabalho\Framework\Relatorio' +
      's_Template'
    Restrictions = []
    RTLLanguage = False
    Left = 184
    Top = 64
  end
end
