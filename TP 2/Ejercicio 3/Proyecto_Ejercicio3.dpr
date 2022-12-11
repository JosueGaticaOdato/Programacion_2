program Proyecto_Ejercicio3;

uses
  Vcl.Forms,
  Unit_Ejercicio3 in 'Unit_Ejercicio3.pas' {Form1},
  Unit_Matriz in 'Unit_Matriz.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
