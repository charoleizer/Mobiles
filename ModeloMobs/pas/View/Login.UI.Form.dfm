inherited ViewLogin: TViewLogin
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 272
  ClientWidth = 214
  OnCreate = nil
  OnDestroy = nil
  ExplicitWidth = 220
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 214
    Height = 272
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object EdtUserName: TEditText
      Left = 34
      Top = 56
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      Enabled = True
      TabOrder = 0
      BtnConsult = False
      BtnRegist = False
      Caption = 'User Name:'
      LabelPosition = lpAbove
    end
    object EdtPassword: TEditText
      Left = 34
      Top = 112
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      Enabled = True
      PasswordChar = '*'
      TabOrder = 1
      BtnConsult = False
      BtnRegist = False
      Caption = 'Password:'
      LabelPosition = lpAbove
    end
    object BtnOk: TButton
      Left = 24
      Top = 203
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnCancel: TButton
      Left = 113
      Top = 203
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = BtnCancelClick
    end
  end
end
