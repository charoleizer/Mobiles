unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  SysmoSQL,
  HConexao;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    SQLConnection: TPSQLConnection;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}




procedure TfrmMain.FormCreate(Sender: TObject);
begin
  SQLConnection := TPSQLConnection.Create(Self);
  THlpConexao.Conectar(SQLConnection);
end;

end.
