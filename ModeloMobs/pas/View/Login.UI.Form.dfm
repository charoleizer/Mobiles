inherited ViewLogin: TViewLogin
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 272
  ClientWidth = 214
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
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object EdtUserName: TEditText
      Left = 34
      Top = 72
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
      Top = 126
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
    object BtnSignIn: TcxButton
      Left = 34
      Top = 184
      Width = 145
      Height = 25
      Caption = 'SignIn'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'UserSkin'
      TabOrder = 2
      OnClick = BtnSignInClick
    end
  end
end
