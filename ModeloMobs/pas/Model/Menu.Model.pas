unit Menu.Model;

interface

uses
  FM.Model.Base, Menu.ViewObject;

type
  TModelBase = FM.Model.Base.TModelBase;

  TMenuViewlMsgs = class
  public
    const
    ClearRows: TGUID = '{54C4BDB7-8815-4D7F-97A9-C4CC22DE5845}';
    BuildCategories: TGUID = '{135A0B10-081A-473A-9B0D-276CD422AA8E}';
    FindCategories: TGUID = '{C490B36B-FC07-451D-92A6-BD297A4414FE}';
  end;

  TMenuModel = class(TModelBase)
  private
    FSelectedProgramName: string;
    FMyRowByCategoryList: TCategoryClass;
    FCategoryList: TCategoryList;
    FRowsList: TRowsyList;
  public

    { TODO -oVictor -cDesenvolver :
      Tem validações ? }

    property SelectedProgramName: string read FSelectedProgramName write FSelectedProgramName;
    property MyRowByCategoryList: TCategoryClass read FMyRowByCategoryList write FMyRowByCategoryList;
    property CategoryList: TCategoryList read FCategoryList write FCategoryList;
    property RowsList: TRowsyList read FRowsList write FRowsList;

    function New: TModelBase; override;
  end;

implementation

{ TMenuModel }



function TMenuModel.New: TModelBase;
begin
  Result := TMenuModel.Create;
end;

end.
