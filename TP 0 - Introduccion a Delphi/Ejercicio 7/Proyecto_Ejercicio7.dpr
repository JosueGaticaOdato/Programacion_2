program Proyecto_Ejercicio7;

uses
  Vcl.Forms,
  Unit_Ejercicio7 in 'Unit_Ejercicio7.pas' {Form1},
  Unit_Cliente in 'Unit_Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
