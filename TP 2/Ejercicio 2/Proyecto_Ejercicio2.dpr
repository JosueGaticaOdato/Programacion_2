program Proyecto_Ejercicio2;

uses
  Vcl.Forms,
  Unidad_Ejercicio2 in 'Unidad_Ejercicio2.pas' {Ejercicio2},
  Unidad_Vector in 'Unidad_Vector.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TEjercicio2, Ejercicio2);
  Application.Run;
end.
