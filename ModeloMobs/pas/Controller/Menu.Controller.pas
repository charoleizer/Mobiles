unit Menu.Controller;

interface

uses
  Menu.ViewObject, FM.Controller.Base.Impl, Menu.Model;

type
  TMenuController = class(TControllerBase)
  protected
    function GetModel: TModelBase; override;
  private
    FModel: TMenuModel;

    procedure FindCategories(Sender: TObject);
    procedure SetCategoriesOnList(ACategory: String);
    procedure NewCategories(ARowsByCategoryList: TCategoryList);

  public
    constructor Create; override;
    destructor Destroy; override;

    function Validate: Boolean; override;
  end;

implementation

uses
  cxVGrid,
  DDC.Notification.Service;

{ TMenuController }



constructor TMenuController.Create;
begin
  inherited;
  FModel        := TMenuModel.Create;
  TMenuModel(FModel).CategoryList := TCategoryList.Create();
  TMenuModel(FModel).RowsList     := TRowsyList.Create();

  NotificationService.Subscribe(FindCategories, TMenuViewlMsgs.FindCategories);
end;



destructor TMenuController.Destroy;
begin
  NotificationService.UnSubscribe(FindCategories);

  FModel.Free;
  inherited;
end;



function TMenuController.GetModel: TModelBase;
begin
  Result := FModel;
end;



function TMenuController.Validate: Boolean;
begin
  //
end;



procedure TMenuController.FindCategories;
begin
  SetCategoriesOnList('Comercial');
  SetCategoriesOnList('Logistica');
  NewCategories(TMenuModel(FModel).CategoryList);
end;



procedure TMenuController.SetCategoriesOnList(ACategory: String);
begin
  // Category
  TMenuModel(FModel).CategoryList.Add(TCategoryClass.Create);
  TMenuModel(FModel).CategoryList.Last.Category := ACategory;
end;



procedure TMenuController.NewCategories(ARowsByCategoryList: TCategoryList);
var
  MyRowByCategoryList: TCategoryClass;
begin

  TMenuModel(FModel).RowsList.Clear;
  NotificationService.SendMessage(FModel, TMenuViewlMsgs.ClearRows);
  for MyRowByCategoryList in ARowsByCategoryList do
  begin
    TMenuModel(FModel).MyRowByCategoryList := MyRowByCategoryList;
    NotificationService.SendMessage(FModel, TMenuViewlMsgs.BuildCategories);
  end;

end;

end.