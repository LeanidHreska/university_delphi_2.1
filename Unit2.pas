unit Unit2;

interface

uses
  SysUtils, Classes, DBTables, DB;

type
  TProcedureAsParam = procedure();
  TDM = class(TDataModule)
    TrainData: TDataSource;
    TrainQuery: TQuery;
    Passenger: TTable;
    PassengerQuery: TQuery;
    PassengerData: TDataSource;
    Baggage: TTable;
    BaggageQuery: TQuery;
    BaggageData: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;
  procedure executeSQLTransaction(query: TQuery; dataset: TDataSet; executeTransaction: TProcedureAsParam);

implementation

uses Unit1;

{$R *.dfm}


procedure TDM.DataModuleCreate(Sender: TObject);
begin
  TrainData.DataSet.Open;
end;

procedure executeSQLTransaction(query: TQuery; dataset: TDataSet; executeTransaction: TProcedureAsParam);
var sqlText: string;
begin
  sqlText := query.SQL.Text;

  executeTransaction();

  query.SQL.Clear;
  query.SQL.Text := sqlText;

  dataset.Open;
end;

end.


