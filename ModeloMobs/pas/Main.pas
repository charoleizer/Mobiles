unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
  private

  end;

var
  MainForm: TMainForm;

implementation

uses
  M1.Forms.Factory;

{$R *.dfm}




procedure TMainForm.FormShow(Sender: TObject);
begin
  ViewFactory.InvokeShow(TM1Forms.Login);
end;

end.
