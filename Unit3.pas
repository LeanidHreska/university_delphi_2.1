unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Unit1, Unit2, Mask, DB;

type
  TForm3 = class(TForm)
    TrainIdEdit: TLabeledEdit;
    TicketAmountEdit: TLabeledEdit;
    TicketPriceEdit: TLabeledEdit;
    WagonTypeEdit: TLabeledEdit;
    btn1: TButton;
    btn2: TButton;
    DepartureDateEdit: TMaskEdit;
    DepartureDateLabel: TLabel;
    TransactionIdEditHidden: TEdit;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure updateRecordFromForm(Sender: TObject);
  end;

var
  Form3: TForm3;
  transactionId: Integer;
  procedure setParamsToQuery(withTransactionId: Boolean);
  procedure resetForm();
  procedure preFillForm(dataset: TDataSet);
  procedure changeButtonLabel(caption: string);
  procedure activateEditMode();
  procedure deactivateEditMode();
  procedure executeInsertTransaction();
  procedure executeUpdateTransaction;
  function isFormValid(): Boolean;
implementation

{$R *.dfm}

procedure TForm3.btn2Click(Sender: TObject);
begin
Form3.Hide;
deactivateEditMode;
end;

procedure executeInsertTransaction;
begin
  DM.TrainQuery.SQL.Text := Unit1.getInsertSQLQuery('Trains') + ' ' + Unit1.getInsertParamsString('Trains') + ';';
  setParamsToQuery(false);
  DM.TrainQuery.ExecSQL;
end;

procedure TForm3.btn1Click(Sender: TObject);
begin
  if (isFormValid()) then
    begin
      Unit2.executeSQLTransaction(DM.TrainQuery, DM.TrainData.DataSet, @executeInsertTransaction);

      Form3.Hide;
      resetForm;
    end
  else begin
    showmessage('Заполните все поля');
  end;
end;

function isFormValid(): Boolean;
begin
  if (Form3.TrainIdEdit.Text = '')
    or (Form3.DepartureDateEdit.Text = '')
    or (Form3.TicketAmountEdit.Text = '')
    or (Form3.TicketPriceEdit.Text = '')
    or (Form3.WagonTypeEdit.Text = '')
  then Result := False
  else Result := True;
end;

procedure setParamsToQuery(withTransactionId: Boolean);
begin
  DM.TrainQuery.ParamByName('trainId').AsInteger := StrToInt(Form3.TrainIdEdit.Text);
  DM.TrainQuery.ParamByName('departureDate').AsDate := StrToDate(Form3.DepartureDateEdit.Text);
  DM.TrainQuery.ParamByName('ticketQuantity').AsInteger := StrToInt(Form3.TicketAmountEdit.Text);
  DM.TrainQuery.ParamByName('ticketPrice').AsFloat := StrToInt(Form3.TicketPriceEdit.Text);
  DM.TrainQuery.ParamByName('wagonType').AsString := Form3.WagonTypeEdit.Text;
  if (withTransactionId) then DM.TrainQuery.ParamByName('transactionId').AsInteger := StrToInt(Form3.TransactionIdEditHidden.Text);
end;

procedure preFillForm(dataset: TDataSet);
begin
  Form3.TrainIdEdit.Text := dataset.FieldByName('TRAIN_ID').AsString;
  Form3.DepartureDateEdit.Text := dataset.FieldByName('DEPARTURE_DATE').AsString;
  Form3.TicketAmountEdit.Text := dataset.FieldByName('TICKET_QUANTITY').AsString;
  Form3.TicketPriceEdit.Text := dataset.FieldByName('TICKET_PRICE').AsString;
  Form3.WagonTypeEdit.Text := dataset.FieldByName('WAGON_TYPE').AsString;
  Form3.TransactionIdEditHidden.Text := dataset.FieldByName('TRANSACTION_ID').AsString;
end;

procedure changeButtonLabel(caption: string);
begin
  Form3.btn1.Caption := caption;
end;

procedure resetForm();
begin
  Form3.TrainIdEdit.Text := '';
  Form3.DepartureDateEdit.Text := '';
  Form3.TicketAmountEdit.Text := '';
  Form3.TicketPriceEdit.Text := '';
  Form3.WagonTypeEdit.Text := '';
end;

procedure activateEditMode();
begin
  changeButtonLabel('Сохранить');
  Form3.btn1.OnClick := Form3.updateRecordFromForm;
end;

procedure deactivateEditMode();
begin
  changeButtonLabel('Добавить');
  Form3.btn1.OnClick := Form3.btn1Click;
end;

procedure executeUpdateTransaction;
begin
  DM.TrainQuery.SQL.Text := 'UPDATE TRAINS SET ' +
    'TRAIN_ID = :trainId, ' +
    'DEPARTURE_DATE = :departureDate, ' +
    'TICKET_QUANTITY = :ticketQuantity, ' +
    'TICKET_PRICE = :ticketPrice, ' +
    'WAGON_TYPE = :wagonType ' +
    'WHERE TRANSACTION_ID = :transactionId ;';

  setParamsToQuery(True);
  DM.TrainQuery.ExecSQL;
end;

procedure TForm3.updateRecordFromForm(Sender: TObject);
begin
  Unit2.executeSQLTransaction(DM.TrainQuery, DM.TrainData.DataSet, @executeUpdateTransaction);

  Form3.Hide;
  deactivateEditMode;
  resetForm;
end;

end.
