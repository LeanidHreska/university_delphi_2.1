object Form1: TForm1
  Left = 222
  Top = 138
  Width = 870
  Height = 533
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 8
    Top = 8
    Width = 841
    Height = 289
    DataSource = DM.TrainData
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator: TDBNavigator
    Left = 224
    Top = 368
    Width = 330
    Height = 33
    DataSource = DM.TrainData
    TabOrder = 1
  end
  object addButton: TButton
    Left = 128
    Top = 320
    Width = 113
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = addButtonClick
  end
  object editButton: TButton
    Left = 264
    Top = 320
    Width = 113
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    OnClick = editButtonClick
  end
  object deleteButton: TButton
    Left = 392
    Top = 320
    Width = 113
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 4
    OnClick = deleteButtonClick
  end
  object insertButton: TButton
    Left = 528
    Top = 320
    Width = 113
    Height = 25
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Left = 704
    Top = 176
    object N1: TMenuItem
      Caption = #1055#1086#1077#1079#1076#1072
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1072#1089#1089#1072#1078#1080#1088#1099
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1041#1072#1075#1072#1078
      OnClick = N3Click
    end
  end
end
