object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 262
  ClientWidth = 204
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 204
    Height = 221
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitWidth = 195
    ExplicitHeight = 217
  end
  object Panel2: TPanel
    Left = 0
    Top = 221
    Width = 204
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    ExplicitTop = 217
    ExplicitWidth = 195
    object Button1: TButton
      Left = 64
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
