object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 645
  Top = 238
  Height = 309
  Width = 411
  object TrainData: TDataSource
    DataSet = TrainQuery
    Left = 80
    Top = 104
  end
  object TrainQuery: TQuery
    OnCalcFields = TrainQueryCalcFields
    DatabaseName = 'HreskaJD_Station'
    Filtered = True
    SQL.Strings = (
      'SELECT * FROM TRAINS')
    Left = 80
    Top = 168
    object intgrfldTrainQueryTRANSACTION_ID: TIntegerField
      FieldName = 'TRANSACTION_ID'
      Origin = 'HRESKAJD_STATION."TRAINS.DB".TRANSACTION_ID'
    end
    object intgrfldTrainQueryTRAIN_ID: TIntegerField
      FieldName = 'TRAIN_ID'
      Origin = 'HRESKAJD_STATION."TRAINS.DB".TRAIN_ID'
    end
    object dtfldTrainQueryDEPARTURE_DATE: TDateField
      FieldName = 'DEPARTURE_DATE'
      Origin = 'HRESKAJD_STATION."TRAINS.DB".DEPARTURE_DATE'
    end
    object intgrfldTrainQueryTICKET_QUANTITY: TIntegerField
      FieldName = 'TICKET_QUANTITY'
      Origin = 'HRESKAJD_STATION."TRAINS.DB".TICKET_QUANTITY'
    end
    object fltfldTrainQueryTICKET_PRICE: TFloatField
      FieldName = 'TICKET_PRICE'
      Origin = 'HRESKAJD_STATION."TRAINS.DB".TICKET_PRICE'
    end
    object strngfldTrainQueryWAGON_TYPE: TStringField
      FieldName = 'WAGON_TYPE'
      Origin = 'HRESKAJD_STATION."TRAINS.DB".WAGON_TYPE'
      Size = 40
    end
    object strngfldTrainQueryPRICE_OF_ALL_TICKETS: TStringField
      FieldKind = fkCalculated
      FieldName = 'PRICE_OF_ALL_TICKETS'
      Calculated = True
    end
  end
  object PassengerQuery: TQuery
    Active = True
    DatabaseName = 'HreskaJD_Station'
    SQL.Strings = (
      'SELECT * FROM PASSENGERS')
    Left = 176
    Top = 168
  end
  object PassengerData: TDataSource
    DataSet = PassengerQuery
    Left = 176
    Top = 104
  end
  object BaggageQuery: TQuery
    Active = True
    AutoCalcFields = False
    DatabaseName = 'HreskaJD_Station'
    SQL.Strings = (
      'SELECT * FROM BAGGAGE')
    Left = 280
    Top = 168
  end
  object BaggageData: TDataSource
    DataSet = BaggageQuery
    Left = 280
    Top = 104
  end
end