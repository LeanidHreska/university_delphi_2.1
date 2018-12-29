object DM: TDM
  OldCreateOrder = False
  Left = 359
  Top = 283
  Height = 309
  Width = 411
  object Trains: TTable
    Active = True
    AutoRefresh = True
    DatabaseName = 'HreskaJD_Station'
    TableName = 'Trains.db'
    Left = 80
    Top = 48
  end
  object TrainData: TDataSource
    DataSet = Trains
    Left = 80
    Top = 104
  end
  object TrainQuery: TQuery
    Left = 80
    Top = 168
  end
  object Passenger: TTable
    Active = True
    DatabaseName = 'HreskaJD_Station'
    TableName = 'Passengers.db'
    Left = 176
    Top = 48
  end
  object PassengerQuery: TQuery
    Left = 176
    Top = 168
  end
  object PassengerData: TDataSource
    DataSet = Passenger
    Left = 176
    Top = 104
  end
  object Baggage: TTable
    Active = True
    DatabaseName = 'HreskaJD_Station'
    TableName = 'Baggage.db'
    Left = 288
    Top = 48
  end
  object BaggageQuery: TQuery
    Left = 288
    Top = 168
  end
  object BaggageData: TDataSource
    DataSet = Baggage
    Left = 288
    Top = 112
  end
end
