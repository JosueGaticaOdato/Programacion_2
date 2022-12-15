program Proyecto_Ejercicio2;

uses
  Vcl.Forms,
  Unit_Ejercicio2 in 'Unit_Ejercicio2.pas' {Form1},
  Unit_Vector in 'Unit_Vector.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
