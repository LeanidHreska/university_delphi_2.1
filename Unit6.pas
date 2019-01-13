unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Unit1, Unit2, DB;

type
  TPassengerForm = class(TForm)
    TrainIdEdit: TLabeledEdit;
    NumberOfTicketsEdit: TLabeledEdit;
    PointOfDepartureEdit: TLabeledEdit;
    PointOfDestinationEdit: TLabeledEdit;
    btn1: TButton;
    btn2: TButton;
    PassengerIdEditHidden: TEdit;
    PassengerNameEdit: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    procedure btn2Click(Sender: TObject);
    function isFormValid(): Boolean;
    procedure btn1Click(Sender: TObject);
    procedure resetForm();
    procedure preFillForm(dataset: TDataSet);
    procedure updateRecordFromForm(Sender: TObject);
    procedure activateEditMode;
    procedure deactivateEditMode;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PassengerForm: TPassengerForm;
  procedure executeInsertTransaction;
  procedure executeUpdateTransaction;
  procedure setParamsToQuery(withPassengerId: Boolean);
implementation

{$R *.dfm}

procedure TPassengerForm.btn2Click(Sender: TObject);
begin
  deactivateEditMode;
  Hide;
end;

function TPassengerForm.isFormValid(): Boolean;
begin
  if (PassengerNameEdit.Text = '')
    or (TrainIdEdit.Text = '')
    or (NumberOfTicketsEdit.Text = '')
    or (PointOfDepartureEdit.Text = '')
    or (PointOfDestinationEdit.Text = '')
  then Result := False
  else Result := True;
end;

procedure TPassengerForm.resetForm;
begin
  PassengerNameEdit.Text := '';
  TrainIdEdit.Text := '';
  NumberOfTicketsEdit.Text := '';
  PointOfDepartureEdit.Text := '';
  PointOfDestinationEdit.Text := '';
  PassengerIdEditHidden.Text := '';
end;

procedure TPassengerForm.preFillForm(dataset: TDataSet);
begin
  PassengerNameEdit.Text := dataset.FieldByName('PASSENGER_NAME').AsString;
  TrainIdEdit.Text := dataset.FieldByName('TRAIN_ID').AsString;
  NumberOfTicketsEdit.Text := dataset.FieldByName('NUMBER_OF_TICKETS').AsString;
  PointOfDepartureEdit.Text := dataset.FieldByName('POINT_OF_DEPARTURE').AsString;
  PointOfDestinationEdit.Text := dataset.FieldByName('POINT_OF_DESTINATION').AsString;
  PassengerIdEditHidden.Text := dataset.FieldByName('PASSENGER_ID').AsString;
end;

procedure TPassengerForm.updateRecordFromForm(Sender: TObject);
begin
  Unit2.executeSQLTransaction(DM.PassengerQuery, DM.PassengerData.DataSet, @executeUpdateTransaction);

  Hide;
  deactivateEditMode;
  resetForm;
end;

procedure TPassengerForm.activateEditMode;
begin
  btn1.Caption := 'Сохранить';
  btn1.OnClick := updateRecordFromForm;
end;

procedure TPassengerForm.deactivateEditMode;
begin
  btn1.Caption := 'Добавить';
  btn1.OnClick := btn1Click;
end;

procedure TPassengerForm.btn1Click(Sender: TObject);
begin
  if (isFormValid()) then
    begin
      Unit2.executeSQLTransaction(DM.PassengerQuery, DM.PassengerData.DataSet, @executeInsertTransaction);

      Hide;
      resetForm();
    end
  else ShowMessage('Заполните все поля');
end;

procedure executeInsertTransaction;
begin
  DM.PassengerQuery.SQL.Text := Unit1.getInsertSQLQuery('Passengers') + ' ' + Unit1.getInsertParamsString('Passengers') + ';';
  setParamsToQuery(false);
  DM.PassengerQuery.ExecSQL;
end;

procedure executeUpdateTransaction;
begin
  DM.PassengerQuery.SQL.Text := 'UPDATE PASSENGERS SET ' +
    'PASSENGER_NAME = :passengerName, ' +
    'TRAIN_ID = :trainId, ' +
    'NUMBER_OF_TICKETS = :numberOfTickets, ' +
    'POINT_OF_DEPARTURE = :pointOfDeparture, ' +
    'POINT_OF_DESTINATION = :pointOfDestination ' +
    'WHERE PASSENGER_ID = :passengerId ;';
  setParamsToQuery(True);
  DM.PassengerQuery.ExecSQL;
end;

procedure setParamsToQuery(withPassengerId: Boolean);
begin
  DM.PassengerQuery.ParamByName('passengerName').AsString := PassengerForm.PassengerNameEdit.Text;
  DM.PassengerQuery.ParamByName('trainId').AsInteger := StrToInt(PassengerForm.TrainIdEdit.Text);
  DM.PassengerQuery.ParamByName('numberOfTickets').AsInteger := StrToInt(PassengerForm.NumberOfTicketsEdit.Text);
  DM.PassengerQuery.ParamByName('pointOfDeparture').AsString := PassengerForm.PointOfDepartureEdit.Text;
  DM.PassengerQuery.ParamByName('pointOfDestination').AsString := PassengerForm.PointOfDestinationEdit.Text;
  if (withPassengerId) then DM.PassengerQuery.ParamByName('passengerId').AsInteger := StrToInt(PassengerForm.PassengerIdEditHidden.Text);
end;

end.
