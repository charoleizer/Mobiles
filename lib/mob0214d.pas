{
  Tipo:
  Descri��o: SYSMO MOBILE - Data M�dule - Valida��o de Campos
  Padr�o:
}

unit mob0214d;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, SysmoSQL, DBClient, Provider, superdtm;

type
  TDtmMob0214d = class(TDataModule)
    DataSource1: TDataSource;
    dDataSet: TPSQLDataSet;
    pProvider: TDataSetProvider;
    Cliente: TPClientDataset;
    procedure DataModuleDestroy(Sender: TObject);
    procedure ClienteReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  end;

var
  DtmMob0214d: TDtmMob0214d;

implementation

uses
  HReconcile;

{$R *.dfm}

{ TDtmMob0214d }



procedure TDtmMob0214d.ClienteReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  THlpReconcile.GeneralReconcileError(DataSet, E, UpdateKind, Action);
end;



procedure TDtmMob0214d.DataModuleDestroy(Sender: TObject);
begin
  Cliente.Close;
end;

end.

{
  Vers�o do projeto: 2.17.0
  Vers�o: 1.00
  Desenvolvedor: RB
  Data: 06/04/2011 18:04
  Registro: 11186
  Descri��o: Programa novo.

  Vers�o do projeto: 2.17.10
  Vers�o: 1.05
  Desenvolvedor: JP
  Data: 01/11/2012 13:46
  Tarefa: 7143
  Descri��o: Refatora��o Parte 1
  Revisado:
  Uso de Try/Except;
  ErrorMessage;
  ApplyUpdates;
  Uso de Stored-Procedures que retornam dados e alteram registros na base de dados;
  Par�metros do tipo Data em SQLDatasets;
  Removido Hints e Warnings.
}
