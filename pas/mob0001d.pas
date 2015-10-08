{
  Tipo:
  Descri��o: SYSMO MOBILE - Data M�dule - Controle de Acesso
  Padr�o:
}

unit mob0001d;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, SysmoSQL;

type
  TDtmMob0001d = class(TDataModule)
    SQLQuery: TPSQLDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  end;

var
  DtmMob0001d: TDtmMob0001d;

implementation

{$R *.dfm}

{ TDtmMob0001d }



procedure TDtmMob0001d.DataModuleDestroy(Sender: TObject);
begin
  SQLQuery.Close;
end;

end.

{
  Vers�o do projeto: 1.00
  Vers�o: 1.00
  Desenvolvedor: VB
  Data: 26/08/2008 14:00
  Registro: 4251
  Descri��o: Programa novo desenvolvido de acordo com o projeto 051.

  Vers�o do projeto: 2.16.28
  Vers�o: 2.00
  Desenvolvedor: EVB
  Data: 24/02/2011 14:55
  Registro: 11118
  Descri��o: Efetuada corre��o nos componentes DataSet alterando a propriedade
  NoMetadata := true;

  Vers�o do projeto: 2.17.0
  Vers�o: 2.01
  Desenvolvedor: RB
  Data: 06/04/2011 17:56
  Registro: 11186
  Descri��o: Convers�o para VCL.

  Vers�o do projeto: 2.17.10
  Vers�o: 2.06
  Desenvolvedor: JP
  Data: 01/11/2012 15:00
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
