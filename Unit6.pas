unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

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
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PassengerForm: TPassengerForm;

implementation

{$R *.dfm}

procedure TPassengerForm.btn2Click(Sender: TObject);
begin
  Hide;
end;

end.
