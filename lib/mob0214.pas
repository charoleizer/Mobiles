{
  Tipo:
  Descrição: SYSMO MOBILE - Consulta
  Padrão:
}

unit mob0214;

interface

uses
  Vcl.Forms, Types, FMTBcd, DBClient, Provider, DB, SqlExpr, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Classes,
  Vcl.Controls, Vcl.Graphics, Vcl.ComCtrls, StrUtils, SysUtils, Variants,
  Windows, Sysmo, HRecords, SysmoSQL, mob0214d;

const
  Unit_Name = 'Mob0214';
  Unit_Vers = '1.02';

type
  TFrmMob0214 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Timer1: TTimer;
    Panel2: TPanel;
    Panel3: TPanel;
    BtnFechar: TBitBtn;
    BtnOk: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    bOk: Boolean;
    FCampoDSC: String;
    FCampoCOD: String;
    FTipo: String;
  public
    property Tipo: String read FTipo write FTipo;
    property CampoCOD: String read FCampoCOD write FCampoCOD;
    property CampoDSC: String read FCampoDSC write FCampoDSC;
  end;

var
  FrmMob0214: TFrmMob0214;
  Sistema: TSistema;
  iCodigo: Integer;
  sDescricao: String;

implementation

uses
  HForm, superdtm, mob0003, HFocusControl;

{$R *.dfm}




procedure TFrmMob0214.FormCreate(Sender: TObject);
begin
  BtnOk.Enabled := False;
  THelperForm.AjustarFormulario(Sender);
  iCodigo    := 0;
  sDescricao := '';
  bOk        := False;
end;



procedure TFrmMob0214.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;



procedure TFrmMob0214.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  Self.Caption := Unit_Name + '-' + Unit_Vers + ' - Consulta ' + Tipo;

  DBGrid1.Columns[0].FieldName := CampoCOD;
  DBGrid1.Columns[1].FieldName := CampoDSC;

  DBGrid1.Columns[0].Title.Caption := 'Código';
  if (CampoDSC = 'DSC') then
    DBGrid1.Columns[1].Title.Caption := 'Descrição'
  else if (CampoDSC = 'NOM') then
    DBGrid1.Columns[1].Title.Caption := 'Nome'
  else if (CampoDSC = 'FAN') then
    DBGrid1.Columns[1].Title.Caption := 'Nome Fantasia';

  DtmMob0214d.DataSource1.Enabled := False;
  if (DtmMob0214d.Cliente.IsEmpty) then
  begin
    TMensagemMobile.MostrarMensagemInformacao(nil, 'Não há dados');
    Close;
    Exit;
  end;
  BtnOk.Enabled                   := True;
  DBGrid1.DataSource              := DtmMob0214d.DataSource1;
  DtmMob0214d.DataSource1.Enabled := True;
  SetaFoco(DBGrid1);
end;



procedure TFrmMob0214.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    BtnOkClick(Sender);
    Exit;
  end;
end;



procedure TFrmMob0214.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if (bOk) then
  begin
    iCodigo    := DBGrid1.Fields[0].AsInteger;
    sDescricao := DBGrid1.Fields[1].AsString;
  end;
  // THelperForm.RegistrarSaida(Sistema, Unit_Name);
end;



procedure TFrmMob0214.DBGrid1DblClick(Sender: TObject);
begin
  BtnOkClick(Sender);
end;



procedure TFrmMob0214.BtnFecharClick(Sender: TObject);
begin
  Close;
end;



procedure TFrmMob0214.BtnOkClick(Sender: TObject);
begin
  if (not(BtnOk.Enabled)) then
    Exit;
  if (DBGrid1.Fields[0].AsInteger > 0) then
    bOk := True;
  Close;
end;

end.

{
  Versão do projeto: 2.17.0
  Versão: 1.00
  Desenvolvedor: RB
  Data: 06/04/2011 18:04
  Registro: 11186
  Descrição: Programa novo. Tem como objetivo listar os usuários cadastrados.

  Versão: 1.00a
  Desenvolvedor: EFB
  Data: 26/09/2011 13:30
  Tarefa: 2430
  Descrição: Passa a desabilitar o botão Ok, pois o usuário estava pressionando o F4 e o enter
  ao mesmo tempo.

  Versão do projeto: 2.17.08
  Versão: 1.01
  Desenvolvedor: EFB
  Data: 25/05/2012 17:40
  Tarefa: 6017, 6355
  Descrição: Padronizado o sinal sonoro (beeps) a serem emitidos antes de todas as mensagens
  apresentadas pelos móbiles.

  Versão: 1.01a
  Desenvolvedor: Ednesio Colli
  Data: 09/10/2012 16:35
  Tarefa: 8140
  Descrição: Não estava mostrando no nome e a versão da unit no título da janela

  Versão do projeto: 2.17.10
  Versão: 1.02
  Desenvolvedor: JP
  Data: 01/11/2012 14:00
  Tarefa: 7143
  Descrição: Refatoração Parte 1
  Revisado:
  Uso de Try/Except;
  ErrorMessage;
  ApplyUpdates;
  Uso de Stored-Procedures que retornam dados e alteram registros na base de dados;
  Parâmetros do tipo Data em SQLDatasets;
  Removido Hints e Warnings.
}

{ ATENÇÃO:

  PADRÃO DE TAMANHO DE TELA DE MOBILES
  Homologado em coletor cuja resolução seja 240 x 320 pixels

  Formulário principal: (exemplos: mob0101.pas, mob0102.pas, mob0108.pas)
  BorderStyle : bsSingle
  ClientHeight: 259 (tamanho máximo permitido)
  ClientWidth : 238 (tamanho máximo permitido)
  Left        : 0 (se o ClientWidth/ClientHeight for o máximo)
  Top         : 0 (se o ClientWidth/ClientHeight for o máximo)
  Position    : poDesigned      (se o ClientWidth/ClientHeight for o máximo)
  poDesktopCenter (se o ClientWidth/ClientHeight NÃO for o máximo)

  Formulário de consulta: (semelhante aos SLCs, exemplos: mob0001, mob0201, mob0210)
  BorderStyle : bsSingle
  ClientHeight: 259 (tamanho máximo permitido)
  ClientWidth : 238 (tamanho máximo permitido)
  Position    : poMainFormCenter
  Top         : 10
  Left        : 10
}
