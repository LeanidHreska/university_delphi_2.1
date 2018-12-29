unit Unit2;

interface

uses
  SysUtils, Classes, DBTables, DB;

type
  TDM = class(TDataModule)
    Trains: TTable;
    TrainData: TDataSource;
    TrainQuery: TQuery;
    Passenger: TTable;
    PassengerQuery: TQuery;
    PassengerData: TDataSource;
    Baggage: TTable;
    BaggageQuery: TQuery;
    BaggageData: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Unit1;

{$R *.dfm}

end.


