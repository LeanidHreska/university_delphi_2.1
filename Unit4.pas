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
    end
  else if (table = 'Passengers') then
    begin
      SearchForm.SearchByDropBox.Items.Add('Имя пассажира');
      SearchForm.SearchByDropBox.Items.Add('Номер поезда');
      SearchForm.SearchByDropBox.Items.Add('Пункт отправления');
      SearchForm.SearchByDropBox.Items.Add('Пункт прибывания');
      SearchForm.SearchByDropBox.ItemIndex := 0;
    end
  else if (table = 'Baggage') then
    begin
      SearchForm.SearchByDropBox.Items.Add('Код пассажира');
      SearchForm.SearchByDropBox.ItemIndex := 0;
    end;
  SearchForm.IsFilterCheckBox.Checked := Unit1.getCurrentDataSet().Filtered;
  tableForSearching := table;
end;

procedure TSearchForm.SearchButtonClick(Sender: TObject);
var query: TQuery;
    selectedFieldForSearching: string;
begin
  if (tableForSearching = 'Trains') then
      query := DM.TrainQuery;
  if (tableForSearching = 'Passengers') then
      query := DM.PassengerQuery;
  if (tableForSearching = 'Baggage') then
      query := DM.BaggageQuery;

  selectedFieldForSearching := getSelectedFieldForSearching(SearchByDropBox);
  if (selectedFieldForSearching <> '') and (SearchEdit.Text <> '') then
    begin
      query.Filtered := IsFilterCheckBox.Checked;
      query.Filter := selectedFieldForSearching + '=' + '''' + SearchEdit.Text + '''';
      query.Locate(selectedFieldForSearching, SearchEdit.Text, [loCaseInsensitive, loPartialKey]);
      Hide;
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
    end
  else if (tableForSearching = 'Passengers') then
    begin
      case dropbox.ItemIndex of
        0: Result := 'PASSENGER_NAME';
        1: Result := 'TRAIN_ID';
        2: Result := 'POINT_OF_DEPARTURE';
        3: Result := 'POINT_OF_DESTINATION';
      end;
    end
  else if (tableForSearching = 'Baggage') then
    begin
      case dropbox.ItemIndex of
        0: Result := 'PASSENGER_ID';
      end;
    end;
end;

end.
