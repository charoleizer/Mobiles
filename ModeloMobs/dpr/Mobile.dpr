program Mobile;

uses
  Vcl.Forms,
  Main in '..\pas\Main.pas' {frmMain},
  FM.UI.FormularioInterno in '..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Views\FM.UI.FormularioInterno.pas',
  FM.UI.BaseForm in '..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Views\FM.UI.BaseForm.pas' {BaseFormView},
  FM.Model.Base in '..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Models\FM.Model.Base.pas',
  FM.Controller.Base in '..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.Base.pas',
  M1.Exceptions in '..\..\..\..\AppData\Local\GitHub\tds\tds\Modelo1\Core\M1.Exceptions.pas',
  M1.ResourceStrings in '..\..\..\..\AppData\Local\GitHub\tds\tds\Modelo1\Core\M1.ResourceStrings.pas',
  DDC.Notification.Service in '..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Libs\DDC.Notification.Service.pas',
  DDC.ValidationInfo in '..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Libs\DDC.ValidationInfo.pas',
  DDC.ViewMessages in '..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Libs\DDC.ViewMessages.pas',
  DDC.Singleton in '..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Libs\DDC.Singleton.pas',
  FM.UI.View.Factory in '..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Views\FM.UI.View.Factory.pas',
  FM.Controller.Base.Impl in '..\..\..\..\AppData\Local\GitHub\tds\tds\Framework\Controllers\FM.Controller.Base.Impl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
