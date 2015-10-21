unit Login.UI.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, editnum,
  FM.UI.BaseForm,
  FM.Controller.Base;

type
  // Classe base de formulario interno não vai funcionar
  TViewLogin = class(TBaseFormView)
    Panel1: TPanel;
    EdtUserName: TEditText;
    EdtPassword: TEditText;
    BtnOk: TButton;
    BtnCancel: TButton;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);

  public
    function GetBaseController: IControllerBase;

  end;

var
  ViewLogin: TViewLogin;

implementation

uses
  Login.Model,
  M1.Forms.Factory;

{$R *.dfm}

{ TViewLogin }

{ TODO -oVictor -cDesenvolver :
  Form está por defauls visible False, pois se deixar true, ele pisca no create.
  Verificar se tem uma forma de tirar visible antes do create em tempo de execução }



procedure TViewLogin.BtnOkClick(Sender: TObject);
begin
  inherited;

  (FModel as TLoginModel).UserName := EdtUserName.Text;
  (FModel as TLoginModel).Password := EdtPassword.Text;

  { TODO -oVictor -cDesenvolver :
    Da forma que está implementado, o Validate vai disparar uma exceção, sendo assim, talvez não seja necessario esse if. }
  if (GetBaseController.Validate) then
  begin
    ViewFactory.InvokeShow(TM1Forms.Menu);
    close;
  end;

end;



function TViewLogin.GetBaseController: IControllerBase;
begin
  result := Controller as IControllerBase;
end;



procedure TViewLogin.BtnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

end.
