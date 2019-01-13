object BaggageForm: TBaggageForm
  Left = 193
  Top = 125
  Width = 474
  Height = 284
  Caption = 'BaggageForm'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object PassengerIdEdit: TLabeledEdit
    Left = 160
    Top = 40
    Width = 121
    Height = 27
    EditLabel.Width = 102
    EditLabel.Height = 19
    EditLabel.Caption = #1050#1086#1076' '#1087#1072#1089#1089#1072#1078#1080#1088#1072
    TabOrder = 0
  end
  object BaggageAmountEdit: TLabeledEdit
    Left = 80
    Top = 112
    Width = 121
    Height = 27
    EditLabel.Width = 130
    EditLabel.Height = 19
    EditLabel.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1072#1075#1072#1078#1072
    TabOrder = 1
  end
  object BaggageFreePlaceEdit: TLabeledEdit
    Left = 232
    Top = 112
    Width = 121
    Height = 27
    EditLabel.Width = 200
    EditLabel.Height = 38
    EditLabel.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1093' '#1084#1077#1089#1090' '#1076#1083#1103' '#1073#1072#1075#1072#1078#1072
    EditLabel.Layout = tlCenter
    EditLabel.WordWrap = True
    TabOrder = 2
  end
  object TransactionIdHiddenEdit: TEdit
    Left = 328
    Top = 8
    Width = 121
    Height = 27
    TabOrder = 3
    Text = 'TransactionIdHiddenEdit'
    Visible = False
  end
  object ActionButton: TButton
    Left = 80
    Top = 184
    Width = 121
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 4
    OnClick = ActionButtonClick
  end
  object CloseButton: TButton
    Left = 232
    Top = 184
    Width = 121
    Height = 25
    Caption = #1053#1072#1079#1072#1076
    TabOrder = 5
    OnClick = CloseButtonClick
  end
end
