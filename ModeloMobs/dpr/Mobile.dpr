program Mobile;

uses
  Vcl.Forms,
  Main in '..\pas\Main.pas' {MainForm},
  M1.Forms.Factory in '..\pas\Core\M1.Forms.Factory.pas',
  Login.UI.Form in '..\pas\View\Login.UI.Form.pas' {ViewLogin},
  Login.Controller in '..\pas\Controller\Login.Controller.pas',
  Login.Model in '..\pas\Model\Login.Model.pas',
  M1.ResourceStrings in '..\pas\Core\M1.ResourceStrings.pas',
  M1.Exceptions in '..\pas\Core\M1.Exceptions.pas',
  Menu.UI.Form in '..\pas\View\Menu.UI.Form.pas' {ViewMenu},
  Menu.ViewObject in '..\pas\VO\Menu.ViewObject.pas',
  Menu.Controller in '..\pas\Controller\Menu.Controller.pas',
  Menu.Model in '..\pas\Model\Menu.Model.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
