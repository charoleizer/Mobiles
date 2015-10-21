unit Menu.ViewObject;

interface

uses
  generics.collections;

type

  TCategoryClass = class
  public
    Category: String;
  end;

  TCategoryList = TObjectList<TCategoryClass>;

  TRowsClass = class
  public
    Category: String;
    ProgramName: String;
  end;

  TRowsyList = TObjectList<TRowsClass>;

implementation

end.
