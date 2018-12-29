unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, DBCtrls, Grids, DBGrids, DB, Unit2, DBTables,
  StdCtrls;

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
    insertButton: TButton;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure addButtonClick(Sender: TObject);
    procedure deleteButtonClick(Sender: TObject);
    procedure editButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;


function getInsertSQLQuery(tableName: String): String;
function getInsertParamsString(tableName: String): String;
function getCurrentQuery(): TQuery;
function getCurrentTableName(): string;

var
  Form1: TForm1;

implementation

uses Unit3;


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
end;

procedure TForm1.deleteButtonClick(Sender: TObject);
var transactionId: integer;
currentTable: string;
currentDataSource: TDataSource;
currentQuery: TQuery;
begin
  currentTable := getCurrentTableName();
  currentQuery := getCurrentQuery();
  currentDataSource := DBGrid.DataSource;

  transactionId := DBGrid.DataSource.DataSet.FieldByName('Transaction_id').AsInteger;
  currentQuery.SQL.Text := 'DELETE FROM ' + currentTable + ' WHERE TRANSACTION_ID=:transactionId;';
  currentQuery.ParamByName('transactionId').AsInteger := transactionId;

  currentQuery.ExecSQL;
  currentDataSource.DataSet.Refresh;
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
  else if (currentDataSource = DM.PassengerData) then Result := 'PASSENGER'
  else Result := 'BAGGAGE';
end;


procedure TForm1.editButtonClick(Sender: TObject);
begin
  if (getCurrentTableName() = 'TRAINS') then
    begin
      Unit3.preFillForm(DBGrid.DataSource.DataSet);
      Unit3.activateEditMode;
      Form3.Show;
    end;

end;


// SQL related
function getInsertSQLQuery(tableName: string): string;
begin
  if(tableName = 'Trains') then
    Result := 'INSERT INTO Trains (TRAIN_ID, DEPARTURE_TIME, TICKET_QUANTITY, TICKET_PRICE, WAGON_TYPE)'
  else if (tableName = 'Passengers') then
    Result := 'Not implemented'
  else if (tableName = 'Baggage') then
    Result := 'Not implemented'
end;

function getInsertParamsString(tableName: string): string;
begin
  if(tableName = 'Trains') then
    Result := 'VALUES (:trainId, :departureTime, :ticketQuantity, :ticketPrice, :wagonType)'
  else if (tableName = 'Passengers') then
    Result := 'Not implemented'
  else if (tableName = 'Baggage') then
    Result := 'Not implemented'
end;

end.

