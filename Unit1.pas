unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBTables,
  StdCtrls, RpDefine, RpCon, RpConDS, RpRave;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DBGrid: TDBGrid;
    DBNavigator: TDBNavigator;
    addButton: TButton;
    editButton: TButton;
    deleteButton: TButton;
    SoldTicketsQuantityLabel: TLabel;
    SoldTicketsQuantityLabelValue: TLabel;
    MainMenu: TMainMenu;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    C1: TMenuItem;
    N11: TMenuItem;
    N5: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    RvDataSetConnection: TRvDataSetConnection;
    RvProject: TRvProject;
    N14: TMenuItem;
    N15: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure addButtonClick(Sender: TObject);
    procedure deleteButtonClick(Sender: TObject);
    procedure editButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
  private
    { Private declarations }
  public
  end;


function getInsertSQLQuery(tableName: String): String;
function getInsertParamsString(tableName: String): String;
function getCurrentQuery(): TQuery;
function getCurrentDataSet(): TDataSet;
function getCurrentTableName(): string;
procedure setSoldTicketsQuantity();
procedure executeDeleteTransaction;
procedure sort(field: string; sortType: string = 'ASC');

var
  Form1: TForm1;

implementation

uses Unit3, Unit2, Unit4, Unit5, Unit6, BaggageUnit;


{$R *.dfm}

procedure TForm1.N1Click(Sender: TObject);
begin
DBGrid.DataSource := DM.TrainData;
DBNavigator.DataSource := DM.TrainData;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
DBGrid.DataSource := DM.PassengerData;
DBNavigator.DataSource := DM.PassengerData;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
DBGrid.DataSource := DM.BaggageData;
DBNavigator.DataSource := DM.BaggageData;
end;

procedure TForm1.addButtonClick(Sender: TObject);
begin
if (getCurrentTableName() = 'TRAINS') then Form3.Show;
if (getCurrentTableName() = 'PASSENGERS') then PassengerForm.Show;
if (getCurrentTableName() = 'BAGGAGE') then BaggageForm.Show;
end;

procedure executeDeleteTransaction;
var uniqueFieldValue: integer;
    currentTable: string;
    currentQuery: TQuery;
    uniqueField: string;
begin
  currentTable := getCurrentTableName();
  currentQuery := getCurrentQuery();

  if (currentTable = 'TRAINS') then uniqueField := 'TRANSACTION_ID';
  if (currentTable = 'PASSENGERS') then uniqueField := 'PASSENGER_ID';
  if (currentTable = 'BAGGAGE') then uniqueField := 'TRANSACTION_ID';

  uniqueFieldValue := Form1.DBGrid.DataSource.DataSet.FieldByName(uniqueField).AsInteger;
  currentQuery.SQL.Text := 'DELETE FROM ' + currentTable + ' WHERE ' + uniqueField + '=:' + uniqueField +';';
  currentQuery.ParamByName(uniqueField).AsInteger := uniqueFieldValue;

  currentQuery.ExecSQL;
end;

procedure TForm1.deleteButtonClick(Sender: TObject);
begin
  executeSQLTransaction(getCurrentQuery(), DBGrid.DataSource.DataSet, @executeDeleteTransaction);

  if (getCurrentTableName() = 'TRAINS') then
    begin
      setSoldTicketsQuantity;
    end;
end;

function getCurrentQuery(): TQuery;
var currentDataSource: TDataSource;
begin
  currentDataSource := Form1.DBGrid.DataSource;
  if (currentDataSource = DM.TrainData) then Result := DM.TrainQuery
  else if (currentDataSource = DM.PassengerData) then Result := DM.PassengerQuery
  else Result := DM.BaggageQuery;
end;

function getCurrentTableName(): string;
var currentDataSource: TDataSource;
begin
  currentDataSource := Form1.DBGrid.DataSource;
  if (currentDataSource = DM.TrainData) then Result := 'TRAINS'
  else if (currentDataSource = DM.PassengerData) then Result := 'PASSENGERS'
  else Result := 'BAGGAGE';
end;

function getCurrentDataSet(): TDataSet;
begin
  Result:= Form1.DBGrid.DataSource.DataSet;
end;

procedure TForm1.editButtonClick(Sender: TObject);
begin
  if (getCurrentTableName() = 'TRAINS') then
    begin
      Unit3.preFillForm(DBGrid.DataSource.DataSet);
      Unit3.activateEditMode;
      Form3.Show;
    end
  else if (getCurrentTableName() = 'PASSENGERS') then
    begin
      PassengerForm.preFillForm(DBGrid.DataSource.DataSet);
      PassengerForm.activateEditMode;
      PassengerForm.Show;
    end
  else if (getCurrentTableName() = 'BAGGAGE') then
    begin
      BaggageForm.preFillForm(DBGrid.DataSource.DataSet);
      BaggageForm.activateEditMode;
      BaggageForm.Show;
    end;
end;

procedure setSoldTicketsQuantity();
  var ticketQuantity, currentRecIdx: Integer;
begin
  ticketQuantity := 0;
  currentRecIdx := DM.TrainData.DataSet.RecNo;
  DM.TrainData.DataSet.First;

  while (DM.TrainData.DataSet.RecordCount >= DM.TrainData.DataSet.RecNo) do
    begin
      ticketQuantity := ticketQuantity + DM.TrainData.DataSet.FieldByName('TICKET_QUANTITY').AsInteger;
      if (DM.TrainData.DataSet.RecordCount = DM.TrainData.DataSet.RecNo) then Break;
      DM.TrainData.DataSet.Next;
    end;
  Form1.SoldTicketsQuantityLabelValue.Caption := IntToStr(ticketQuantity);
  DM.TrainData.DataSet.RecNo := currentRecIdx;
end;

// SQL related
function getInsertSQLQuery(tableName: string): string;
begin
  if(tableName = 'Trains') then
    Result := 'INSERT INTO TRAINS (TRAIN_ID, DEPARTURE_DATE, TICKET_QUANTITY, TICKET_PRICE, WAGON_TYPE)'
  else if (tableName = 'Passengers') then
    Result := 'INSERT INTO PASSENGERS (PASSENGER_NAME, TRAIN_ID, NUMBER_OF_TICKETS, POINT_OF_DEPARTURE, POINT_OF_DESTINATION)'
  else if (tableName = 'Baggage') then
    Result := 'INSERT INTO BAGGAGE (PASSENGER_ID, BAGGAGE_AMOUNT, BAGGAGE_FREE_SEATS)'
end;

function getInsertParamsString(tableName: string): string;
begin
  if(tableName = 'Trains') then
    Result := 'VALUES (:trainId, :departureDate, :ticketQuantity, :ticketPrice, :wagonType)'
  else if (tableName = 'Passengers') then
    Result := 'VALUES (:passengerName, :trainId, :numberOfTickets, :pointOfDeparture, :pointOfDestination)'
  else if (tableName = 'Baggage') then
    Result := 'VALUES (:passengerId, :baggageAmount, :baggageFreeSeats)';
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
// setSoldTicketsQuantity;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  DM.TrainData.DataSet.Filtered := False;
  DM.TrainData.DataSet.Filter := '';
  DM.PassengerData.DataSet.Filtered := False;
  DM.PassengerData.DataSet.Filter := '';
  DM.BaggageData.DataSet.Filtered := False;
  DM.BaggageData.DataSet.Filter := '';
  setSoldTicketsQuantity;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  sort('TRANSACTION_ID', 'DESC');
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  sort('TRANSACTION_ID');
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  sort('DEPARTURE_DATE', 'DESC');
end;

procedure sort(field: string; sortType: string = 'ASC');
begin
  DM.TrainQuery.SQL.Text := 'SELECT * FROM TRAINS ORDER BY ' + field + ' ' + sortType;
  DM.TrainQuery.Open;
end;

procedure TForm1.C1Click(Sender: TObject);
begin
  sort('TICKET_PRICE');
end;

procedure TForm1.N11Click(Sender: TObject);
begin
  QueriesForm.Show;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  SearchForm.Show;
  Unit4.prepareForm('Trains');
end;

procedure TForm1.N12Click(Sender: TObject);
begin
  SearchForm.Show;
  Unit4.prepareForm('Passengers');
end;

procedure TForm1.N13Click(Sender: TObject);
begin
  SearchForm.Show;
  Unit4.prepareForm('Baggage');
end;

procedure TForm1.N15Click(Sender: TObject);
begin
  RvProject.Execute;
end;

end.

