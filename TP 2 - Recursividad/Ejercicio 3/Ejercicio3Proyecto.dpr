program Ejercicio3Proyecto;

uses
  Vcl.Forms,
  Ejercicio3Codigo in 'Ejercicio3Codigo.pas' {Ejercicio3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TEjercicio3, Ejercicio3);
  Application.Run;
end.
