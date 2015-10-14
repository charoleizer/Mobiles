unit Login.Model;

interface

uses
  FM.Model.Base;

type
  TModelBase = FM.Model.Base.TModelBase;

  TLoginModel = class(TModelBase)
  public
    function New: TModelBase; override;
  end;

implementation


{ TMarcaModel }



function TLoginModel.New: TModelBase;
begin
  Result := TLoginModel.Create;
end;

end.
