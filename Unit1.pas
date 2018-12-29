unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBTables,
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
    PriceOfAllSoldTicketsLabel: TLabel;
    PriceOfAllSoldTicketsValueLabel: TLabel;
    SoldTicketsQuantityLabel: TLabel;
    SoldTicketsQuantityLabelValue: TLabel;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure addButtonClick(Sender: TObject);
    procedure deleteButtonClick(Sender: TObject);
    procedure editButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
  end;


function getInsertSQLQuery(tableName: String): String;
function getInsertParamsString(tableName: String): String;
function getCurrentQuery(): TQuery;
function getCurrentTableName(): string;
procedure setPriceOfAllSoldTickets();
procedure setSoldTicketsQuantity();

var
  Form1: TForm1;

implementation

uses Unit3, Unit2;


{$R *.dfm}

procedure TForm1.N1Click(Sender: TObject);
begin
DBGrid.DataSource := DM.TrainData;
DBNavigator.DataSource := DM.TrainData;
setPriceOfAllSoldTickets
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

  if (currentTable = 'TRAINS') then setPriceOfAllSoldTickets;
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

procedure setPriceOfAllSoldTickets();
  var sumOfAllTickets, ticketQuantity, ticketPrice, currentRecIdx: Integer;
begin
  sumOfAllTickets := 0;
  currentRecIdx := DM.TrainData.DataSet.RecNo;
  DM.TrainData.DataSet.First;

  while (DM.TrainData.DataSet.RecordCount >= DM.TrainData.DataSet.RecNo) do
    begin
      ticketQuantity := DM.TrainData.DataSet.FieldByName('TICKET_QUANTITY').AsInteger;
      ticketPrice := DM.TrainData.DataSet.FieldByName('TICKET_PRICE').AsInteger;
      sumOfAllTickets := sumOfAllTickets + (ticketQuantity * ticketPrice);
      if (DM.TrainData.DataSet.RecordCount = DM.TrainData.DataSet.RecNo) then Break;
      DM.TrainData.DataSet.Next;
    end;
  Form1.PriceOfAllSoldTicketsValueLabel.Caption := IntToStr(sumOfAllTickets);
  DM.TrainData.DataSet.RecNo := currentRecIdx;
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
    Result := 'INSERT INTO Trains (TRAIN_ID, DEPARTURE_DATE, TICKET_QUANTITY, TICKET_PRICE, WAGON_TYPE)'
  else if (tableName = 'Passengers') then
    Result := 'Not implemented'
  else if (tableName = 'Baggage') then
    Result := 'Not implemented'
end;

function getInsertParamsString(tableName: string): string;
begin
  if(tableName = 'Trains') then
    Result := 'VALUES (:trainId, :departureDate, :ticketQuantity, :ticketPrice, :wagonType)'
  else if (tableName = 'Passengers') then
    Result := 'Not implemented'
  else if (tableName = 'Baggage') then
    Result := 'Not implemented'
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 setPriceOfAllSoldTickets;
 setSoldTicketsQuantity;
end;

end.

