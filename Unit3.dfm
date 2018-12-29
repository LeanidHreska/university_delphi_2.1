object Form3: TForm3
  Left = 382
  Top = 225
  Width = 453
  Height = 279
  Caption = 'Train Form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DepartureTimeLabel: TLabel
    Left = 40
    Top = 72
    Width = 99
    Height = 13
    Caption = #1042#1088#1077#1084#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
  end
  object TrainIdEdit: TLabeledEdit
    Left = 144
    Top = 32
    Width = 137
    Height = 21
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1086#1084#1077#1088' '#1087#1086#1077#1079#1076#1072
    TabOrder = 0
  end
  object TicketAmountEdit: TLabeledEdit
    Left = 240
    Top = 88
    Width = 137
    Height = 21
    EditLabel.Width = 105
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1080#1083#1077#1090#1086#1074
    TabOrder = 2
  end
  object TicketPriceEdit: TLabeledEdit
    Left = 40
    Top = 144
    Width = 145
    Height = 21
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = #1062#1077#1085#1072' '#1073#1080#1083#1077#1090#1072
    TabOrder = 3
  end
  object WagonTypeEdit: TLabeledEdit
    Left = 240
    Top = 144
    Width = 137
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
    TabOrder = 4
  end
  object btn1: TButton
    Left = 40
    Top = 200
    Width = 145
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 5
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 240
    Top = 200
    Width = 137
    Height = 25
    Caption = #1053#1072#1079#1072#1076
    TabOrder = 6
    OnClick = btn2Click
  end
  object DepartureTimeEdit: TMaskEdit
    Left = 40
    Top = 88
    Width = 143
    Height = 21
    EditMask = '!99:99:99;1;_'
    MaxLength = 8
    TabOrder = 1
    Text = '  :  :  '
  end
  object TransactionIdEditHidden: TEdit
    Left = 312
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'TransactionIdEditHidden'
    Visible = False
  end
end
