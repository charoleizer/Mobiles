inherited ViewLogin: TViewLogin
  Caption = 'Login'
  ClientHeight = 253
  ClientWidth = 206
  OnCreate = nil
  OnDestroy = nil
  ExplicitWidth = 222
  ExplicitHeight = 291
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 206
    Height = 253
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object EditText1: TEditText
      Left = 26
      Top = 65
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      Enabled = True
      TabOrder = 0
      BtnConsult = False
      BtnRegist = False
      Caption = 'Login:'
      LabelPosition = lpAbove
    end
    object EditText2: TEditText
      Left = 26
      Top = 121
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      Enabled = True
      TabOrder = 1
      BtnConsult = False
      BtnRegist = False
      Caption = 'Password:'
      LabelPosition = lpAbove
    end
    object Button1: TButton
      Left = 16
      Top = 184
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
    end
    object Button2: TButton
      Left = 105
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
end
