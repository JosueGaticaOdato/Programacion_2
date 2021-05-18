program Ejercicio11Proyecto;

uses
  Vcl.Forms,
  Ejercicio11Codigo in 'Ejercicio11Codigo.pas' {Form1},
  TadContagios in 'TadContagios.pas',
  Pruebas in 'Pruebas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
