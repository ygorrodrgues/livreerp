object frmKernel_Sobre: TfrmKernel_Sobre
  Left = 417
  Top = 264
  BorderStyle = bsDialog
  Caption = 'Sobre o Sistema'
  ClientHeight = 264
  ClientWidth = 543
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 543
    Height = 264
    Align = alClient
    Color = clWindow
    TabOrder = 0
    object lblempresa: TRzLabel
      Left = 24
      Top = 216
      Width = 169
      Height = 26
      Caption = 'Vap Inform'#225'tica'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      FlyByColor = clBtnShadow
      TextStyle = tsRecessed
    end
    object lblsistema: TRzLabel
      Left = 256
      Top = 23
      Width = 184
      Height = 26
      Caption = 'VapGestLicita'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      FlyByColor = clBtnShadow
      TextStyle = tsRaised
    end
    object JvLinkLabel1: TJvLinkLabel
      Left = 256
      Top = 204
      Width = 201
      Height = 16
      Caption = 'www.vapinformatica.com.br'#13#10
      Text.Strings = (
        'www.vapinformatica.com.br'#13#10)
      LinkStyle = [fsBold, fsUnderline]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imgLogo: TImage
      Left = 16
      Top = 15
      Width = 217
      Height = 195
      Stretch = True
    end
    object Panel2: TPanel
      Left = 256
      Top = 59
      Width = 278
      Height = 139
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label5: TLabel
        Left = 8
        Top = 23
        Width = 73
        Height = 16
        Caption = 'EMPRESA: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label8: TLabel
        Left = 8
        Top = 63
        Width = 66
        Height = 16
        Caption = 'USU'#193'RIO: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lblsenharegistro: TLabel
        Left = 8
        Top = 117
        Width = 119
        Height = 16
        Caption = '11111111111111111'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblcliente: TLabel
        Left = 8
        Top = 41
        Width = 112
        Height = 16
        Caption = 'MAPEMI do Brasil'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblnomeusu: TLabel
        Left = 8
        Top = 79
        Width = 74
        Height = 16
        Caption = 'lblnomeusu'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 8
        Top = 101
        Width = 143
        Height = 16
        Caption = 'Identifica'#231#227'o do Produto:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 274
        Height = 16
        Align = alTop
        BevelInner = bvSpace
        BevelOuter = bvNone
        Color = 14803937
        TabOrder = 0
        object Label6: TLabel
          Left = 16
          Top = 35
          Width = 37
          Height = 16
          Caption = 'www.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label7: TLabel
          Left = 1
          Top = 1
          Width = 272
          Height = 14
          Align = alClient
          Alignment = taCenter
          Caption = 'Este produto est'#225' Licenciado para:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitWidth = 191
          ExplicitHeight = 15
        end
      end
    end
  end
end
