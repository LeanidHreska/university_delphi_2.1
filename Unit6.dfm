object PassengerForm: TPassengerForm
  Left = 192
  Top = 125
  Width = 477
  Height = 285
  Caption = 'PassengerForm'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object TrainIdEdit: TLabeledEdit
    Left = 40
    Top = 88
    Width = 145
    Height = 27
    EditLabel.Width = 93
    EditLabel.Height = 19
    EditLabel.Caption = #1053#1086#1084#1077#1088' '#1087#1086#1077#1079#1076#1072
    TabOrder = 0
  end
  object NumberOfTicketsEdit: TLabeledEdit
    Left = 240
    Top = 88
    Width = 136
    Height = 27
    EditLabel.Width = 139
    EditLabel.Height = 19
    EditLabel.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1080#1083#1077#1090#1086#1074
    TabOrder = 1
  end
  object PointOfDepartureEdit: TLabeledEdit
    Left = 40
    Top = 144
    Width = 144
    Height = 27
    EditLabel.Width = 132
    EditLabel.Height = 19
    EditLabel.Caption = #1055#1091#1085#1082#1090' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
    TabOrder = 2
  end
  object PointOfDestinationEdit: TLabeledEdit
    Left = 240
    Top = 144
    Width = 136
    Height = 27
    EditLabel.Width = 122
    EditLabel.Height = 19
    EditLabel.Caption = #1055#1091#1085#1082#1090' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
    TabOrder = 3
  end
  object btn1: TButton
    Left = 40
    Top = 200
    Width = 144
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 4
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 240
    Top = 200
    Width = 136
    Height = 25
    Caption = #1053#1072#1079#1072#1076
    TabOrder = 5
    OnClick = btn2Click
  end
  object PassengerIdEditHidden: TEdit
    Left = 336
    Top = 0
    Width = 121
    Height = 27
    TabOrder = 6
    Text = 'PassengerIdEditHidden'
    Visible = False
  end
  object PassengerNameEdit: TLabeledEdit
    Left = 136
    Top = 32
    Width = 137
    Height = 27
    EditLabel.Width = 104
    EditLabel.Height = 19
    EditLabel.Caption = #1048#1084#1103' '#1087#1072#1089#1089#1072#1078#1080#1088#1072
    TabOrder = 7
  end
  object LabeledEdit1: TLabeledEdit
    Left = 440
    Top = 224
    Width = 121
    Height = 27
    EditLabel.Width = 81
    EditLabel.Height = 19
    EditLabel.Caption = 'LabeledEdit1'
    TabOrder = 8
  end
end
