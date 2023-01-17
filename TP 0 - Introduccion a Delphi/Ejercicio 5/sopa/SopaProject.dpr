program SopaProject;

uses
  Vcl.Forms,
  SopaForm in 'SopaForm.pas' {Form1},
  Sopa in 'Sopa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
