object Form3: TForm3
  Left = 382
  Top = 225
  Width = 453
  Height = 279
  Caption = 'Train Form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object DepartureDateLabel: TLabel
    Left = 40
    Top = 72
    Width = 123
    Height = 19
    Caption = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
  end
  object TrainIdEdit: TLabeledEdit
    Left = 144
    Top = 32
    Width = 137
    Height = 27
    EditLabel.Width = 93
    EditLabel.Height = 19
    EditLabel.Caption = #1053#1086#1084#1077#1088' '#1087#1086#1077#1079#1076#1072
    TabOrder = 0
  end
  object TicketAmountEdit: TLabeledEdit
    Left = 240
    Top = 88
    Width = 137
    Height = 27
    EditLabel.Width = 139
    EditLabel.Height = 19
    EditLabel.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1080#1083#1077#1090#1086#1074
    TabOrder = 2
  end
  object TicketPriceEdit: TLabeledEdit
    Left = 40
    Top = 144
    Width = 145
    Height = 27
    EditLabel.Width = 84
    EditLabel.Height = 19
    EditLabel.Caption = #1062#1077#1085#1072' '#1073#1080#1083#1077#1090#1072
    TabOrder = 3
  end
  object WagonTypeEdit: TLabeledEdit
    Left = 240
    Top = 144
    Width = 137
    Height = 27
    EditLabel.Width = 76
    EditLabel.Height = 19
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
  object DepartureDateEdit: TMaskEdit
    Left = 40
    Top = 88
    Width = 141
    Height = 27
    EditMask = '!99/99/99;1;_'
    MaxLength = 8
    TabOrder = 1
    Text = '  .  .  '
  end
  object TransactionIdEditHidden: TEdit
    Left = 312
    Top = 0
    Width = 121
    Height = 27
    TabOrder = 7
    Text = 'TransactionIdEditHidden'
    Visible = False
  end
end
