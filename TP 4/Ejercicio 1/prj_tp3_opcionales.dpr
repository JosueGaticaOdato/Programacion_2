program prj_tp3_opcionales;

uses
  Vcl.Forms,
  ejercicio1 in 'ejercicio1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
