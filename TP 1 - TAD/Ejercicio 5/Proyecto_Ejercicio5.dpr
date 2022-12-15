program Proyecto_Ejercicio5;

uses
  Vcl.Forms,
  Unit_Ejercicio5 in 'Unit_Ejercicio5.pas' {Form1},
  Unit_Fecha in 'Unit_Fecha.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
