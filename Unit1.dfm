object Form1: TForm1
  Left = 347
  Top = 131
  Width = 870
  Height = 533
  Caption = 'Form1'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 19
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
    Left = 208
    Top = 400
    Width = 340
    Height = 33
    DataSource = DM.TrainData
    TabOrder = 1
  end
  object addButton: TButton
    Left = 192
    Top = 360
    Width = 113
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = addButtonClick
  end
  object editButton: TButton
    Left = 320
    Top = 360
    Width = 113
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    OnClick = editButtonClick
  end
  object deleteButton: TButton
    Left = 448
    Top = 360
    Width = 113
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 4
    OnClick = deleteButtonClick
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
  object MainMenu: TMainMenu
    Left = 64
    Top = 416
    object N4: TMenuItem
      Caption = #1055#1086#1080#1089#1082
      object N5: TMenuItem
        Caption = #1055#1086#1077#1079#1076#1072
        OnClick = N5Click
      end
      object N12: TMenuItem
        Caption = #1055#1072#1089#1089#1072#1078#1080#1088#1099
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #1041#1072#1075#1072#1078
        OnClick = N13Click
      end
    end
    object N7: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object N8: TMenuItem
        Caption = #1053#1086#1084#1077#1088' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080' ('#1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102')'
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1053#1086#1084#1077#1088' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080' ('#1087#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102')'
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103' ('#1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102')'
        OnClick = N10Click
      end
      object C1: TMenuItem
        Caption = 'C'#1090#1086#1080#1084#1086#1089#1090#1100' '#1073#1080#1083#1077#1090#1072' ('#1087#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102')'
        OnClick = C1Click
      end
    end
    object N11: TMenuItem
      Caption = #1047#1072#1087#1088#1086#1089#1099
      OnClick = N11Click
    end
    object N14: TMenuItem
      Caption = #1054#1090#1095#1105#1090#1099
      object N15: TMenuItem
        Caption = #1055#1086#1077#1079#1076#1072
        OnClick = N15Click
      end
      object N16: TMenuItem
        Caption = #1055#1072#1089#1089#1072#1078#1080#1088#1099' ('#1079#1072#1087#1088#1086#1089')'
        OnClick = N16Click
      end
      object N17: TMenuItem
        Caption = #1043#1088#1091#1087#1087#1086#1074#1086#1081' '#1086#1090#1095#1105#1090
        OnClick = N17Click
      end
    end
    object N6: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1074#1089#1077' '#1092#1080#1083#1100#1090#1088#1099
      OnClick = N6Click
    end
  end
  object RvDataSetConnection: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = DM.TrainQuery
    Left = 744
    Top = 8
  end
  object RvProject: TRvProject
    ProjectFile = 
      'C:\Users\Leanid Hreska\Desktop\university_delphi_2.1\Project1.ra' +
      'v'
    Left = 672
    Top = 8
  end
  object RvQueryConnection: TRvQueryConnection
    RuntimeVisibility = rtDeveloper
    Query = ReportQuery
    Left = 56
    Top = 8
  end
  object RvProject2: TRvProject
    ProjectFile = 
      'C:\Users\Leanid Hreska\Desktop\university_delphi_2.1\Project2.ra' +
      'v'
    Left = 136
    Top = 8
  end
  object GroupReportProject: TRvProject
    ProjectFile = 'C:\Users\Leanid Hreska\Desktop\university_delphi_2.1\GrRep.rav'
    Left = 240
    Top = 8
  end
  object GroupReportQuery: TRvQueryConnection
    RuntimeVisibility = rtDeveloper
    Query = ReportQuery
    Left = 328
    Top = 8
  end
  object ReportQuery: TQuery
    DatabaseName = 'HreskaJD_Station'
    Left = 768
    Top = 400
  end
end
