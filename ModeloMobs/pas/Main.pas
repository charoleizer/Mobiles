unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  end;

var
  MainForm: TMainForm;

implementation

uses
  M1.Forms.Factory;

{$R *.dfm}




procedure TMainForm.FormCreate(Sender: TObject);
begin
  // SQLConnection := TPSQLConnection.Create(Self);
  // THlpConexao.Conectar(SQLConnection);

  Application.ShowMainForm := false;
  ViewFactory.InvokeShow(TM1Forms.DashBoard);
end;



end.
