program ProyectoEjercicio9;

uses
  Vcl.Forms,
  Unidad_Ejercicio9 in 'Unidad_Ejercicio9.pas' {Ejercicio9},
  TADCajaRegistradora in 'TADCajaRegistradora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TEjercicio9, Ejercicio9);
  Application.Run;
end.
