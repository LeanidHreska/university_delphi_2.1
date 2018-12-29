object Form1: TForm1
  Left = 222
  Top = 138
  Width = 870
  Height = 533
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 19
  object PriceOfAllSoldTicketsLabel: TLabel
    Left = 8
    Top = 32
    Width = 253
    Height = 19
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1074#1089#1077#1093' '#1087#1088#1086#1076#1072#1085#1085#1099#1093' '#1073#1080#1083#1077#1090#1086#1074': '
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object PriceOfAllSoldTicketsValueLabel: TLabel
    Left = 264
    Top = 32
    Width = 9
    Height = 21
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object SoldTicketsQuantityLabel: TLabel
    Left = 392
    Top = 32
    Width = 226
    Height = 19
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1086#1076#1072#1085#1085#1099#1093' '#1073#1080#1083#1077#1090#1086#1074': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object SoldTicketsQuantityLabelValue: TLabel
    Left = 632
    Top = 32
    Width = 8
    Height = 19
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 56
    Width = 841
    Height = 289
    DataSource = DM.TrainData
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = []
  end
  object DBNavigator: TDBNavigator
    Left = 224
    Top = 400
    Width = 330
    Height = 33
    DataSource = DM.TrainData
    TabOrder = 1
  end
  object addButton: TButton
    Left = 128
    Top = 352
    Width = 113
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = addButtonClick
  end
  object editButton: TButton
    Left = 264
    Top = 352
    Width = 113
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    OnClick = editButtonClick
  end
  object deleteButton: TButton
    Left = 392
    Top = 352
    Width = 113
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 4
    OnClick = deleteButtonClick
  end
  object insertButton: TButton
    Left = 528
    Top = 352
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
