object ViewMenu: TViewMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Menu'
  ClientHeight = 272
  ClientWidth = 214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 214
    Height = 249
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object cxVirtualVerticalGrid1: TcxVirtualVerticalGrid
      Left = 0
      Top = 0
      Width = 214
      Height = 243
      ParentCustomHint = False
      BorderStyle = cxcbsNone
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 15
      Font.Name = 'Tahoma'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      Images = cxImageList1
      OptionsView.AutoScaleBands = False
      OptionsView.RowHeaderWidth = 24
      OptionsBehavior.CellHints = False
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.BandSizing = False
      OptionsBehavior.HeaderSizing = False
      OptionsBehavior.RowTracking = False
      OptionsBehavior.AllowChangeRecord = False
      OptionsData.CancelOnExit = False
      OptionsData.Editing = False
      OptionsData.Appending = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsData.MultiThreadedFiltering = bFalse
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Enabled = False
      Navigator.Buttons.PriorPage.Enabled = False
      Navigator.Buttons.Prior.Enabled = False
      Navigator.Buttons.Next.Enabled = False
      Navigator.Buttons.NextPage.Enabled = False
      Navigator.Buttons.Last.Enabled = False
      Navigator.Buttons.Insert.Enabled = False
      Navigator.Buttons.Append.Enabled = False
      Navigator.Buttons.Delete.Enabled = False
      Navigator.Buttons.Edit.Enabled = False
      Navigator.Buttons.Post.Enabled = False
      Navigator.Buttons.Cancel.Enabled = False
      Navigator.Buttons.Refresh.Enabled = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.Filter.Enabled = False
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnMouseUp = cxVirtualVerticalGrid1MouseUp
      ExplicitTop = 1
      Version = 1
    end
  end
  object cxVirtualVerticalGrid2: TcxVirtualVerticalGrid
    Left = 0
    Top = 249
    Width = 214
    Height = 23
    BorderStyle = cxcbsNone
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 15
    Font.Name = 'Tahoma'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    Images = cxImageList1
    OptionsView.RowHeaderWidth = 24
    Navigator.Buttons.CustomButtons = <>
    ParentFont = False
    TabOrder = 1
    TabStop = False
    OnMouseUp = cxVirtualVerticalGrid2MouseUp
    Version = 1
  end
  object cxImageList1: TcxImageList
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = 1048600
    ImageInfo = <
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000646400FF6464
          00FF646400FF646400FF646400FF646400FF646400FF646400FF646400FF6464
          00FF646400FF646400FF646400FF646400FF646400FF646400FF646400FF6464
          00FF646400FF646400FF646400FF606000F53F3F00A10505000D656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF656500FF6565
          00FF646400FF656500FF656500FF656500FF656500FF656500FF656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF3F3F00A1656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF656500FF656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF656500FF656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF606000F5656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF656500FF656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF656500FF656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF656500FF8484
          31FF8D8D41FF8E8E41FF8E8E41FF8E8E41FF8E8E41FF83832FFF656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF398D6BFF6068
          09FF656500FF656500FF656500FF656500FF656500FF656500FF9A9A57FFFDFD
          FDFFFEFEFEFFF1F1E9FFBABA8CFFF3F3EBFFFEFEFEFFFDFDFDFF979752FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF00C4FFFF09BA
          E4FF46824BFF656500FF656500FF656500FF656500FF656500FFB2B27EFFFEFE
          FEFFFDFDFDFFB6B686FF656500FFB9B98CFFFEFEFEFFFEFEFEFFAFAF79FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF0DB6DAFF00C4
          FFFF00C3FDFF3C8B64FF656500FF656500FF656500FF646400FFB2B27EFFFEFE
          FEFFFDFDFDFFF0F0E7FFB6B686FFF1F1E9FFFEFEFEFFFEFEFEFFAFAF79FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF3E895EFF00C4
          FFFF00C4FFFF01C1F9FF53752AFF656500FF656500FF656500FFB2B27EFFE0E0
          CDFFB3B381FFB3B381FFB3B381FFB3B381FFB3B381FFE2E2CFFFAFAF79FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF46814AFF00C2
          FAFF00C4FFFF00C4FFFF25A09EFF656500FF656500FF656500FFB2B27EFF8C8C
          3EFF656500FF656500FF656500FF656500FF656500FF8F8F44FFAFAF79FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF378F70FF0DB6
          DBFF00C4FFFF00C4FFFF09B9E3FF646500FF656500FF646400FFB2B27EFF8B8B
          3DFF646400FF656500FF656500FF656500FF656500FF8E8E42FFAFAF79FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF2D9889FF15AF
          C6FF00C4FFFF00C4FFFF00C3FCFF606809FF656500FF656500FFB2B27EFF8B8B
          3DFF656500FF656500FF8C8C3FFF797920FF656500FF8E8E42FFAFAF79FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF2B9A8FFF17AD
          C1FF00C3FEFF00C3FEFF00C3FEFF5C6C13FF646400FF646400FFB2B27EFF8B8B
          3DFF646400FF646400FFA5A568FFFDFDFDFFB2B280FF8E8E42FFAFAF79FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF2C9A8DFF17AD
          C1FF00C3FEFF00C3FEFF00C3FEFF5C6C14FF646400FF646400FFB2B27EFF8B8B
          3DFF646400FF646400FF707012FFE4E4D3FFFDFDFDFFC5C59EFF9D9D5BFF6565
          00FF656500FF646400FF656500FF656500FF646400FF646400FF2D998BFF18AC
          BFFF00C3FEFF00C4FFFF00C4FFFF5D6B11FF646400FF646400FFB2B27EFF8B8B
          3DFF646400FF646400FF656500FF717114FFE1E1CDFFFDFDFDFFB8B889FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF2A9B92FF1DA7
          B1FF00C3FEFF00C3FEFF00C3FEFF5D6C12FF646400FF646400FFB2B27EFF8B8B
          3DFF646400FF646400FF656500FF656500FF6F6F0FFFDDDDC7FFFEFEFDFFBBBB
          8EFF656500FF656500FF656500FF656500FF656500FF646400FF20A4AAFF2B9A
          8FFF00C3FEFF00C3FEFF00C3FEFF567122FF646400FF646400FFB2B27EFF8B8B
          3DFF646400FF646400FF656500FF646400FF656500FF7B7B24FFDDDDC7FFFEFE
          FEFFBEBE92FF656500FF656500FF656500FF646400FF646400FF0BB8DFFF4682
          4BFF00C3FEFF00C4FFFF00C4FFFF478149FF646400FF646400FFB1B17CFFBBBB
          8EFF80802AFF80802AFF80802AFF80802AFF80802AFFBDBD92FFB0B07AFFD4D4
          B8FFFEFEFEFFABAB73FF666602FF656500FF656500FF646400FF00C3FEFF487E
          45FF10B3D3FF00C3FEFF00C3FEFF289D96FF646400FF646400FF7E7E28FFE2E2
          CFFFECECDFFFECECDFFFECECDFFFECECDFFFECECDFFFE1E1CDFF7C7C25FF6969
          06FFB5B584FFECECE0FF6F6F10FF656500FF656500FF646400FF00C3FEFF10B4
          D3FF4D7A39FF05BDEEFF00C3FEFF02C0F5FF577120FF646400FF646400FF6464
          00FF646400FF646400FF656500FF656500FF656500FF656500FF656500FF6565
          00FF686805FF727215FF656500FF656500FF656500FF646400FF1FA6AEFF00C3
          FDFF16AEC3FF4A7D40FF12B2CEFF00C3FEFF11B2D0FF5C6C14FF646400FF6464
          00FF646400FF646400FF656500FF656500FF656500FF656500FF656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF646400FF606000F55474
          28FF2D9889FF15AEC5FF378F70FF3B8C66FF14B0C8FF0BB8DFFF478047FF6465
          00FF646400FF646400FF656500FF656500FF656500FF656500FF656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF606000F53F3F00A16464
          00FF646400FF646500FF596F1CFF497E43FF5F690BFF567122FF3A8D6AFF398E
          6CFF51762EFF646400FF656500FF656500FF656500FF656500FF656500FF6565
          00FF656500FF656500FF656500FF656500FF656500FF3F3F00A10505000D4040
          00A1606000F5656500FF656500FF646400FF646400FF646400FF646400FF6464
          00FF646400FF646400FF656500FF656500FF656500FF656500FF656500FF6565
          00FF656500FF656500FF656500FF616100F5404000A10505000D}
        Mask.Data = {
          9E000000424D9E000000000000003E0000002800000018000000180000000100
          010000000000600000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000545352FF5453
          52FF545352FF545352FF545352FF545352FF545352FF545352FF545352FF5453
          52FF545352FF545352FF545352FF545352FF545352FF545352FF545352FF5453
          52FF545352FF545352FF545352FF51504FF5353434A10404040D555453FF5554
          53FF555453FF555453FF555453FF555453FF555453FF545353FF555453FF5554
          53FF545353FF555453FF555453FF555453FF555453FF555453FF555453FF5554
          53FF555453FF555453FF6D6C6CFF565554FF555453FF353434A1555352FF5554
          53FF545352FF555453FF555453FF545352FF545352FF545352FF545352FF5453
          52FF545352FF545352FF555453FF555453FF555453FF555453FF555453FF5554
          53FF555453FF818080FFF7F7F7FFB8B8B7FF555453FF51504FF5555453FF5553
          52FF555453FF555453FF555352FF555352FF555352FF555352FF555352FF5553
          52FF555352FF555352FF555453FF555453FF555453FF555453FF555453FF5554
          53FF818080FFF8F8F7FFFDFDFDFF969595FF555453FF545352FF555453FF5554
          53FF555453FF555453FF555453FF555453FF555453FF545353FF555453FF5554
          53FF545353FF5E5D5DFF959494FFB6B6B5FF686766FF555453FF555453FF8180
          80FFF8F8F7FFFDFDFDFF979695FF555453FF555453FF545352FF30849CFF5158
          59FF545352FF555453FF555453FF545352FF545352FF545352FF595857FF8B8B
          8AFFC7C6C6FFE6E6E6FF9A9A99FF666564FF8C8B8AFF81807EFF61605FFFF7F7
          F7FFFDFDFDFF979695FF555453FF555453FF555453FF545352FF00C4FFFF07B8
          EDFF3B7587FF555453FF555352FF555352FF6C6B6BFFBDBDBCFFE8E8E8FFBCBC
          BBFF81807EFF565554FF8F8E8EFFE7E7E6FFB7B6B6FFC7C6C6FFF4F4F3FFE3E3
          E3FF939291FF555453FF555453FF555453FF555453FF545352FF0BB4E6FF00C4
          FFFF00C3FDFF328198FF555453FF555453FFC8C7C7FFA5A5A4FF5E5D5CFF8584
          83FFABAAAAFF626160FFE7E7E7FF636362FF555453FF555453FF989796FFC1C1
          C1FF555453FF555453FF555453FF555453FF555453FF545352FF347D93FF00C4
          FFFF00C4FFFF00C1FBFF466770FF565554FFFCFCFCFFB1B1B0FFA9A9A8FFAAAA
          A9FF848383FF888887FFBAB9B9FF555453FF555453FF555453FF585756FFE9E9
          E9FF555453FF555453FF555453FF555453FF555453FF545352FF3B7486FF00C1
          FBFF00C4FFFF00C4FFFF1F9ABEFF555352FFE5E5E5FFEBEBEBFF797877FFD8D7
          D7FFA4A4A3FF7B7A7AFFCCCBCBFF646362FF555453FF61605FFF696867FFE0E0
          E0FF555453FF555453FF555453FF555453FF555453FF545352FF2E86A0FF0BB4
          E6FF00C4FFFF00C4FFFF08B8ECFF545453FFC2C2C2FFF2F2F2FF80807EFFA2A2
          A1FFD1D1D0FF605F5EFFD8D8D8FFC1C1C0FFA9A9A8FFB1B0B0FFD4D4D3FF9897
          96FF555453FF555453FF555453FF555453FF555453FF545352FF2690B0FF11AB
          D9FF00C4FFFF00C4FFFF00C2FDFF51585AFFA09F9FFFD9D9D9FFBBBBBAFF8887
          86FF9E9D9CFFB2B2B1FF636261FFBCBCBBFFE7E7E7FFDEDEDEFF969695FF5554
          53FF555453FF555453FF555453FF555453FF555453FF545352FF2493B4FF13A9
          D5FF00C3FEFF00C3FEFF00C3FEFF4D5D60FF7C7B7AFFCBCACAFFE8E8E8FF8B8A
          89FF9E9D9DFF979696FFB8B8B7FF787776FF555453FF656463FF8D8C8CFF8483
          82FF555453FF555453FF555453FF555453FF555453FF545352FF2592B2FF13A9
          D5FF00C3FEFF00C3FEFF00C3FEFF4D5D61FF5C5B5AFFE4E4E4FFBEBEBEFF9493
          93FFD0D0CFFFA8A8A7FF959594FFAFAFAFFFD6D6D6FFB7B7B6FF848382FFC4C4
          C3FF545352FF545353FF555352FF545352FF545353FF545352FF2591B1FF14A8
          D4FF00C3FEFF00C4FFFF00C4FFFF4E5B5FFF545352FFDFDFDFFF908F8FFFC5C4
          C4FFA1A0A0FFD8D7D7FFB5B5B4FF807E7DFF575655FF5B5A59FF919190FFE0E0
          DFFF555453FF555453FF555453FF555453FF555453FF545352FF2394B5FF19A2
          CBFF00C3FEFF00C3FEFF00C3FEFF4E5C60FF545352FFBEBDBDFF868585FFE7E7
          E7FF686867FF555453FF575655FF848483FFC0BFBFFFF4F4F4FFCDCDCCFF7372
          71FF555453FF555453FF555453FF555453FF555453FF545352FF1B9FC6FF2493
          B4FF00C3FEFF00C3FEFF00C3FEFF49636AFF545352FF9B9A9AFFA7A6A6FFB4B4
          B4FFAFAEAEFFB6B6B5FFE7E7E7FFC5C4C4FFA09F9EFFBFBFBEFF9F9F9EFF5553
          52FF545352FF545353FF555352FF545352FF545353FF545352FF09B6E9FF3A75
          87FF00C3FEFF00C4FFFF00C4FFFF3B7485FF545352FF777676FFCBCBCBFF7776
          75FFECECECFFEAEAEAFFD9D9D8FFE9E9E9FFD5D4D4FFB1B0B0FF626160FF5554
          53FF555453FF555453FF555453FF555453FF555453FF545352FF00C3FEFF3D72
          82FF0DB0E1FF00C3FEFF00C3FEFF2296B8FF545352FF575655FFCECDCDFFD9D9
          D9FFB7B6B6FF949393FF706F6EFF565554FF555453FF555453FF555453FF5554
          53FF555453FF555453FF555453FF555453FF555453FF545352FF00C3FEFF0DB1
          E1FF416D7AFF04BCF3FF00C3FEFF02BFF8FF496269FF545352FF545352FF5453
          52FF545352FF545352FF555453FF555453FF555453FF555453FF555453FF5554
          53FF555453FF555453FF555453FF555453FF555453FF545352FF1AA0C9FF00C3
          FEFF12AAD7FF3E707EFF0FAEDEFF00C3FEFF0EAFDFFF4D5D61FF545352FF5453
          52FF545352FF545352FF555453FF555453FF555453FF555453FF555453FF5554
          53FF555453FF555453FF555453FF555453FF555453FF545352FF51504FF54666
          6EFF2690B0FF12ABD8FF2E86A0FF318299FF11ACDAFF09B6E9FF3C7384FF5454
          53FF545352FF545352FF555453FF555453FF555453FF555453FF555453FF5554
          53FF555453FF555453FF555453FF555453FF555453FF51504FF5353434A15453
          52FF545352FF545453FF4A6066FF3D7282FF50595BFF49636AFF30839BFF3084
          9DFF446872FF545352FF555453FF555453FF555453FF555453FF555453FF5554
          53FF555453FF555453FF555453FF555453FF555453FF353434A10404040D3635
          34A151504FF5555453FF555453FF545352FF545352FF545352FF545352FF5453
          52FF545352FF545352FF555453FF555453FF555453FF555453FF555453FF5554
          53FF555453FF555453FF555453FF525150F5363534A10404040D}
        Mask.Data = {
          9E000000424D9E000000000000003E0000002800000018000000180000000100
          010000000000600000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0007B8FD0000C1FF0000C1FF0000C1FF0000C1
          FF0000C1FF0000C1FF0000C1FF00FF00FF00FF00FF0039CFFF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0007BBFD0000C4FF0000C4FF0000C4FF0001C5
          FF0018CAFF0033D0FF004DD6FF00FF00FF00FF00FF0052D7FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0007BBFD0002C5FF001CCBFF003AD2FF004CD6
          FF0052D7FF0052D7FF0052D7FF00FF00FF00FF00FF0049D5FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0036C5FE004CD6FF0052D7FF0052D7FF0049D5
          FF0049D5FF0049D5FF0049D5FF00FF00FF00FF00FF0040D3FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF004CC6FD0049D5FF0049D5FF0049D5FF0040D3
          FF0040D3FF0040D3FF0040D3FF00FF00FF00FF00FF0037D1FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0040D3FF0040D3FF0040D3FF0040D3FF0037D1
          FF0037D1FF0037D1FF0037D1FF00FF00FF00FF00FF002ECFFF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0040D3FF0037D1FF0037D1FF0037D1FF002ECF
          FF002ECFFF002ECFFF002ECFFF00FF00FF00FF00FF0025CDFF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0040D3FF002ECFFF002ECFFF002ECFFF0025CD
          FF0025CDFF0025CDFF0025CDFF00FF00FF00FF00FF001CCBFF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0040D3FF0025CDFF0025CDFF0025CDFF001CCB
          FF001CCBFF001CCBFF001CCBFF00FF00FF00FF00FF0013C9FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF001CC7FF001CCBFF001CCBFF0013C9
          FF0013C9FF0013C9FF0013C9FF00FF00FF00FF00FF0000C4FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0013C9FF0013C9FF000AC7
          FF000AC7FF000AC7FF000AC7FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000AC4FF000AC7FF0000C4
          FF0000C4FF0000C4FF0000C4FF0000C4FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000C4FF0000C4FF0000C4
          FF0000C4FF0000C4FF0000C4FF0000C4FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000C4FF0000C4
          FF0000C4FF0000C4FF0000C4FF0000C4FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000C4
          FF0000C4FF0000C4FF0000C4FF0000C4FF0000C4FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000C4FF0000C4FF0000C4FF0000C4FF0000C4FF0000C4FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000C3FE0000C4FF0000C4FF0000C4FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000C3FE0000C4FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end>
  end
end
