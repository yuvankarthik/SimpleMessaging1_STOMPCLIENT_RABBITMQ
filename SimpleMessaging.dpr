program SimpleMessaging;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fmmain},
  ThreadReceiver in 'ThreadReceiver.pas',
  StompClient in 'StompClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfmmain, fmmain);
  Application.Run;
end.
