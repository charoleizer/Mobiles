unit Login.UI.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FM.UI.BaseForm,
  FM.Controller.Base, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, dxSkinsCore, dxSkinsDefaultPainters, cxButtons;

const
  EM_SETCUEBANNER = $1501;
  WM_DESTROYFORM = WM_USER + 1;

type
  TEdit = class(Vcl.StdCtrls.TEdit)
  protected
    procedure DoSetTextHint(const Value: string); override;
  end;

  // Classe base de formulario interno não vai funcionar
  TViewLogin = class(TBaseFormView)
    Panel1: TPanel;
    BtnSignIn: TcxButton;
    EdtUserName: TEdit;
    EdtPassword: TEdit;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSignInClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    procedure DestroyForm(var message: TMessage); message WM_DESTROYFORM;

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



procedure TViewLogin.BtnSignInClick(Sender: TObject);
begin
  inherited;

  (FModel as TLoginModel).UserName := EdtUserName.Text;
  (FModel as TLoginModel).Password := EdtPassword.Text;

  { TODO -oVictor -cDesenvolver :
    Da forma que está implementado, o Validate vai disparar uma exceção, sendo assim, talvez não seja necessario esse if. }
  if (GetBaseController.Validate) then
  begin
    ViewFactory.InvokeShow(TM1Forms.Menu);
    PostMessage(self.Handle, WM_DESTROYFORM, 0, 0);
  end;
end;



procedure TViewLogin.DestroyForm(var message: TMessage);
begin
  Destroy;
end;



procedure TViewLogin.FormCreate(Sender: TObject);
begin
  inherited;
  TM1FormsRegister.UpdateMainCaption(self.Caption);
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

{ TEdit }



procedure TEdit.DoSetTextHint(const Value: string);
begin
  SendTextMessage(Handle, EM_SETCUEBANNER, WPARAM(1), Value);
end;

end.
