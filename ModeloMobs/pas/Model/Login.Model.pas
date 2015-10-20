unit Login.Model;

interface

uses
  FM.Model.Base;

type
  TModelBase = FM.Model.Base.TModelBase;

  TLoginModel = class(TModelBase)
  private
    FUserName: string;
    FPassWord: string;
  public

    { TODO -oVictor -cDesenvolver :
      Tem validações ? }
    property UserName: string read FUserName write FUserName;
    property Password: string read FPassWord write FPassWord;

    function New: TModelBase; override;
  end;

implementation


{ TMarcaModel }



function TLoginModel.New: TModelBase;
begin
  Result := TLoginModel.Create;
end;

end.
