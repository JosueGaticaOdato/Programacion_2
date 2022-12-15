program Proyecto_Ejercicio8;

uses
  Vcl.Forms,
  Unit_Ejercicio8 in 'Unit_Ejercicio8.pas' {Form1},
  Unit_Congelador in 'Unit_Congelador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
