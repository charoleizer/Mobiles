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
  end;

implementation

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

end.
