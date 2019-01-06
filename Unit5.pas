unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids;

type
  TQueriesForm = class(TForm)
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    Query: TQuery;
    ExecuteQueryButton: TButton;
    CloseFormButton: TButton;
    procedure CloseFormButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueriesForm: TQueriesForm;

implementation

{$R *.dfm}

procedure TQueriesForm.CloseFormButtonClick(Sender: TObject);
begin
  Close;
end;

end.
