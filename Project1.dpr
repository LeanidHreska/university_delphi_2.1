program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {DM: TDataModule},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {SearchForm},
  Unit5 in 'Unit5.pas' {QueriesForm},
  Unit6 in 'Unit6.pas' {PassengerForm},
  BaggageUnit in 'BaggageUnit.pas' {BaggageForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TSearchForm, SearchForm);
  Application.CreateForm(TQueriesForm, QueriesForm);
  Application.CreateForm(TPassengerForm, PassengerForm);
  Application.CreateForm(TBaggageForm, BaggageForm);
  Application.Run;
end.
