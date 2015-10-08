{
  Tipo:
  Descri��o: SYSMO MOBILE - Biblioteca - Valida��o de Campos
  Padr�o:
}

unit mob0214a;

interface

uses
  Classes, Vcl.StdCtrls, SysUtils, Vcl.Forms, SysmoSQL, sysmo, mob0214d, mob0214;

type
  TValidateTextOptions = (vtoNumbers, vtoLetters, vtoAccent, vtoOthers, vtoCommon);
  TValidateTextOptionsSet = set of TValidateTextOptions;

  TValidaCampo = class
  private
    FDtmMob0214d: TDtmMob0214d;
  public
    constructor Create(AFormPai: TForm); reintroduce;
    destructor Destroy; override;
    function Validar(const ATipo, AMsgErro, ATabela, ACampoCOD, ACampoDSC, AFiltro: String;
      var AEdit: TEdit; const AF4: Boolean = False; const ATamanhoMaximo: Integer = 0; const ACampoNumerico: Boolean = False): String;
    function ValidateText(const AText: String; AOptions: TValidateTextOptionsSet;
      const AOtherCharacters: array of char; const AConsidersSpaceAsALetter: Boolean = true): Boolean;

  end;

implementation

{ TValidaCampo }



constructor TValidaCampo.Create(AFormPai: TForm);
begin
  inherited Create;
  FDtmMob0214d := TDtmMob0214d.Create(AFormPai);
  DtmMob0214d  := FDtmMob0214d;
end;



destructor TValidaCampo.Destroy;
begin
  inherited Destroy;
end;



function TValidaCampo.ValidateText(const AText: String; AOptions: TValidateTextOptionsSet;
  const AOtherCharacters: array of char; const AConsidersSpaceAsALetter: Boolean = true): Boolean;
var
  cCaractere, cAux1: char;
  bOk: Boolean;
const
  aComuns = ['.', ',', '(', ')', '-', '_'];
  aAcentuacoes = [
    '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�',
    '�', '�',
    '�', '�'
    ];
begin

  // Valida conte�do do campo de acordo com os par�metros informados.
  Result := False;
  for cCaractere in AText do // Varre todos os caracteres contidos no texto.
  begin
    if ((CharInSet(cCaractere, ['0' .. '9'])) and (vtoNumbers in AOptions)) then // Se o caracter for um n�mero.
      continue;
    if ((CharInSet(cCaractere, ['a' .. 'z', 'A' .. 'Z'])) and (vtoLetters in AOptions)) then
    // Se o caracter for uma letra.
      continue;
    if ((cCaractere = #32) and (vtoLetters in AOptions) and (AConsidersSpaceAsALetter)) then
    // Se o caracter for um espa�o em branco.
      continue;
    if ((CharInSet(cCaractere, aAcentuacoes)) and (vtoAccent in AOptions)) then
    // Se o caracter for uma letra acentuada.
      continue;
    if ((CharInSet(cCaractere, aComuns)) and (vtoCommon in AOptions)) then // Se for um caracter comum.
      continue;

    // Verifica se o caracter se encontra dentro da lista de outros caracteres aceitos.
    if (vtoOthers in AOptions) then
    begin
      bOk := False;
      for cAux1 in AOtherCharacters do // Varre a lista de outros caracteres.
      begin
        if (cAux1 = cCaractere) then // Se encontrou.
        begin
          bOk := true;
          break;
        end;
      end;
      if (not(bOk)) then // Se n�o encontrou.
        exit;
    end
    else // Se n�o foi optado por buscar na lista de outros caracteres aceitos.
      exit;
  end;
  Result := true;
end;



function TValidaCampo.Validar(const ATipo, AMsgErro, ATabela, ACampoCOD, ACampoDSC, AFiltro: String;
  var AEdit: TEdit; const AF4: Boolean = False; const ATamanhoMaximo: Integer = 0; const ACampoNumerico: Boolean = False): String;
var
  iCodigo: Integer;
  sDescricao: String;

begin
  if ((ATamanhoMaximo > 0) and (StrToIntDef(GetParam(AEdit.Text), 0) > ATamanhoMaximo)) then
  begin
    Result := AMsgErro;
    Exit;
  end;

  Result := '';
  with FDtmMob0214d do
  begin
    // Procura por C�digo
    if ((not(AF4)) and (StrToIntDef(GetParam(AEdit.Text), 0) > 0)) then
    begin
      Cliente.Close;
      dDataSet.Close;
      dDataSet.CommandText := 'select cast(count(*) as numeric(9,0)) as CNT ' +
        '  from ' + ATabela +
        ' where ' + ACampoCOD + ' = :' + ACampoCOD + AFiltro;

      dDataSet.Params.ParamValues[ACampoCOD] := StrToIntDef(GetParam(AEdit.Text), 0);
      Cliente.Open;
      if (Cliente.FieldByName('CNT').AsInteger > 0) then
      begin
        Cliente.Close;
        dDataSet.Close;
        dDataSet.CommandText := 'select ' + ACampoDSC +
          '  from ' + ATabela +
          ' where ' + ACampoCOD + ' = :' + ACampoCOD + AFiltro;
        dDataSet.Params.ParamValues[ACampoCOD] := StrToIntDef(GetParam(AEdit.Text), 0);
        Cliente.Open;
        if ACampoNumerico then
          AEdit.Text := IntToStr(StrToIntDef(GetParam(AEdit.Text), 0))
        else
          AEdit.Text := IntToStr(StrToIntDef(GetParam(AEdit.Text), 0)) + '      ' +
            Cliente.FieldByName(ACampoDSC).AsString;
      end
      else
      begin
        Result := AMsgErro;
      end;
    end
    else
    // Procura por Descri��o
    begin
      if (not(ValidateText(Trim(AEdit.Text), [vtoLetters, vtoAccent, vtoNumbers, vtoCommon], []))) then
      // Aceita letras (com espa�os e acentua��o), n�meros e alguns caracteres comuns.
      begin
        Result := 'Conte�do inv�lido';
        exit;
      end;

      Cliente.Close;
      dDataSet.Close;
      dDataSet.CommandText := 'select cast(count(*) as numeric(9,0)) as CNT ' +
        '  from ' + ATabela +
        ' where ' + ACampoDSC + ' like ''' + Trim(AEdit.Text) + '%''' + AFiltro;
      Cliente.Open;
      if ((not(AF4)) and (Cliente.FieldByName('CNT').AsInteger = 1)) then
      begin
        Cliente.Close;
        dDataSet.Close;
        dDataSet.CommandText := 'select ' + ACampoCOD + ',' + ACampoDSC +
          '  from ' + ATabela +
          ' where ' + ACampoDSC + ' like :' + ACampoDSC + AFiltro;
        dDataSet.Params.ParamValues[ACampoDSC] := Trim(AEdit.Text) + '%';
        Cliente.Open;
        AEdit.Text := Cliente.FieldByName(ACampoCOD).AsString + '      ' +
          Cliente.FieldByName(ACampoDSC).AsString;
      end
      else if (Cliente.FieldByName('CNT').AsInteger > 0) then
      begin
        Cliente.Close;
        dDataSet.Close;
        dDataSet.CommandText := 'select ' + ACampoCOD + ',' + ACampoDSC +
          '  from ' + ATabela +
          ' where ' + ACampoDSC + ' like :' + ACampoDSC + AFiltro +
          ' order by ' + ACampoDSC;
        dDataSet.Params.ParamValues[ACampoDSC] := Trim(AEdit.Text) + '%';
        Cliente.Open;

        DtmMob0214d := FDtmMob0214d;

        mob0214.Sistema     := Sistema;
        FrmMob0214          := TFrmMob0214.Create(Nil);
        FrmMob0214.Tipo     := ATipo;
        FrmMob0214.CampoCOD := ACampoCOD;
        FrmMob0214.CampoDSC := ACampoDSC;
        FrmMob0214.ShowModal;
        FrmMob0214.Release;
        iCodigo    := mob0214.iCodigo;
        sDescricao := mob0214.sDescricao;
        if (iCodigo > 0) then
        begin
          if (ACampoNumerico) then
            AEdit.Text := Trim(IntToStr(iCodigo))
          else
            AEdit.Text := IntToStr(iCodigo) + '      ' + sDescricao;
        end
        else
          Result := 'ABORT';
      end
      else
      begin
        Result := AMsgErro;
      end;
    end;
  end;
end;

{
  Vers�o do projeto: 2.17.0
  Vers�o: 1.00
  Desenvolvedor: RB
  Data: 06/04/2011 18:04
  Registro: 11186
  Descri��o: Programa novo para valida��o dos campos.

  Vers�o do projeto: 2.17.06
  Vers�o: 3.00
  Desenvolvedor: EFB/FBS/NMA/VS
  Data: 13/04/2011 13:30
  Tarefa: 397
  Descri��o: PROJETO GERENCIAMENTO DE ENDERE�OS - SEGUNDA ETAPA
  -> Adicionado ValidateText
  
Vers�o do projeto: 2.17.10
  Vers�o: 3.02
  Desenvolvedor: Vanessa Mocellin
  Data: 07/06/2013 15:25
  Tarefa: 11209
  Descri��o: Inserido parametro tamanho maximo para valida��o do campo.  

Vers�o do projeto: 2.17.12
  Vers�o: 3.03
  Desenvolvedor: JP
  Data: 01/11/2012
  Tarefa: 7143
  Descri��o: Refatora��o Parte 1
  Revisado:
  Uso de Try/Except;
  ErrorMessage;
  ApplyUpdates;
  Uso de Stored-Procedures que retornam dados e alteram registros na base de dados;
  Par�metros do tipo Data em SQLDatasets;
  Removido Hints e Warnings.

  Vers�o: 3.03a
  Desenvolvedor: Victor Zanella
  Data: 04/09/2013
  Tarefa: 12308
  Descri��o: Incluido novo parametro no m�todo Validar, pois esse m�todo tentava jogar uma string
             em um campo EditNum.

}

end.
