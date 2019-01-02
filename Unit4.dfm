object SearchForm: TSearchForm
  Left = 343
  Top = 256
  Width = 580
  Height = 182
  Caption = 'SearchForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object SearchEdit: TLabeledEdit
    Left = 64
    Top = 88
    Width = 201
    Height = 27
    EditLabel.Width = 63
    EditLabel.Height = 19
    EditLabel.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
    TabOrder = 1
  end
  object SearchButton: TBitBtn
    Left = 280
    Top = 88
    Width = 121
    Height = 25
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 2
    OnClick = SearchButtonClick
  end
  object CloseButton: TButton
    Left = 416
    Top = 88
    Width = 121
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
    OnClick = CloseButtonClick
  end
  object SearchByDropBox: TComboBox
    Left = 64
    Top = 24
    Width = 201
    Height = 27
    ItemHeight = 19
    TabOrder = 0
  end
  object IsFilterCheckBox: TCheckBox
    Left = 280
    Top = 24
    Width = 121
    Height = 25
    Alignment = taLeftJustify
    Caption = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100
    TabOrder = 4
  end
end
