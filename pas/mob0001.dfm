object FrmMob0001: TFrmMob0001
  Left = 466
  Top = 276
  Width = 197
  Height = 202
  VertScrollBar.Range = 41
  ActiveControl = EdtSnh
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados de Acesso'
  Color = clBtnFace
  ParentFont = True
  KeyPreview = True
  OldCreateOrder = True
  Position = poMainFormCenter
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 191
    Height = 149
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 0
    object Bevel1: TBevel
      Left = 5
      Top = 5
      Width = 181
      Height = 139
      Align = alClient
      Shape = bsFrame
      ExplicitWidth = 173
      ExplicitHeight = 138
    end
    object LblUsr: TLabel
      Left = 15
      Top = 10
      Width = 100
      Height = 13
      AutoSize = False
      Caption = 'Usu'#225'rio:'
      Transparent = False
    end
    object LblSnh: TLabel
      Left = 15
      Top = 54
      Width = 100
      Height = 13
      AutoSize = False
      Caption = 'Senha:'
      Transparent = False
    end
    object LblEmp: TLabel
      Left = 15
      Top = 98
      Width = 100
      Height = 13
      AutoSize = False
      Caption = 'Empresa:'
      Transparent = False
    end
    object EdtUsr: TEdit
      Left = 15
      Top = 25
      Width = 161
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = ControlChange
    end
    object EdtSnh: TEdit
      Left = 15
      Top = 69
      Width = 161
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      OnChange = ControlChange
    end
    object EdtEmp: TEdit
      Left = 15
      Top = 113
      Width = 161
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnChange = ControlChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 149
    Width = 191
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 112
      Top = 0
      Width = 79
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BtnFechar: TBitBtn
        AlignWithMargins = True
        Left = 46
        Top = 0
        Width = 30
        Height = 22
        Margins.Top = 0
        Align = alRight
        Cancel = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
          F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
          000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
          338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
          45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
          3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
          F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
          000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
          338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
          4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
          8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
          333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
          0000}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = BtnFecharClick
      end
      object BtnOk: TBitBtn
        AlignWithMargins = True
        Left = 10
        Top = 0
        Width = 30
        Height = 22
        Margins.Top = 0
        Align = alRight
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = BtnOkClick
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 6
    Top = 146
  end
end
