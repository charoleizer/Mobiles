inherited ViewLogin: TViewLogin
  Caption = 'Login'
  ClientHeight = 262
  ClientWidth = 204
  OnCreate = nil
  OnDestroy = nil
  ExplicitWidth = 220
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 204
    Height = 262
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 206
    ExplicitHeight = 253
    object EdtUserName: TEditText
      Left = 29
      Top = 62
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
      Left = 29
      Top = 118
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
      Left = 19
      Top = 181
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnCancel: TButton
      Left = 108
      Top = 181
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = BtnCancelClick
    end
  end
end
