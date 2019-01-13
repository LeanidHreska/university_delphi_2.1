unit BaggageUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Unit1, Unit2, DB;

type
  TBaggageForm = class(TForm)
    PassengerIdEdit: TLabeledEdit;
    BaggageAmountEdit: TLabeledEdit;
    BaggageFreePlaceEdit: TLabeledEdit;
    TransactionIdHiddenEdit: TEdit;
    ActionButton: TButton;
    CloseButton: TButton;
    function isFormValid(): Boolean;
    procedure CloseButtonClick(Sender: TObject);
    procedure ActionButtonClick(Sender: TObject);
    procedure resetForm;
    procedure preFillForm(dataset: TDataSet);
    procedure activateEditMode;
    procedure deactivateEditMode;
    procedure updateRecordFromForm(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaggageForm: TBaggageForm;
  procedure executeInsertTransaction;
  procedure executeUpdateTransaction;
  procedure setParamsToQuery(withTransactionId: Boolean);
implementation

{$R *.dfm}

procedure TBaggageForm.CloseButtonClick(Sender: TObject);
begin
  Hide;
end;

function TBaggageForm.isFormValid(): Boolean;
begin
  if (PassengerIdEdit.Text = '')
    or (BaggageAmountEdit.Text = '')
    or (BaggageFreePlaceEdit.Text = '')
  then Result := False
  else Result := True;
end;


procedure TBaggageForm.resetForm;
begin
  TransactionIdHiddenEdit.Text := '';
  PassengerIdEdit.Text := '';
  BaggageAmountEdit.Text := '';
  BaggageFreePlaceEdit.Text := '';
end;

procedure TBaggageForm.preFillForm(dataset: TDataSet);
begin
  PassengerIdEdit.Text := dataset.FieldByName('PASSENGER_ID').AsString;
  BaggageAmountEdit.Text := dataset.FieldByName('BAGGAGE_AMOUNT').AsString;
  BaggageFreePlaceEdit.Text := dataset.FieldByName('BAGGAGE_FREE_SEATS').AsString;
  TransactionIdHiddenEdit.Text := dataset.FieldByName('TRANSACTION_ID').AsString;
end;

procedure TBaggageForm.activateEditMode;
begin
  ActionButton.Caption := 'Сохранить';
  ActionButton.OnClick := updateRecordFromForm;
end;

procedure TBaggageForm.deactivateEditMode;
begin
  ActionButton.Caption := 'Добавить';
  ActionButton.OnClick := ActionButtonClick;
end;

procedure TBaggageForm.updateRecordFromForm(Sender: TObject);
begin
  Unit2.executeSQLTransaction(DM.BaggageQuery, DM.BaggageData.DataSet, @executeUpdateTransaction);

  Hide;
  deactivateEditMode;
  resetForm;
end;

procedure TBaggageForm.ActionButtonClick(Sender: TObject);
begin
  if (isFormValid()) then
    begin
      Unit2.executeSQLTransaction(DM.BaggageQuery, DM.BaggageData.DataSet, @executeInsertTransaction);

      Hide;
      resetForm;
    end
  else ShowMessage('Заполните все поля');
end;

procedure executeInsertTransaction;
begin
  DM.BaggageQuery.SQL.Text := Unit1.getInsertSQLQuery('Baggage') + ' ' + Unit1.getInsertParamsString('Baggage') + ';';
  setParamsToQuery(false);
  DM.BaggageQuery.ExecSQL;
end;

procedure executeUpdateTransaction;
begin
  DM.BaggageQuery.SQL.Text := 'UPDATE BAGGAGE SET ' +
    'PASSENGER_ID = :passengerId, ' +
    'BAGGAGE_AMOUNT = :baggageAmount, ' +
    'BAGGAGE_FREE_SEATS = :baggageFreeSeats ' +
    'WHERE TRANSACTION_ID = :transactionId ;';
  setParamsToQuery(True);
  DM.BaggageQuery.ExecSQL;
end;

procedure setParamsToQuery(withTransactionId: Boolean);
begin
  DM.BaggageQuery.ParamByName('passengerId').AsInteger := StrToInt(BaggageForm.PassengerIdEdit.Text);
  DM.BaggageQuery.ParamByName('baggageAmount').AsInteger := StrToInt(BaggageForm.BaggageAmountEdit.Text);
  DM.BaggageQuery.ParamByName('baggageFreeSeats').AsInteger := StrToInt(BaggageForm.BaggageFreePlaceEdit.Text);
  if (withTransactionId) then DM.BaggageQuery.ParamByName('transactionId').AsInteger := StrToInt(BaggageForm.TransactionIdHiddenEdit.Text);
end;

end.
