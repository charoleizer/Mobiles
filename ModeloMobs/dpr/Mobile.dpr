program Mobile;

uses
  Vcl.Forms,
  Main in '..\pas\Main.pas' {MainForm},
  FM.UI.BaseForm in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Views\FM.UI.BaseForm.pas' {BaseFormView},
  FM.UI.FormularioInterno in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Views\FM.UI.FormularioInterno.pas' {FormFormularioInterno},
  FM.Model.Base in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Models\FM.Model.Base.pas',
  M1.Exceptions in '..\pas\Core\M1.Exceptions.pas',
  M1.Forms.Factory in '..\pas\Core\M1.Forms.Factory.pas',
  M1.ResourceStrings in '..\pas\Core\M1.ResourceStrings.pas',
  FM.UI.View.Factory in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Views\FM.UI.View.Factory.pas',
  FM.Controller.Base.Impl in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.Base.Impl.pas',
  DDC.Singleton in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Libs\DDC.Singleton.pas',
  DDC.ValidationInfo in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Libs\DDC.ValidationInfo.pas',
  FM.Controller.Base in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.Base.pas',
  DDC.ViewMessages in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Libs\DDC.ViewMessages.pas',
  DDC.Notification.Service in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Libs\DDC.Notification.Service.pas',
  Login.UI.Form in '..\pas\View\Login.UI.Form.pas' {ViewLogin},
  Login.Controller in '..\pas\Controller\Login.Controller.pas',
  FM.Controller.Find.Impl in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.Find.Impl.pas',
  FM.Controller.Find in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.Find.pas',
  FM.Controller.FormularioInterno.Impl in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.FormularioInterno.Impl.pas',
  FM.Controller.FormularioInterno in '..\..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.FormularioInterno.pas',
  DashBoard.UI.Form in '..\pas\View\DashBoard.UI.Form.pas' {ViewDashBoard},
  DashBoard.Controller in '..\pas\Controller\DashBoard.Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
