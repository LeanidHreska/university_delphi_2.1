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
    Active = True
    DatabaseName = 'HreskaJD_Station'
    Filtered = True
    SQL.Strings = (
      'SELECT * FROM TRAINS')
    Left = 80
    Top = 168
  end
  object Passenger: TTable
    Active = True
    DatabaseName = 'HreskaJD_Station'
    Filtered = True
    TableName = 'PASSENGERS.DB'
    Left = 176
    Top = 48
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
  object Baggage: TTable
    Active = True
    DatabaseName = 'HreskaJD_Station'
    TableName = 'Baggage.db'
    Left = 288
    Top = 48
  end
  object BaggageQuery: TQuery
    DataSource = BaggageData
    Left = 288
    Top = 168
  end
  object BaggageData: TDataSource
    DataSet = Baggage
    Left = 288
    Top = 112
  end
end
