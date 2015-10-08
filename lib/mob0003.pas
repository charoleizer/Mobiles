{
  Tipo: Classe
  Descrição: Classe base para gerenciar mensagens dadas nos móbiles
  Padrão: 1
}
unit mob0003;

interface

uses
  Windows, SysUtils, Vcl.Controls, sysmo, Vcl.Dialogs, EditNum, Vcl.Mask,
  Vcl.StdCtrls, Vcl.ExtCtrls, Spin, HFocusControl, HMensagens;

type
  TMensagemMobile = class
  private
    class procedure SinalSonoro;
  public
    /// <summary>
    /// Função responsavel por padronizar as mensagens com sinais sonoros dos mobiles
    /// </summary>
    ///
    /// <example>
    /// <code>
    /// TMensagemMobile.ApresentarMensagemAtencao(EdtPro, 'Informe o produto');
    /// </code>
    /// </example>
    class procedure MostrarMensagemAtencao(AFoco: TObject; AMensagem: String; ATamanho: Integer = 0);

    class procedure MostrarMensagemInformacao(AFoco: TObject; AMensagem: String; ATamanho: Integer = 0);

    class function MostrarPergunta(AMensagem: String; ATipoMensagem: TMsgDlgType;
      ABotoes: TMsgDlgButtons; AIndice: Integer; ABotaoFoco: TMsgDlgBtn): Integer;

    class function CampoEmBranco(ASender: TObject; AMensagem: String = ''): Boolean;

    class function NumeroInvalido(ASender: TObject; AMensagem: String = '';
      AValorMinimo: Currency = 0; AValorMaximo: Currency = 0): Boolean;

    class function DataInvalida(ASender: TObject; AMensagem: String = '';
      ADataMinima: String = ''; ADataMaxima: String = '31/12/2099'): Boolean;

    class procedure EmitirSinalSonoroSimples;
  end;

implementation



{ TMensagemMobile }



class procedure TMensagemMobile.SinalSonoro;
begin
  Windows.Beep(1600, 200);
  Windows.Beep(1440, 300);
  Windows.Beep(1600, 200);
end;



class procedure TMensagemMobile.MostrarMensagemAtencao(AFoco: TObject;
  AMensagem: String; ATamanho: Integer = 0);
begin
  TMensagemMobile.SinalSonoro;
  if (AFoco = nil) then
    WarningMessage(AMensagem, ATamanho)
  else
    WarningMessage(TWinControl(AFoco), AMensagem, ATamanho);
end;



class procedure TMensagemMobile.MostrarMensagemInformacao(AFoco: TObject;
  AMensagem: String; ATamanho: Integer = 0);
begin
  SinalSonoro;

  if (AFoco = nil) then
    InformationMessage(AMensagem, ATamanho)
  else
    InformationMessage(TWinControl(AFoco), AMensagem, ATamanho);

end;



class function TMensagemMobile.MostrarPergunta(AMensagem: String; ATipoMensagem: TMsgDlgType;
  ABotoes: TMsgDlgButtons; AIndice: Integer; ABotaoFoco: TMsgDlgBtn): Integer;
begin
  SinalSonoro;
  Result := DlgMessage(AMensagem, ATipoMensagem, ABotoes, AIndice, ABotaoFoco);
end;



class function TMensagemMobile.CampoEmBranco(ASender: TObject; AMensagem: String = ''): Boolean;
var
  sCampo: string;
begin
  try
    if (ASender is TEdit) then
      sCampo := (ASender as TEdit).Text
    else if (ASender is TLabeledEdit) then
      sCampo := (ASender as TLabeledEdit).Text
    else if (ASender is TMemo) then
      sCampo := (ASender as TMemo).Text
    else if (ASender is TEditText) then
      sCampo := (ASender as TEditText).Text
    else if (ASender is TMaskEdit) then
      sCampo := (ASender as TMaskEdit).Text
    else if (ASender is TEditDate) then
      sCampo := (ASender as TEditDate).Text
    else if (ASender is TComboBox) then
      sCampo := (ASender as TComboBox).Text
    else if (ASender is TEditCombo) then
      sCampo := (ASender as TEditCombo).Text
    else
      raise Exception.Create('');

    if (Trim(sCampo) = '') then
    begin
      SetaFoco(TWinControl(ASender));
      if (Trim(AMensagem) <> '') then
      begin
        TMensagemMobile.SinalSonoro;
        WarningMessage(TWinControl(ASender), AMensagem);
      end;
      Result := True;
    end
    else
      Result := False;
  except
    Result := True;
  end;
end;



class function TMensagemMobile.NumeroInvalido(ASender: TObject; AMensagem: String = '';
  AValorMinimo: Currency = 0; AValorMaximo: Currency = 0): Boolean;
var
  sCampo: String;
  nValor: Currency;
  bErro: Boolean;
begin
  try
    bErro := False;
    if (ASender is TEdit) then
      sCampo := Trim((ASender as TEdit).Text)
    else if (ASender is TEditText) then
      sCampo := Trim((ASender as TEditText).Text)
    else if (ASender is TMaskEdit) then
      sCampo := Trim((ASender as TMaskEdit).Text)
    else if (ASender is TEditDate) then
      sCampo := Trim((ASender as TEditDate).Text)
    else if (ASender is TComboBox) then
      sCampo := Trim((ASender as TComboBox).Text)
    else if (ASender is TEditCombo) then
      sCampo := Trim((ASender as TEditCombo).Text)
    else if (ASender is TSpinEdit) then
      sCampo := IntToStr((ASender as TSpinEdit).Value)
    else
      raise Exception.Create('');

    try
      if (sCampo = '') then
        nValor := 0
      else
        nValor := StrToCurr(sCampo);

      if (AValorMinimo < AValorMaximo) then
      begin
        if (nValor < AValorMinimo) then
          bErro := True;
        if (nValor > AValorMaximo) then
          bErro := True;
      end
      else
      begin
        if (nValor < AValorMinimo) then
          bErro := True;
      end;
    except
      bErro := True;
    end;

    if bErro then
    begin
      if (Trim(AMensagem) <> '') then
      begin
        TMensagemMobile.SinalSonoro;
        WarningMessage(nil, AMensagem);
        SetaFoco(TWinControl(ASender));
      end;
    end;
  except
    bErro := True;
  end;
  Result := not(bErro);
end;



class function TMensagemMobile.DataInvalida(ASender: TObject; AMensagem: String = '';
  ADataMinima: String = ''; ADataMaxima: String = '31/12/2099'): Boolean;
var
  sCampo: String;
  dData: TDateTime;
  bErro: Boolean;
begin
  try
    bErro := False;
    if (ASender is TEdit) then
      sCampo := (ASender as TEdit).Text
    else if (ASender is TEditText) then
      sCampo := (ASender as TEditText).Text
    else if (ASender is TMaskEdit) then
      sCampo := (ASender as TMaskEdit).Text
    else if (ASender is TEditDate) then
      sCampo := (ASender as TEditDate).Text
    else if (ASender is TComboBox) then
      sCampo := (ASender as TComboBox).Text
    else if (ASender is TEditCombo) then
      sCampo := (ASender as TEditCombo).Text
    else
      raise Exception.Create('');

    try
      if (Trim(sCampo) = '/  /') then
      begin
        if (ADataMinima <> '') then
          bErro := True;
      end
      else
      begin
        dData := StrToDate(sCampo);
        if ((ADataMinima <> '') and (dData < StrToDate(ADataMinima))) then
          bErro := True;
        if (dData > StrToDate(ADataMaxima)) then
          bErro := True;
      end;
    except
      bErro := True;
    end;

    if (bErro) then
    begin
      SetaFoco(TWinControl(ASender));
      if (Trim(AMensagem) <> '') then
      begin
        TMensagemMobile.SinalSonoro;
        WarningMessage(TWinControl(ASender), AMensagem);
      end;
    end;
  except
    bErro := True;
  end;
  Result := not(bErro);
end;



class procedure TMensagemMobile.EmitirSinalSonoroSimples;
begin
  SysUtils.Beep;
end;

{
  Versão do projeto: 2.17.08
  Versão: 1.00
  Desenvolvedor: EFB
  Data: 25/05/2012 18:00
  Tarefa: 6017
  Descrição: Regra nova. Tem como objetivo padronizar o sinal sonoro das mensagens dos móbiles.

  Versão do projeto: 2.17.10
  Versão: 1.01
  Desenvolvedor: JP
  Data: 01/11/2012 14:17
  Tarefa: 7143
  Descrição: Refatoração Parte 1
  Revisado:
  Uso de Try/Except;
  ErrorMessage;
  ApplyUpdates;
  Uso de Stored-Procedures que retornam dados e alteram registros na base de dados;
  Parâmetros do tipo Data em SQLDatasets;
  Removido Hints e Warnings.
 
 Versão do projeto: 2.18.02 
  Versão: 1.02
  Desenvolvedor: João Carlos
  Data: 17/02/2015 
  Tarefa: 19027
  Descrição: Remoção de Warnings e Hints. 
}

end.
