inherited frmKernel_RegistroLicenca: TfrmKernel_RegistroLicenca
  Caption = 'frmKernel_RegistroLicenca'
  ClientHeight = 428
  ClientWidth = 536
  Color = clWhite
  ExplicitWidth = 552
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 113
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 0
    object imgLogo: TImage
      Left = 389
      Top = 2
      Width = 145
      Height = 109
      Align = alRight
      ExplicitLeft = 248
      ExplicitTop = 0
      ExplicitHeight = 113
    end
    object Label1: TLabel
      Left = 46
      Top = 11
      Width = 179
      Height = 90
      Caption = 'Libera'#231#227'o'#13#10'do Sistema'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 336
    Width = 536
    Height = 92
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 80
      Height = 13
      Caption = 'CHAVE UNICA :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 256
      Top = 14
      Width = 103
      Height = 13
      Caption = 'TEMPO RESTANTE :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 39
      Width = 93
      Height = 13
      Caption = 'CONTRA CHAVE'#39' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 104
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 392
      Top = 8
      Width = 131
      Height = 21
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 115
      Top = 35
      Width = 408
      Height = 21
      TabOrder = 2
      Text = 'Edit3'
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 64
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 3
    end
    object BitBtn2: TBitBtn
      Left = 448
      Top = 62
      Width = 75
      Height = 25
      Caption = 'BitBtn2'
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 113
    Width = 536
    Height = 223
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 2
  end
end
