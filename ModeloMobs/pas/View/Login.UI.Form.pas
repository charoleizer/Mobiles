unit Login.UI.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  FM.UI.BaseForm, FM.UI.FormularioInterno, Vcl.StdCtrls, editnum;

type
  // Classe base de formulario interno não vai funcionar
  TViewLogin = class(TBaseFormView)
    Panel1: TPanel;
    EditText1: TEditText;
    EditText2: TEditText;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);

  end;

var
  ViewLogin: TViewLogin;

implementation

{$R *.dfm}

{ TViewLogin }

{ TODO -oVictor -cDesenvolver :
  Form está por defauls visible False, pois se deixar true, ele pisca no create.
  Verificar se tem uma forma de tirar visible antes do create em tempo de execução }



procedure TViewLogin.Button2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
