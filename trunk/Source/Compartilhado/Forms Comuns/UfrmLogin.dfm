object frmLogin: TfrmLogin
  Left = 358
  Top = 270
  AlphaBlend = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Login...'
  ClientHeight = 394
  ClientWidth = 529
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 350
    Top = 204
    Width = 41
    Height = 13
    Caption = 'Senha :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 350
    Top = 158
    Width = 49
    Height = 13
    Caption = 'Usuario :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object imgLogo: TImage
    Left = 328
    Top = 8
    Width = 193
    Height = 113
    Stretch = True
  end
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 36
    Height = 16
    Caption = 'Linha'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 22
    Width = 274
    Height = 44
    Caption = 'VAPBUSINESS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Castellar'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object edtPSW: TEdit
    Left = 350
    Top = 220
    Width = 155
    Height = 19
    BevelInner = bvNone
    BevelKind = bkTile
    BevelOuter = bvSpace
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    OnKeyDown = edtPSWKeyDown
  end
  object edtNOMFUN: TEdit
    Left = 350
    Top = 179
    Width = 155
    Height = 19
    BevelInner = bvNone
    BevelKind = bkTile
    BevelOuter = bvSpace
    CharCase = ecUpperCase
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnKeyDown = edtNOMFUNKeyDown
  end
  object statBase: TStatusBar
    Left = 0
    Top = 375
    Width = 529
    Height = 19
    Panels = <
      item
        Text = 'Tentativa :'
        Width = 134
      end
      item
        Alignment = taCenter
        Text = '0'
        Width = 134
      end
      item
        Text = 'M'#225'ximo de Tentativas'
        Width = 134
      end
      item
        Alignment = taCenter
        Text = '0'
        Width = 134
      end>
  end
end
