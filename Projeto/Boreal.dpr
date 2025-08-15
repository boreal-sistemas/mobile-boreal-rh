program Boreal;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFmrDM in '..\Units\uFmrDM.pas' {dmoApp: TDataModule},
  uFmrPrincipal in '..\Units\uFmrPrincipal.pas' {fmrPrincipal},
  uNotificacao in '..\Units\uNotificacao.pas',
  uframeDialog in '..\Units\uframeDialog.pas' {msg: TFrame},
  UnicodeEmoji in '..\Units\UnicodeEmoji.pas',
  {$IFDEF Android}
  Androidapi.JNI.FileProvider in '..\Units\Androidapi.JNI.FileProvider.pas',
  {$ENDIF }
  DelphiZXIngQRCode in '..\Units\DelphiZXIngQRCode.pas',
  uFmrLogin in '..\Units\uFmrLogin.pas' {fmrLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmoApp, dmoApp);
  Application.CreateForm(TfmrLogin, fmrLogin);
  Application.Run;
end.

