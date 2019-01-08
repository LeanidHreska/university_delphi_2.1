object QueriesForm: TQueriesForm
  Left = 182
  Top = 176
  BorderStyle = bsSingle
  Caption = 'QueriesForm'
  ClientHeight = 379
  ClientWidth = 702
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object QueryDescriptionLabel: TLabel
    Left = 256
    Top = 8
    Width = 4
    Height = 19
    WordWrap = True
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 188
    Width = 697
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
    Left = 248
    Top = 144
    Width = 129
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 4
    OnClick = ExecuteQueryButtonClick
  end
  object CloseFormButton: TButton
    Left = 488
    Top = 144
    Width = 113
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
    TabOrder = 5
    OnClick = CloseFormButtonClick
  end
  object QueriesDropDown: TComboBox
    Left = 72
    Top = 56
    Width = 153
    Height = 27
    ItemHeight = 19
    ItemIndex = 0
    TabOrder = 1
    Text = #1047#1072#1087#1088#1086#1089' 1'
    OnChange = QueriesDropDownChange
    Items.Strings = (
      #1047#1072#1087#1088#1086#1089' 1'
      #1047#1072#1087#1088#1086#1089' 2'
      #1047#1072#1087#1088#1086#1089' 3'
      #1047#1072#1087#1088#1086#1089' 4'
      #1047#1072#1087#1088#1086#1089' 5'
      #1047#1072#1087#1088#1086#1089' 6'
      #1047#1072#1087#1088#1086#1089' 7')
  end
  object QueryParamEdit: TEdit
    Left = 72
    Top = 144
    Width = 153
    Height = 27
    TabOrder = 2
    Visible = False
  end
  object QueryParamMaskEdit: TMaskEdit
    Left = 72
    Top = 144
    Width = 152
    Height = 27
    EditMask = '!99/99/99;1;_'
    MaxLength = 8
    TabOrder = 3
    Text = '  .  .  '
    Visible = False
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
