unit Menu.UI.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxEdit, dxSkinsCore, dxSkinsDefaultPainters,
  Vcl.ImgList, cxInplaceContainer, cxVGrid, cxImage, Vcl.StdCtrls, Vcl.ExtCtrls,
  Menu.ViewObject,
  FM.UI.BaseForm,
  FM.Controller.Base,
  M1.Forms.Factory;

type
  TViewMenu = class(TBaseFormView)
    cxImageList1: TcxImageList;
    Panel1: TPanel;
    cxVirtualVerticalGrid1: TcxVirtualVerticalGrid;
    cxVirtualVerticalGrid2: TcxVirtualVerticalGrid;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxVirtualVerticalGrid1MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cxVirtualVerticalGrid2MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  protected
    procedure DoInitialize; override;

  private
    procedure ClearRows(Sender: TObject);
    procedure BuildCategories(Sender: TObject);

    procedure BuildSignOutButton(Sender: TObject);
    procedure BuildBackButton(Sender: TObject);

    procedure SetRowsOnList(ACategory, AProgramName: String);
    procedure NewRows(ARowsList: TRowsyList; ASelectedCategory: String);

  public
    function GetBaseController: IControllerBase;

  end;

var
  ViewMenu: TViewMenu;

implementation

uses
  Menu.Model,
  DDC.Notification.Service;

{$R *.dfm}

{ TViewMenu }



procedure TViewMenu.FormCreate(Sender: TObject);
begin
  inherited;
  NotificationService.Subscribe(ClearRows, TMenuViewlMsgs.ClearRows);
  NotificationService.Subscribe(BuildCategories, TMenuViewlMsgs.BuildCategories);
  NotificationService.Subscribe(BuildSignOutButton, TMenuViewlMsgs.BuildSignOutButton);
  NotificationService.Subscribe(BuildBackButton, TMenuViewlMsgs.BuildBackButton);
end;



procedure TViewMenu.FormDestroy(Sender: TObject);
begin
  NotificationService.UnSubscribe(ClearRows);
  NotificationService.UnSubscribe(BuildCategories);
  NotificationService.UnSubscribe(BuildSignOutButton);
  NotificationService.UnSubscribe(BuildBackButton);
  inherited;
end;



function TViewMenu.GetBaseController: IControllerBase;
begin
  result := Controller as IControllerBase;
end;



procedure TViewMenu.NewRows(ARowsList: TRowsyList; ASelectedCategory: String);
var
  MyRowList: TRowsClass;
begin
  TMenuModel(FModel).CategoryList.Clear;
  cxVirtualVerticalGrid1.ClearRows;

  for MyRowList in ARowsList do
  begin
    if (MyRowList.Category = ASelectedCategory) then
    begin
      // Row
      cxVirtualVerticalGrid1.Add(TcxEditorRow);
      TcxEditorRow(cxVirtualVerticalGrid1.LastRow).Name := 'cxEditorRow' + MyRowList.ProgramName;
      TcxEditorRow(cxVirtualVerticalGrid1.LastRow).Properties.ImageIndex := 0;
      TcxEditorRow(cxVirtualVerticalGrid1.LastRow).Properties.EditPropertiesClass := TcxImageProperties;
      TcxImageProperties(TcxEditorRow(cxVirtualVerticalGrid1.LastRow).Properties.EditProperties).Caption := MyRowList.ProgramName;
    end;
  end;

end;



procedure TViewMenu.SetRowsOnList(ACategory, AProgramName: String);
var
  i: Integer;
begin
  // Rows
  for i := 1 to 3 do
  begin
    TMenuModel(FModel).RowsList.Add(TRowsClass.Create);
    TMenuModel(FModel).RowsList.Last.ProgramName := AProgramName + IntToStr(Random(10000));
    TMenuModel(FModel).RowsList.Last.Category    := ACategory;
  end;

end;



procedure TViewMenu.BuildBackButton(Sender: TObject);
begin
  cxVirtualVerticalGrid2.ClearRows;
  cxVirtualVerticalGrid2.Add(TcxCategoryRow);
  TcxCategoryRow(cxVirtualVerticalGrid2.LastRow).Name := 'cxVoltar';
  TcxCategoryRow(cxVirtualVerticalGrid2.LastRow).Properties.Caption := 'Voltar';
  TcxCategoryRow(cxVirtualVerticalGrid2.LastRow).Properties.HeaderAlignmentHorz := taCenter;
  TcxCategoryRow(cxVirtualVerticalGrid2.LastRow).Options.ShowExpandButton := False;
end;



procedure TViewMenu.BuildCategories(Sender: TObject);
begin
  // Category
  cxVirtualVerticalGrid1.Add(TcxCategoryRow);
  TcxCategoryRow(cxVirtualVerticalGrid1.LastRow).Name := 'cxCategoryRow' + TMenuModel(FModel).MyRowByCategoryList.Category;
  TcxCategoryRow(cxVirtualVerticalGrid1.LastRow).Properties.Caption := TMenuModel(FModel).MyRowByCategoryList.Category;
  TcxCategoryRow(cxVirtualVerticalGrid1.LastRow).Options.CanAutoHeight := False;
  TcxCategoryRow(cxVirtualVerticalGrid1.LastRow).Options.CanMovedToCustomizationForm := False;
  TcxCategoryRow(cxVirtualVerticalGrid1.LastRow).Options.CanResized := False;
  TcxCategoryRow(cxVirtualVerticalGrid1.LastRow).Options.Moving := False;
  TcxCategoryRow(cxVirtualVerticalGrid1.LastRow).Options.ShowExpandButton := False;
  TcxCategoryRow(cxVirtualVerticalGrid1.LastRow).Options.ShowInCustomizationForm := False;
  TcxCategoryRow(cxVirtualVerticalGrid1.LastRow).Options.TabStop := False;
end;



procedure TViewMenu.BuildSignOutButton(Sender: TObject);
begin
  cxVirtualVerticalGrid2.ClearRows;
  cxVirtualVerticalGrid2.Add(TcxCategoryRow);
  TcxCategoryRow(cxVirtualVerticalGrid2.LastRow).Name := 'cxSignOut';
  TcxCategoryRow(cxVirtualVerticalGrid2.LastRow).Properties.Caption := 'SignOut';
  TcxCategoryRow(cxVirtualVerticalGrid2.LastRow).Properties.HeaderAlignmentHorz := taCenter;
  TcxCategoryRow(cxVirtualVerticalGrid2.LastRow).Options.ShowExpandButton := False;
end;



procedure TViewMenu.ClearRows(Sender: TObject);
begin
  cxVirtualVerticalGrid1.ClearRows;
end;



procedure TViewMenu.cxVirtualVerticalGrid1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Assigned(TcxVerticalGrid(Sender).FocusedRow)) and (TcxVerticalGrid(Sender).FocusedRow.ClassType = TcxCategoryRow) then
  begin

    SetRowsOnList(TcxCategoryRow(TcxVerticalGrid(Sender).FocusedRow).Properties.Caption, 'Mob' + TcxCategoryRow(TcxVerticalGrid(Sender).FocusedRow).Properties.Caption);
    NewRows(TMenuModel(FModel).RowsList, TcxCategoryRow(TcxVerticalGrid(Sender).FocusedRow).Properties.Caption);
    BuildBackButton(Self);

  end;
end;



procedure TViewMenu.cxVirtualVerticalGrid2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Assigned(TcxVerticalGrid(Sender).FocusedRow)) and (TcxVerticalGrid(Sender).FocusedRow.ClassType = TcxCategoryRow) then
  begin

    if (TcxCategoryRow(TcxVerticalGrid(Sender).FocusedRow).Name = 'cxVoltar') then
      NotificationService.SendMessage(FModel, TMenuViewlMsgs.FindCategories)

    else if (TcxCategoryRow(TcxVerticalGrid(Sender).FocusedRow).Name = 'cxSignOut') then
    begin
      ViewFactory.InvokeShow(TM1Forms.Login);
      Destroy;
    end;

  end;
end;



procedure TViewMenu.DoInitialize;
begin
  inherited;
  NotificationService.SendMessage(FModel, TMenuViewlMsgs.FindCategories);
end;

end.
