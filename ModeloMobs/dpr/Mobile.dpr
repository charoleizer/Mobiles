program Mobile;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Main in '..\pas\Main.pas' {MainForm},
  FM.UI.BaseForm in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Views\FM.UI.BaseForm.pas' {BaseFormView},
  FM.UI.FormularioInterno in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Views\FM.UI.FormularioInterno.pas' {FormFormularioInterno},
  FM.Model.Base in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Models\FM.Model.Base.pas',
  M1.Forms.Factory in '..\pas\Core\M1.Forms.Factory.pas',
  FM.UI.View.Factory in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Views\FM.UI.View.Factory.pas',
  FM.Controller.Base.Impl in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.Base.Impl.pas',
  FM.Controller.Base in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.Base.pas',
  Login.UI.Form in '..\pas\View\Login.UI.Form.pas' {ViewLogin},
  Login.Controller in '..\pas\Controller\Login.Controller.pas',
  FM.Controller.Find.Impl in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.Find.Impl.pas',
  FM.Controller.Find in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.Find.pas',
  FM.Controller.FormularioInterno.Impl in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.FormularioInterno.Impl.pas',
  FM.Controller.FormularioInterno in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.FormularioInterno.pas',
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
