inherited frmLogin: TfrmLogin
  Caption = 'frmLogin'
  OnClick = actConfirmarExecute
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFudo: TPanel
    inherited lbldata: TLabel
      Left = 0
      ExplicitLeft = 0
    end
    inherited cbbNomeUsuario: TComboBox
      Text = ''
    end
  end
  inherited tmrTempo: TTimer
    Top = 3
  end
  inherited actlstLogin: TActionList
    Top = 0
  end
  inherited ilLogin: TImageList
    Top = 8
  end
end
