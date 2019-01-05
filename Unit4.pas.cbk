unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Unit1, Unit2, DB, DBTables;

type
  TSearchForm = class(TForm)
    SearchEdit: TLabeledEdit;
    SearchButton: TBitBtn;
    CloseButton: TButton;
    SearchByDropBox: TComboBox;
    IsFilterCheckBox: TCheckBox;
    procedure CloseButtonClick(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  SearchForm: TSearchForm;
  tableForSearching: string;
  procedure prepareForm(table: string);
  function getSelectedFieldForSearching(dropbox: TComboBox): string;

implementation

{$R *.dfm}

procedure TSearchForm.CloseButtonClick(Sender: TObject);
begin
  SearchForm.Hide;
end;

procedure prepareForm(table: string);
begin
  SearchForm.SearchByDropBox.Clear;
  if (table = 'Trains') then
    begin
      SearchForm.SearchByDropBox.Items.Add('Номер поезда');
      SearchForm.SearchByDropBox.Items.Add('Дата отправления');
      SearchForm.SearchByDropBox.Items.Add('Тип вагона');
      SearchForm.SearchByDropBox.ItemIndex := 0;
    end;
  SearchForm.IsFilterCheckBox.Checked := Unit1.getCurrentDataSet().Filtered;
  tableForSearching := table;
end;

procedure TSearchForm.SearchButtonClick(Sender: TObject);
var dataSet: TDataSet;
    selectedFieldForSearching: string;
begin
  if (tableForSearching = 'Trains') then
      dataSet := DM.TrainData.DataSet;
  if (tableForSearching = 'Passengers') then
    begin
      dataSet := DM.PassengerData.DataSet;
    end;
  if (tableForSearching = 'Baggage') then
    begin
      dataSet := DM.BaggageData.DataSet;
    end;

  selectedFieldForSearching := getSelectedFieldForSearching(SearchByDropBox);
  if (selectedFieldForSearching <> '') and (SearchEdit.Text <> '') then
    begin
      if not dataSet.Locate(selectedFieldForSearching, SearchEdit.Text, [loCaseInsensitive, loPartialKey]) then
        ShowMessage('"' + SearchByDropBox.Text + '" со значением ' + SearchEdit.Text + ' не найдено')
      else begin
        dataSet.Filtered := IsFilterCheckBox.Checked;;
        dataSet.Filter := selectedFieldForSearching + '=' + '''' + SearchEdit.Text + '''';
        SearchEdit.Text := '';
        Hide;
      end;
    end;
end;

function getSelectedFieldForSearching(dropbox: TComboBox): string;
begin
  if (tableForSearching = 'Trains') then
    begin
      case dropbox.ItemIndex of
        0: Result := 'TRAIN_ID';
        1: Result := 'DEPARTURE_DATE';
        2: Result := 'WAGON_TYPE';
      end;
    end;
end;

end.
