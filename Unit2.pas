unit Unit2;

interface

uses
  SysUtils, Classes, DBTables, DB;

type
  TProcedureAsParam = procedure();
  TDM = class(TDataModule)
    TrainData: TDataSource;
    TrainQuery: TQuery;
    PassengerQuery: TQuery;
    PassengerData: TDataSource;
    BaggageQuery: TQuery;
    BaggageData: TDataSource;
    intgrfldTrainQueryTRANSACTION_ID: TIntegerField;
    intgrfldTrainQueryTRAIN_ID: TIntegerField;
    dtfldTrainQueryDEPARTURE_DATE: TDateField;
    intgrfldTrainQueryTICKET_QUANTITY: TIntegerField;
    fltfldTrainQueryTICKET_PRICE: TFloatField;
    strngfldTrainQueryWAGON_TYPE: TStringField;
    strngfldTrainQueryPRICE_OF_ALL_TICKETS: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure TrainQueryCalcFields(DataSet: TDataSet);
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

procedure TDM.TrainQueryCalcFields(DataSet: TDataSet);
begin
  strngfldTrainQueryPRICE_OF_ALL_TICKETS.Value := IntToStr(DataSet.FieldByName('TICKET_QUANTITY').AsInteger * DataSet.FieldByName('TICKET_PRICE').AsInteger);
end;

end.

