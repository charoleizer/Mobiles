unit mob0010;

interface

  uses
    SysmoSQL, SysUtils, HIdCoderMD5, sysmo, Classes, mob0003, HIdCoder, Data.DB;

type

  TRgnUsuario = class
  private
    oSQLUsuario: TPSQLDataSet;

    FNumeroVezesFalhou: Integer;
    FAutenticarSomenteSuperUsuario: Boolean;
    FMensagemErroAutenticacao: String;
    FNumeroMaximoVezesAutenticacao: Integer;
  public
    constructor Create(AOwner: TComponent; ASQLConnection: TPSQLConnection); reintroduce;

    function AutenticarUsuario(ACodigo: Integer; ASenha: string): Boolean;

    property MensagemErroAutenticacao     : String  read FMensagemErroAutenticacao;
    property AutenticarSomenteSuperUsuario: Boolean read FAutenticarSomenteSuperUsuario write FAutenticarSomenteSuperUsuario;
    property NumeroVezesFalhou            : Integer read FNumeroVezesFalhou;
    property NumeroMaximoVezesAutenticacao: Integer read FNumeroMaximoVezesAutenticacao write FNumeroMaximoVezesAutenticacao;

    destructor Destroy; reintroduce;
  end;


implementation

uses
  HString, HTags;

{ TRgnUsuario }

function TRgnUsuario.AutenticarUsuario(ACodigo: Integer; ASenha: String): Boolean;

  procedure GetDadosUsuario;
  begin
     oSQLUsuario.Close;
     oSQLUsuario.CommandText := ' select * from SGRUSR01'  +
                                '  where COD = ' + IntToStr(ACodigo);
     oSQLUsuario.Open;
  end;

  function ValidarSuperUsuario: boolean;
  begin
    Result := True;
    if (AutenticarSomenteSuperUsuario) then
    begin
      if (oSQLUsuario.FieldByName('SPU').AsString = 'N') then
      begin
        FMensagemErroAutenticacao := 'Permitido acesso somente � super-usu�rios.';
        Result := False;
      end;
    end;
  end;

  function ValidarUsuario: boolean;
  begin
    if (oSQLUsuario.IsEmpty) then
    begin
      FMensagemErroAutenticacao := 'Usu�rio n�o cadastrado.';
      Result := False;
    end
    else
      Result := ValidarSuperUsuario;
  end;

  function ValidarSenha: boolean;
  var
    sSenha: String;
  begin
    Result := True;
    if Length(ASenha) >= 5 then
    begin
      sSenha := String(THlpIdCoder.StringToIdCoderMD5(AnsiString(LeftPad(IntToStr(ACodigo),3,'0')+ASenha)));
      if sSenha <> oSQLUsuario.FieldByName('SNH').AsString then
      begin
        FMensagemErroAutenticacao := 'Senha inv�lida.';
        Result := False;
      end;
    end
    else
    begin
      FMensagemErroAutenticacao := 'Senha inv�lida.';
      Result := False;
    end;
  end;

begin
  Result := True;
  if (not(NumeroVezesFalhou > NumeroMaximoVezesAutenticacao)) then
  begin
    GetDadosUsuario;

    if Result then
      Result := ValidarUsuario;

    if Result then
      Result := ValidarSenha;

  end
  else
    Result := False;

  if (not(Result)) then
  begin
    Inc(FNumeroVezesFalhou);
    Exit;
  end;
  
end;

constructor TRgnUsuario.Create(AOwner: TComponent; ASQLConnection: TPSQLConnection);
begin
  inherited Create;

  oSQLUsuario := TPSQLDataSet.Create(AOwner);
  oSQLUsuario.SQLConnection := ASQLConnection;

  FNumeroMaximoVezesAutenticacao := 3;  
end;



destructor TRgnUsuario.Destroy;
begin
  FreeAndNil(oSQLUsuario);
end;



end.

{
Vers�o do projeto: 2.17.10
  Vers�o: 1.00
  Desenvolvedor: Tatiane Piovesani
  Data: 20/05/2013 11:30
  Tarefa: 6478
  Descri��o: Programa novo.
  
Vers�o do projeto: 2.18.02 

Vers�o: 1.01
Desenvolvedor: Jo�o Carlos
Data: 17/02/2015 
Tarefa: 19027
Descri��o: Remo��o de Warnings e Hints. 
}
