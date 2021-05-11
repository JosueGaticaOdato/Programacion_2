program Ejercicio1Proyecto;

uses
  Vcl.Forms,
  Ejercicio1Codigo in 'Ejercicio1Codigo.pas' {Ejercicio_1},
  Ejercicio1 in 'Ejercicio1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TEjercicio_1, Ejercicio_1);
  Application.Run;
end.
