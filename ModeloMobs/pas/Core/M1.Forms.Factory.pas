unit M1.Forms.Factory;

interface

uses
  Vcl.Forms,
  FM.UI.View.Factory;

type
  ViewFactory = FM.UI.View.Factory.TViewFactory;
  TView = FM.UI.View.Factory.TView;

  TM1Forms = record
  const
    Login: TGUID = '{EA71AF9A-1B0C-4A3B-B640-58587D258C31}';
  end;

  TM1FormsRegister = class
  private
    class function CreateForm(FormClass: TFormClass): TForm;
  public
    class procedure Execute;
  end;

implementation

uses
  Classes, Controls,
  Login.UI.Form,
  Login.Controller,

  Main

    ;

{ TM1FormsRegister }



class function TM1FormsRegister.CreateForm(FormClass: TFormClass): TForm;
var
  View: TView;

begin
  // Metodo implementação de criação de forms (views) customizadas por aplicação

  View := TView(FormClass.Create(MainForm));

  { TODO -oVictor -cDesenvolver :
    Necessario chumbar MainForm? não consegui adicionar o MainForm a lista ViewRegistry, pois não tem controller. Se o Mainform tiver controller, como se vincula os 2 ?
    Talves colocando o código [ ViewFactory.InvokeShow(XXX); ] no dpr }

  View.Parent      := MainForm.Panel1;
  View.Align       := alClient;
  View.BorderStyle := bsNone;
  View.Visible     := True;

  Result := View;

end;



class procedure TM1FormsRegister.Execute;
begin

  ViewRegistry.OnCreateForm := CreateForm;
  ViewRegistry.Add(TM1Forms.Login, TViewLogin, TLoginController, False);

end;

initialization

TM1FormsRegister.Execute;

end.
