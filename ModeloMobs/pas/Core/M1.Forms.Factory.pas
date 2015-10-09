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
    DashBoard: TGUID = '{640DFB2C-579E-4F53-82E0-00368CD7DD53}';
    Login : TGUID = '{EA71AF9A-1B0C-4A3B-B640-58587D258C31}';
  end;

  TM1FormsRegister = class
  private
    class function CreateForm(FormClass: TFormClass): TForm;
  public
    class procedure Execute;
  end;

implementation

uses
  Classes,
  DashBoard.UI.Form,
  DashBoard.Controller,
  Login.UI.Form,
  Login.Controller;


{ TM1FormsRegister }

class function TM1FormsRegister.CreateForm(FormClass: TFormClass): TForm;
var
  View: TView;
begin
  //Metodo implementação de criação de forms (views) customizadas por aplicação
   View := TView(FormClass.Create( TComponent(ViewFactory.DashBoardView) ));
   View.Parent := TDashBoard( TComponent(ViewFactory.DashBoardView) ).Panel1;
end;

class procedure TM1FormsRegister.Execute;
begin
  ViewRegistry.OnCreateForm := CreateForm;
  ViewRegistry.DashboardID := TM1Forms.Dashboard;
  ViewRegistry.Add(TM1Forms.DashBoard , TDashBoard, TDashBoardController, False);
  ViewRegistry.Add(TM1Forms.Login , TViewLogin, TLoginController, False);
end;

initialization
  TM1FormsRegister.Execute;

end.
