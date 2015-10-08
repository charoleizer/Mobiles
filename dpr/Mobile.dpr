program Mobile;

uses
  Vcl.Forms,
  Main in '..\pas\Main.pas' {frmMain},
  mob0001 in '..\pas\mob0001.pas' {FrmMob0001},
  mob0001d in '..\pas\mob0001d.pas' {DtmMob0001d: TDataModule},
  sysmo in 'D:\dsv\projetos\sysmos1\fontes\trunk\sysmovs\pas\lib\sysmo.pas',
  ResourceStrings in 'D:\dsv\projetos\sysmos1\fontes\trunk\sysmovs\pas\ResourceStrings.pas',
  mob0214a in '..\lib\mob0214a.pas',
  mob0214d in '..\lib\mob0214d.pas' {DtmMob0214d: TDataModule},
  mob0214 in '..\lib\mob0214.pas' {FrmMob0214},
  superdtm in 'D:\dsv\projetos\sysmos1\fontes\trunk\sysmovs\pas\superdtm.pas' {DtmSis: TDataModule},
  ctrlform in 'D:\dsv\projetos\sysmos1\fontes\trunk\sysmovs\pas\lib\ctrlform.pas',
  sysmo02 in 'D:\dsv\projetos\sysmos1\fontes\trunk\sysmovs\pas\lib\sysmo02.pas',
  mob0003 in '..\lib\mob0003.pas',
  mob0010 in '..\lib\mob0010.pas',
  rgn052 in 'D:\dsv\projetos\sysmos1\fontes\trunk\sysmovs\pas\rgn052.pas',
  bas410 in 'D:\dsv\projetos\sysmos1\fontes\trunk\sysmovs\pas\bas410.pas' {BusinessRule: TDataModule},
  bas420 in 'D:\dsv\projetos\sysmos1\fontes\trunk\sysmovs\pas\bas420.pas' {FormDialog},
  bas501 in 'D:\dsv\projetos\sysmos1\fontes\trunk\sysmovs\pas\bas501.pas',
  mob0008 in '..\lib\mob0008.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
