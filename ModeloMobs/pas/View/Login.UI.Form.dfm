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
    object BtnSignIn: TcxButton
      Left = 34
      Top = 176
      Width = 145
      Height = 25
      Caption = 'SignIn'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'UserSkin'
      TabOrder = 2
      OnClick = BtnSignInClick
    end
    object EdtUserName: TEdit
      Left = 34
      Top = 74
      Width = 145
      Height = 21
      TabOrder = 0
      TextHint = 'User Name'
    end
    object EdtPassword: TEdit
      Left = 34
      Top = 101
      Width = 145
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      TextHint = 'Password'
    end
  end
end
