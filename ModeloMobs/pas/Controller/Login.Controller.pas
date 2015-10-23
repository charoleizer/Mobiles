unit Login.Controller;

interface

uses
  FM.Controller.Base.Impl, Login.Model;

type
  TLoginController = class(TControllerBase)
  protected
    function GetModel: TModelBase; override;
  private
    FModel: TLoginModel;

  public
    constructor Create; override;
    destructor Destroy; override;

    function Validate: Boolean; override;
  end;

implementation

uses
  Dialogs,
  System.SysUtils,
  M1.Exceptions,
  System.Rtti,
  DDC.Validator,
  DDC.Validator.Impl;

{ TLoginController }



constructor TLoginController.Create;
begin
  inherited;
  FModel := TLoginModel.Create;
end;



destructor TLoginController.Destroy;
begin
  FModel.Free;
  inherited;
end;



function TLoginController.GetModel: TModelBase;
begin
  Result := FModel;
end;



function TLoginController.Validate: Boolean;
var
  oValidator: IValidator<TLoginModel>;
begin

  { TODO -oVictor -cDesenvolver :
    Dados fixos. fazer esta consulta no banco }

  oValidator := TValidator<TLoginModel>.Create;

  oValidator.AddExtend(FModel.UserName, 'Usuário não cadastrado.',
    function(const AValue: TValue): Boolean
    begin
      Result := UpperCase(AValue.AsString) = 'VICTOR';
    end
    );

  Result := oValidator.Make(FModel, True).Fails;
  if (Result) then
  begin
    MessageDlg(oValidator.ErrorMessages.Text, mtWarning, [mbOK], 0);
    Result := False;
    Exit;
  end;

  { TODO -oVictor -cDesenvolver :
    A validação é feita em ordem aleatória. Dessa forma foi nessario aplicar o Make, sosinho para validar o Usuario.
    Estudar uma forma melhor de se fazer essa validação. }

  oValidator.AddExtend(FModel.Password, 'Senha incorreta.',
    function(const AValue: TValue): Boolean
    begin
      Result := UpperCase(AValue.AsString) = '12345';
    end
    );

  Result := not(oValidator.Make(FModel, True).Fails);
  if not(Result) then
  begin
    MessageDlg(oValidator.ErrorMessages.Text, mtWarning, [mbOK], 0);
    Result := False;
    Exit;
  end;

end;

end.
