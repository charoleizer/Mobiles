unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
  end;

var
  MainForm: TMainForm;

implementation

uses
  M1.Forms.Factory;

{$R *.dfm}




procedure TMainForm.Button1Click(Sender: TObject);
begin
  ViewFactory.InvokeShow(TM1Forms.Login);
end;



end.
