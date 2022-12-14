program prj_Ej6_Estacionamiento;

uses
  Vcl.Forms,
  ej6_Estacionamiento in 'ej6_Estacionamiento.pas' {Ejercicico6y7},
  estacionamientoTAD in 'estacionamientoTAD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TEjercicico6y7, Ejercicico6y7);
  Application.Run;
end.
