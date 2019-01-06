object QueriesForm: TQueriesForm
  Left = 272
  Top = 214
  Width = 731
  Height = 390
  Caption = 'QueriesForm'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object DBGrid: TDBGrid
    Left = 24
    Top = 144
    Width = 665
    Height = 185
    DataSource = DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = []
  end
  object ExecuteQueryButton: TButton
    Left = 120
    Top = 104
    Width = 129
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 1
  end
  object CloseFormButton: TButton
    Left = 448
    Top = 104
    Width = 113
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
    TabOrder = 2
    OnClick = CloseFormButtonClick
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 648
    Top = 24
  end
  object Query: TQuery
    DatabaseName = 'HreskaJD_Station'
    Left = 648
    Top = 80
  end
end
