unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids, Mask;

type
  TQueriesForm = class(TForm)
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    Query: TQuery;
    ExecuteQueryButton: TButton;
    CloseFormButton: TButton;
    QueriesDropDown: TComboBox;
    QueryDescriptionLabel: TLabel;
    QueryParamEdit: TEdit;
    QueryParamMaskEdit: TMaskEdit;
    procedure CloseFormButtonClick(Sender: TObject);
    procedure ExecuteQueryButtonClick(Sender: TObject);
    procedure QueriesDropDownChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueriesForm: TQueriesForm;
  function isParamEditVisible(idx: Integer) : Boolean;
  function getQueryDescriptionLabel(idx: Integer): string;
  function isParamMaskEditVisible(idx: integer): Boolean;

implementation

{$R *.dfm}

procedure TQueriesForm.CloseFormButtonClick(Sender: TObject);
begin
  Close;
end;

procedure executeQuery(idx: Integer; query: TQuery);
begin
  case idx of
    0: begin
      query.SQL.Text := 'SELECT TRAINS.TRAIN_ID, ' +
      'PASSENGERS.PASSENGER_NAME, PASSENGERS.POINT_OF_DEPARTURE, PASSENGERS.POINT_OF_DESTINATION ' +
      'FROM TRAINS INNER JOIN PASSENGERS ON TRAINS.TRAIN_ID=PASSENGERS.TRAIN_ID WHERE DEPARTURE_DATE=:departureDate';

      query.ParamByName('departureDate').AsDate := StrToDate(QueriesForm.QueryParamMaskEdit.Text);
    end;

    1: begin
      query.SQL.Text := 'SELECT PASSENGERS.PASSENGER_ID, PASSENGERS.POINT_OF_DEPARTURE, PASSENGERS.POINT_OF_DESTINATION, ' +
      'TRAINS.DEPARTURE_DATE FROM PASSENGERS INNER JOIN TRAINS ON PASSENGERS.TRAIN_ID=TRAINS.TRAIN_ID WHERE TRAIN_ID=:trainId';

      query.ParamByName('trainId').AsInteger := StrToInt(QueriesForm.QueryParamEdit.Text);
    end;

    2: begin
      query.SQL.Text := 'SELECT TRAINS.TRAIN_ID, TRAINS.DEPARTURE_DATE, PASSENGERS.POINT_OF_DEPARTURE, ' +
      'PASSENGERS.NUMBER_OF_TICKETS , ' +
      'PASSENGERS.POINT_OF_DESTINATION, BAGGAGE.BAGGAGE_AMOUNT FROM PASSENGERS ' +
      'INNER JOIN TRAINS ON TRAINS.TRAIN_ID=PASSENGERS.TRAIN_ID ' +
      'INNER JOIN BAGGAGE ON BAGGAGE.PASSENGER_ID=PASSENGERS.PASSENGER_ID ' +
      'WHERE PASSENGERS.PASSENGER_NAME=:passengerName';

      query.ParamByName('passengerName').AsString := QueriesForm.QueryParamEdit.Text;
    end;

    3: begin
      query.SQL.Text := 'SELECT TRAINS.TRAIN_ID, TRAINS.DEPARTURE_DATE FROM TRAINS INNER JOIN PASSENGERS ON ' +
      'PASSENGERS.TRAIN_ID=TRAINS.TRAIN_ID WHERE PASSENGERS.POINT_OF_DEPARTURE=:pointOfDeparture ';

      query.ParamByName('pointOfDeparture').AsString := QueriesForm.QueryParamEdit.Text;
    end;

    4: begin
      query.SQL.Text := 'SELECT DEPARTURE_DATE, TICKET_QUANTITY, TICKET_PRICE FROM TRAINS';
    end;

    5: begin
      query.SQL.Text := 'SELECT TRAINS.TRAIN_ID, TRAINS.DEPARTURE_DATE, PASSENGERS.POINT_OF_DEPARTURE, PASSENGERS.POINT_OF_DESTINATION, ' +
      'PASSENGERS.NUMBER_OF_TICKETS, BAGGAGE.BAGGAGE_AMOUNT FROM PASSENGERS ' +
      'INNER JOIN TRAINS ON TRAINS.TRAIN_ID=PASSENGERS.TRAIN_ID ' +
      'INNER JOIN BAGGAGE ON BAGGAGE.PASSENGER_ID=PASSENGERS.PASSENGER_ID';
    end;

    6: begin
      query.SQL.Text := 'SELECT SUM(TICKET_PRICE * TICKET_QUANTITY) FROM TRAINS WHERE DEPARTURE_DATE=:departureDate';

      query.ParamByName('departureDate').AsDate := StrToDate('27.11.2018');
    end;
  end;
  Query.Open;
end;

procedure TQueriesForm.ExecuteQueryButtonClick(Sender: TObject);
begin
  if (QueryParamEdit.Visible) and (QueryParamEdit.Text = '') then
    ShowMessage('Заполните все поля')
  else executeQuery(QueriesDropDown.ItemIndex, Query);
end;

procedure prepareFormToQuery;
begin
  QueriesForm.QueryDescriptionLabel.Caption := getQueryDescriptionLabel(QueriesForm.QueriesDropDown.ItemIndex);
  QueriesForm.QueryParamEdit.Visible := isParamEditVisible(QueriesForm.QueriesDropDown.ItemIndex);
  QueriesForm.QueryParamMaskEdit.Visible := isParamMaskEditVisible(QueriesForm.QueriesDropDown.ItemIndex);
  QueriesForm.QueryDescriptionLabel.Width := 425;
end;

function getQueryDescriptionLabel(idx: Integer): string;
begin
  case idx of
    0: Result := 'Выдать список поездов, отправляющихся в указанную дату с указанием номера поезда, ФИО пассажира, купившего билет, станций отправления и назначения.';
    1: Result := 'Выдать список пассажиров, купивших билет на указанный поезд с указанием пунктов отправления и назначения, даты.';
    2: Result := 'Для введенного ФИО пассажира выдать номер поезда, дату отправления, количество проданных билетов, количество багажа, пункты направления и назначения.';
    3: Result := 'Выдать список всех поездов, отправляющихся с указанной станции с указанием номера поезда, даты';
    4: Result := 'Выдать список поездов с указанием даты, количества проданных билетов, цены билета.';
    5: Result := 'Выдать список пассажиров с указанием номера поезда, даты, пунктов отправления и назначения, количества билетов, количества багажа';
    6: Result := 'Выдать количество проданных билетов в заданную дату (27.11.2018).';
  end;
end;

function isParamEditVisible(idx: Integer): Boolean;
begin
  if (idx = 1) or (idx = 2) or (idx = 3) then
    Result := True
  else Result := False;
end;

function isParamMaskEditVisible(idx: integer): Boolean;
begin
  if (idx = 0) then
    Result := True
  else Result:= False;
end;

procedure TQueriesForm.QueriesDropDownChange(Sender: TObject);
begin
  prepareFormToQuery();
end;

procedure TQueriesForm.FormCreate(Sender: TObject);
begin
  prepareFormToQuery();
end;

end.
