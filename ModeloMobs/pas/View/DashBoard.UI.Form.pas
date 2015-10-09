unit DashBoard.UI.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FM.UI.BaseForm, Vcl.ExtCtrls;

type
  TDashBoard = class(TBaseFormView)
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DashBoard: TDashBoard;

implementation

uses
  M1.Forms.Factory;

{$R *.dfm}




procedure TDashBoard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Application.MainForm.Close;
end;



procedure TDashBoard.FormCreate(Sender: TObject);
begin
  inherited;
  ViewFactory.InvokeShow(TM1Forms.Login);
end;

end.
