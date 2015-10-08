{
  Tipo:
  Descri��o: SYSMO MOBILE - Biblioteca - Registrar entrada/sa�da
  Padr�o:
}

unit mob0008;

interface

uses
  Classes, SysmoSQL, Sysmo, HRecords, SysUtils;

type
  TRegistraEntradaSaida = class
  public
    class procedure RegistrarEntrada(ASistema: TSistema);
    class procedure RegistrarSaida(ASistema: TSistema);
  end;

implementation

uses
  Vcl.Forms, superdtm;



class procedure TRegistraEntradaSaida.RegistrarEntrada(ASistema: TSistema);
begin
  with DtmSis do
  begin

    SQLQuery1.Close;
    SQLQuery1.CommandText := 'insert into SGREXE00 (PRG,DTA,HRE,EMP,USR,IDT)' +
      ' values (:Prg,:Dta,:Hre,:Emp,:Usr,:Idt)';
    SQLQuery1.Params.ParamValues['Prg']            := ASistema.UNT_EXE;
    SQLQuery1.Params.ParamValues['Emp']            := ASistema.EMP_SIS;
    SQLQuery1.Params.ParamValues['Usr']            := ASistema.USR_SIS;
    SQLQuery1.Params.ParamValues['Idt']            := ASistema.IDT_EXE;
    SQLQuery1.Params.ParamByName('Dta').AsDateTime := ASistema.DTT_EXE;
    SQLQuery1.Params.ParamByName('Hre').AsTime     := ASistema.DTT_EXE;
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
  end;
end;



class procedure TRegistraEntradaSaida.RegistrarSaida(ASistema: TSistema);
begin
  with DtmSis do
  begin
    SQLQuery1.Close;
    SQLQuery1.CommandText := 'update SGREXE00 ' +
      '   set HRS = (Current_TimeStamp) ' +
      ' where PRG = :Prg ' +
      '   and DTA = :Dta ' +
      '   and HRE = :Hre ' +
      '   and EMP = :Emp ' +
      '   and USR = :Usr ' +
      '   and IDT = :Idt';
    SQLQuery1.Params.ParamValues['Prg']            := ASistema.UNT_EXE;
    SQLQuery1.Params.ParamValues['Emp']            := ASistema.EMP_SIS;
    SQLQuery1.Params.ParamValues['Usr']            := ASistema.USR_SIS;
    SQLQuery1.Params.ParamValues['Idt']            := ASistema.IDT_EXE;
    SQLQuery1.Params.ParamByName('Dta').AsDateTime := ASistema.DTT_EXE;
    SQLQuery1.Params.ParamByName('Hre').AsTime     := ASistema.DTT_EXE;
    SQLQuery1.ExecSQL;
    SQLQuery1.Close;
  end;
end;

{
  Vers�o do projeto: 2.17.08
  Vers�o: 1.00
  Desenvolvedor: EFB
  Data: 08/06/2012 17:25
  Tarefa: 6632
  Descri��o: Programa novo.

  Vers�o do projeto: 2.17.10
  Vers�o: 1.01
  Desenvolvedor: JP
  Data: 01/11/2012 13:37
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

end.


