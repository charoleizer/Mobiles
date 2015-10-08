{
  Tipo:
  Descri��o: SYSMO MOBILE - Controle de Acesso
  Padr�o:
}

unit mob0001;

interface

uses
  StrUtils, SysUtils, Types, Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Editnum, DB, SqlExpr,
  HIdCoderMD5, SysmoSQL, Windows, Sysmo, HRecords, mob0214a, uDataBase, mob0008,
  mob0010, System.Win.Registry, cxPropertiesStore, cxStorage;

const
  Unit_Name = 'Mob0001';
  Unit_Vers = '3.0a';

type
  TFrmMob0001 = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Bevel1: TBevel;
    LblUsr: TLabel;
    EdtUsr: TEdit;
    LblSnh: TLabel;
    EdtSnh: TEdit;
    LblEmp: TLabel;
    EdtEmp: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    BtnFechar: TBitBtn;
    BtnOk: TBitBtn;
    procedure BtnFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ControlChange(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FSQLConnection: TPSQLConnection;
    FTentativas: SmallInt;
    FSistema: TSistema;
    FCreate: Boolean;
    sRamo: String;
    oValidaCampo: TValidaCampo;
    sEmpresasDoUsuario: String;
    oRgnUsuario : TRgnUsuario;
    cxPropertiesStoreBase: TcxPropertiesStore;
    function ControlCheck(Control: TWinControl = nil): Boolean;
    function AutorizadoUsoMobile: Boolean;
    procedure RestaurarConfiguracoes;
    procedure SalvarConfiguracoes;
  public
    constructor Create(AOwner: TComponent; ASQLConnection: TPSQLConnection); reintroduce;
    property Sistema: TSistema read FSistema;
  end;

implementation

uses
  HConstantes, HTags, IniFiles, superdtm, mob0001d, sysmo02, HString, mob0003, HIdCoder, HFocusControl, rgn052,
  HBits;

const
  LOGIN_TENTATIVAS = 3;

{$R *.dfm}




procedure TFrmMob0001.BtnFecharClick(Sender: TObject);
begin
  Close;
end;



procedure TFrmMob0001.ControlChange(Sender: TObject);
begin
  THelperTags.SetTag(Sender, False);
  if Sender = EdtUsr then
  begin
    THelperTags.SetTag(EdtSnh, False);
    THelperTags.SetTag(EdtEmp, False);
    sEmpresasDoUsuario := '';
  end;
end;



function TFrmMob0001.ControlCheck(Control: TWinControl): Boolean;
var
  sMsg: String;
begin
  Result := True;

  if (ActiveTag(Control, EdtUsr)) then
  begin
    if (not(TMensagemMobile.CampoEmBranco(EdtUsr, 'Informe o usu�rio.'))) then
    begin
      sMsg := oValidaCampo.Validar('Usu�rios', 'Usu�rio n�o cadastrado', 'SGRUSR01', 'COD',
        'NOM', '', EdtUsr, False, 999);
      if (sMsg = '') then
        THelperTags.SetTag(EdtUsr, True)
      else
      begin
        if (sMsg <> 'ABORT') then
          TMensagemMobile.MostrarMensagemAtencao(EdtUsr, sMsg);
        EdtUsr.SelectAll;
        THelperTags.SetTag(EdtUsr, False);
      end;
    end;
    Result := GetTag(EdtUsr);
    if not Result then
      Exit;
    DtmSis.SGRUSR01.Close;
    DtmSis.dSGRUSR01.Close;
    DtmSis.dSGRUSR01.Params.ParamValues['Cod'] := StrToIntDef(GetParam(EdtUsr.Text), 0);
    DtmSis.dSGRUSR01.Open;
    DtmSis.SGRUSR01.Open;
    sEmpresasDoUsuario := Trim(DtmSis.SGRUSR01_EMP.AsString);
    sEmpresasDoUsuario := AnsiReplaceStr(sEmpresasDoUsuario, '<', '');
    sEmpresasDoUsuario := AnsiReplaceStr(sEmpresasDoUsuario, '>', '');
    if (sEmpresasDoUsuario <> '') then
      sEmpresasDoUsuario := ' and COD in (' + sEmpresasDoUsuario + ')';
  end;

  if ActiveTag(Control, EdtSnh) then
  begin
    Result := ControlCheck(EdtUsr);
    if Result then
    begin
      Result := oRgnUsuario.AutenticarUsuario(StrToInt(GetParam(edtusr.text)), edtSnh.text);

      if not Result then
        TMensagemMobile.MostrarMensagemAtencao(edtSnh, oRgnUsuario.MensagemErroAutenticacao);

      if (oRgnUsuario.NumeroVezesFalhou >= oRgnUsuario.NumeroMaximoVezesAutenticacao) then
      begin
        Close;
        exit;
      end

    end;

    if not Result then
      Exit;
  end;

  if ActiveTag(Control, EdtEmp) then
  begin
    Result := ControlCheck(EdtUsr);
    if Result then
    begin
      if not TMensagemMobile.CampoEmBranco(EdtEmp, 'Informe a empresa.') then
      begin
        sMsg := oValidaCampo.Validar('Empresas', 'Empresa n�o cadastrada', 'TRSTRA01', 'COD',
          'FAN', ' and COD < 1000 and DTX is null' + sEmpresasDoUsuario, EdtEmp);
        if (sMsg = '') then
          THelperTags.SetTag(EdtEmp, True)
        else
        begin
          if (sMsg <> 'ABORT') then
            TMensagemMobile.MostrarMensagemAtencao(EdtEmp, sMsg);
          EdtEmp.SelectAll;
          THelperTags.SetTag(EdtEmp, False);
        end;
      end;
    end;
    Result := GetTag(EdtEmp);
    if not Result then
      Exit;
    with DtmMob0001d do
    begin
      SQLQuery.Close;
      SQLQuery.CommandText := 'select RAM from SPSEMP00 where COD = ' + GetParam(EdtEmp.Text);
      SQLQuery.Open;
      sRamo := SQLQuery.FieldByName('RAM').AsString;
    end;
  end;
end;



constructor TFrmMob0001.Create(AOwner: TComponent;
  ASQLConnection: TPSQLConnection);
begin
  inherited Create(AOwner);
  oValidaCampo   := TValidaCampo.Create(Self);
  FCreate        := True;
  FSQLConnection := ASQLConnection;
  FTentativas    := 0;
  oRgnUsuario := TRgnUsuario.Create(Self,ASQLConnection);
  oRgnUsuario.AutenticarSomenteSuperUsuario := False;
  with FSistema do
  begin
    DAT_SIS := 0;
    EMP_SIS := 0;
    USR_SIS := 0;
    EMP_RAM := '';
  end;
  DtmMob0001d := TDtmMob0001d.Create(Self);
end;



procedure TFrmMob0001.FormActivate(Sender: TObject);
begin
  Timer1.Enabled := True;
end;



procedure TFrmMob0001.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(oValidaCampo);
  FreeAndNil(DtmMob0001d);
  FreeAndNil(oRgnUsuario);
  TRegistraEntradaSaida.RegistrarSaida(Sistema);
end;



procedure TFrmMob0001.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key = #13) and (ControlCheck(ActiveControl))) then
  begin
    if ActiveControl = EdtSnh then
    begin
      if ((Trim(EdtEmp.Text) <> '') and (GetTag(EdtEmp))) then
        SetaFoco(BtnOk)
      else
        SelectNext(ActiveControl, True, True);
    end
    else
      SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if (((Key = #27) and (not(ActiveControl is TCustomComboBox)))) then
    Close;
end;



procedure TFrmMob0001.BtnOkClick(Sender: TObject);

  procedure ExcluirRegistrosPerdidos;
  begin
    with DtmMob0001d do
    begin
      if ((SQLQuery.SQLConnection as TPSQLConnection).DBXDataBase = dbPostgres) then
      begin
        SQLQuery.Close;
        SQLQuery.CommandText := 'delete from GRLBLQ01 ' +
          ' where PID not in (select ' +
          IfThen(isPostgreSQL9orHigher(DtmSis.SQLConnection1), 'PID', 'PROCPID') +
          ' as PID from PG_STAT_ACTIVITY)';
        SQLQuery.ExecSQL;
      end
      else
      begin
        SQLQuery.Close;
        SQLQuery.CommandText := 'delete from GRLBLQ01 ' +
          ' where PID not in (select MON$ATTACHMENT_ID as PID from MON$ATTACHMENTS)';
        SQLQuery.ExecSQL;
      end;
      SQLQuery.Close;
    end;
  end;



begin
  if (not(ControlCheck)) then
    Exit;

  with DtmMob0001d do
  begin
    SQLQuery.Close;
    SQLQuery.CommandText := 'select MAX(Current_Date) as DAT from GRLPRM01';
    SQLQuery.Open;

    with FSistema do
    begin
      DAT_SIS := SQLQuery.FieldByName('DAT').AsDateTime;
      USR_SIS := StrToIntDef(GetParam(EdtUsr.Text), 0);
      EMP_SIS := StrToIntDef(GetParam(EdtEmp.Text), 0);
      EMP_RAM := ShortString(sRamo[1]);
    end;

    ExcluirRegistrosPerdidos;
  end;
  SalvarConfiguracoes;
  Close;
end;



procedure TFrmMob0001.FormShow(Sender: TObject);
begin
  RestaurarConfiguracoes;
end;



procedure TFrmMob0001.Timer1Timer(Sender: TObject);

  function ValidarVersao: Boolean;
  begin
    Result := False;
    with DtmMob0001d do
    begin
      SQLQuery.Close;
      SQLQuery.CommandText := 'select UAT, VER from SGRSIS01';
      SQLQuery.Open;
      if (not(SQLQuery.IsEmpty)) then
      begin
        if SQLQuery.FieldByName('UAT').asinteger < 0 then
        begin
          TMensagemMobile.MostrarMensagemAtencao(nil, 'O processo da �ltima atualiza��o do sistema (atlsysmo) ' +
            'foi interrompido!' + #10 + '� necess�rio executar novamente o processo de atualiza��o');
          Close;
          Exit;
        end
        else if SQLQuery.FieldByName('UAT').asinteger <> strtoint(sysmo02.DB_Vers) then
        begin
          if SQLQuery.FieldByName('UAT').asinteger < strtoint(sysmo02.DB_Vers) then
          begin
            TMensagemMobile.MostrarMensagemAtencao(nil, ftdi + 'Inconsist�ncia na Valida��o da Base de Dados' + ftdf +
              '<p>' +
              '- Vers�o na Base de Dados: ' + ftdi + SQLQuery.FieldByName('UAT').AsString + ftdf + '<p>' +
              '- Vers�o no Programa: ' + ftdi + sysmo02.DB_Vers + ftdf + '<p>' +
              '* Atualizar: ' + ftdi + 'Base de Dados' + ftdf);
          end
          else if SQLQuery.FieldByName('UAT').asinteger > strtoint(sysmo02.DB_Vers) then
          begin
            TMensagemMobile.MostrarMensagemAtencao(nil, ftdi + 'Inconsist�ncia na Valida��o da Base de Dados' + ftdf +
              '<p>' +
              '- Vers�o na Base de Dados: ' + ftdi + SQLQuery.FieldByName('UAT').AsString + ftdf + '<p>' +
              '- Vers�o no Programa: ' + ftdi + sysmo02.DB_Vers + ftdf + '<p>' +
              '* Atualizar: ' + ftdi + 'Programa' + ftdf);
          end;
{$IFNDEF DEBUG}
          Close;
          Exit;
{$ENDIF}
        end
        else if ((Trim(SQLQuery.FieldByName('VER').AsString) <> '') and (Trim(SQLQuery.
          FieldByName('VER').AsString) <> Sysmo02.Unit_Vers)) then
        begin
          TMensagemMobile.MostrarMensagemAtencao(nil,
            ftdi + 'Inconsist�ncia na Valida��o do Aplicativo' + ftdf + '<p>' +
            '- Vers�o dispon�vel no reposit�rio: ' + ftdi + Trim(SQLQuery.FieldByName('VER').AsString) + ftdf + '<p>' +
            '- Vers�o atual: ' + ftdi + Sysmo02.Unit_Vers + ftdf + '<p>' +
            '* Atualizar: ' + ftdi + 'Programa' + ftdf
            );
{$IFNDEF DEBUG}
          Close;
          Exit;
{$ENDIF}
        end;
      end;
      Result := True;
    end;
  end;



begin
  Timer1.Enabled := False;
  if FCreate then
  begin
    FCreate := False;

    if (not(ValidarVersao)) then
      Exit;

    if not AutorizadoUsoMobile then
    begin
      TMensagemMobile.MostrarMensagemInformacao(nil, 'Execu��o do aplicativo n�o autorizada.' + ftNl +
        'Aplicativo ser� finalizado.', 150);
      Close;
    end;
  end;
  if ControlCheck(EdtUsr) then
  begin
    SelectNext(ActiveControl, True, True);
    ControlChange(EdtSnh);
    ControlChange(EdtEmp);
    if (Trim(EdtEmp.Text) <> '') then
      ControlCheck(EdtEmp);
    SetaFoco(EdtSnh);
  end;
end;



function TFrmMob0001.AutorizadoUsoMobile: Boolean;
var
  aChaveMod: array [0 .. 15] of AnsiChar;
  Modulos: Int64;
begin
  Result := False;

  with DtmMob0001d do
  begin
    if SQLQuery.Active then
      SQLQuery.Close;
    SQLQuery.CommandText := 'SELECT MDL FROM SGRSIS01';
    SQLQuery.Open;
    if not SQLQuery.IsEmpty then
    begin
      SQLQuery.First;
      THlpString.CopyStrToPChar(AnsiString(SQLQuery.FieldByName('MDL').AsString), aChaveMod, 16);
      Modulos := (Int64(Ord(aChaveMod[4])) shl 32) + (Ord(aChaveMod[3]) shl 24) +
        (Ord(aChaveMod[2]) shl 16) + (Ord(aChaveMod[1]) shl 08) +
        (Ord(aChaveMod[0]));
      Result := THelperBits.GetBit(22, Modulos);
    end;
    if SQLQuery.Active then
      SQLQuery.Close;
  end;
end;



procedure TFrmMob0001.RestaurarConfiguracoes;
var
  sArqIni: string;
  Config: TIniFile;
  ARegistry: TRegistry;
begin
  cxPropertiesStoreBase             := TcxPropertiesStore.create(Self);
  cxPropertiesStoreBase.Name        := 'Config';
  cxPropertiesStoreBase.StorageName := 'SysmoS1\AreaDeTrabalho';
  cxPropertiesStoreBase.StorageType := stRegistry;
  with cxPropertiesStoreBase.Components.Add do
  begin
    Component := EdtUsr;
    Properties.Add('Text');
  end;
  with cxPropertiesStoreBase.Components.Add do
  begin
    Component := EdtEmp;
    Properties.Add('Text');
  end;

  ARegistry := TRegistry.Create;
  try
    if ARegistry.KeyExists('SysmoS1\AreaDeTrabalho') then
      cxPropertiesStoreBase.RestoreFrom
    else
    begin
      sArqIni := GetEnvironmentVariable('HOMEDRIVE') + GetEnvironmentVariable('HOMEPATH') + PathDelim + 'supervis.ini';
      if (not FileExists(sArqIni)) then
        sArqIni := ExtractFilePath(ParamStr(0)) + 'supervis.ini';
      Config := TIniFile.Create(sArqIni);
      EdtUsr.Text := Config.ReadString('sgr902', 'usuario', '1');
      EdtEmp.Text := Config.ReadString('sgr902', 'empresa', '1');
      FreeAndNil(Config);
    end;
  finally
    FreeAndNil(ARegistry);
  end;
end;



procedure TFrmMob0001.SalvarConfiguracoes;
begin
  if Assigned(cxPropertiesStoreBase) then
  begin
    cxPropertiesStoreBase.StoreTo(False);
    FreeAndNil(cxPropertiesStoreBase);
  end;
end;

{
  Vers�o do projeto: 1.00
  Vers�o: 1.00
  Desenvolvedor: VB
  Data: 26/08/2008 14:00
  Registro: 4251
  Descri��o: Programa novo desenvolvido de acordo com o projeto 051.

  Vers�o: 1.00a
  Desenvolvedor: THZ
  Data: 11/09/2008 13:50
  Registro: 4251
  Descri��o: Passa a verificar se o aplicativo possui autoriza��o para ser executado.

  Vers�o do projeto: 2.17.0
  Vers�o: 2.00
  Desenvolvedor: RB
  Data: 06/04/2011 17:56
  Registro: 11186
  Descri��o: Convers�o para VCL.

  Vers�o do projeto: 2.17.06
  Vers�o: 3.00
  Desenvolvedor: EFB
  Data: 25/11/2011 13:30
  Tarefa: 3554
  Descri��o: Passa a excluir os registros de bloqueio que est�o perdidos, independentemente do
  usu�rio.

  Vers�o do projeto: 2.17.08
  Vers�o: 3.01
  Desenvolvedor: EFB
  Data: 25/05/2012 17:40
  Tarefa: 6017, 6355
  Descri��o: Padronizado o sinal sonoro (beeps) a serem emitidos antes de todas as mensagens
  apresentadas pelos m�biles.

  Vers�o: 3.01a
  Desenvolvedor: Neimar Sierota
  Data: 20/11/2012 17:39
  Tarefa: 8816
  Descri��o: Ajustado procedimento ControlChange para que quando for alterado o usu�rio
  seja validado novamente o campo empresa, dessa forma impedindo que usu�rios
  tenham acesso a empresas que n�o est�o autorizados.

  Vers�o: 3.01b
  Desenvolvedor: J�sika Pellegrini
  Data: 12/04/2013 10:20
  Tarefa: 5516
  Descri��o: Passa a verificar a vers�o do post para buscar o identificador da conexao.

Vers�o do projeto: 2.17.10
  Vers�o: 3.02
  Desenvolvedor: Vanessa Mocellin
  Data: 07/06/2013 15:25
  Tarefa: 11209
  Descri��o: Passa a exibir mensagem de usu�rio inv�lido caso seja informado um c�digo maior que 999.  

  Vers�o: 3.02a
  Desenvolvedor: Tatiane Piovesani
  Data: 22/05/2013 17:40
  Tarefa: 6478
  Descri��o: Alterado para utilizar nova regra de neg�cio para autenticar o usu�rio.

Vers�o do projeto: 2.17.12
  Vers�o: 3.03
  Desenvolvedor: TA
  Data: 09/05/2012 17:30
  Registro: 4124
  Descri��o: Passa a usar a fun��o FetchsSTR do helper HString.

  Vers�o: 3.03a
  Desenvolvedor: EVB
  Data: 14/08/2012
  Tarefa: 5515
  Descri��o: Efetuado altera��es para tornar compat�vel com o Delphi XE2.

  Vers�o: 3.03b
  Desenvolvedor: JP
  Data: 01/11/2012 14:45
  Tarefa: 7143
  Descri��o: Refatora��o Parte 1
  Revisado:
  Uso de Try/Except;
  ErrorMessage;
  ApplyUpdates;
  Uso de Stored-Procedures que retornam dados e alteram registros na base de dados;
  Par�metros do tipo Data em SQLDatasets;
  Removido Hints e Warnings.

  Vers�o: 3.03c
  Desenvolvedor: APK
  Data: 06/11/2012
  Tarefa: 5515
  Descri��o: Adicionado diretivas de compila��o para que deixe o aplicativo rodar mesmo quando n�o passar
  nas valida��es de vers�o de base de dados e aplicativo quando compilado em Debug.

Vers�o do projeto: 2.18.02
  Vers�o: 3.05
  Desenvolvedor: Marcelo Melz
  Data: 25/09/2014
  Registro: 17122
  Descri��o: Passa a salvar e recuperar o ultimo usuario a se logar
  
  Vers�o: 3.05a
  Desenvolvedor: Jo�o Carlos
  Data: 17/02/2015 
  Tarefa: 19027
  Descri��o: Remo��o de Warnings e Hints. 
}

{ ATEN��O:

  PADR�O DE TAMANHO DE TELA DE MOBILES
  Homologado em coletor cuja resolu��o seja 240 x 320 pixels

  Formul�rio principal: (exemplos: mob0101.pas, mob0102.pas, mob0108.pas)
  BorderStyle : bsSingle
  ClientHeight: 259 (tamanho m�ximo permitido)
  ClientWidth : 238 (tamanho m�ximo permitido)
  Left        : 0 (se o ClientWidth/ClientHeight for o m�ximo)
  Top         : 0 (se o ClientWidth/ClientHeight for o m�ximo)
  Position    : poDesigned      (se o ClientWidth/ClientHeight for o m�ximo)
  poDesktopCenter (se o ClientWidth/ClientHeight N�O for o m�ximo)

  Formul�rio de consulta: (semelhante aos SLCs, exemplos: mob0001, mob0201, mob0210)
  BorderStyle : bsSingle
  ClientHeight: 259 (tamanho m�ximo permitido)
  ClientWidth : 238 (tamanho m�ximo permitido)
  Position    : poMainFormCenter
  Top         : 10
  Left        : 10
}

end.
