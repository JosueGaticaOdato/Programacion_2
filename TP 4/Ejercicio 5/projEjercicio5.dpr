program projEjercicio5;

uses
  Vcl.Forms,
  ejercicio5 in 'ejercicio5.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
