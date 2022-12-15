program Proyecto_Ejercicio1;

uses
  Vcl.Forms,
  Unidad_Ejercicio1 in 'Unidad_Ejercicio1.pas' {Form1},
  Unit_NumeroRacional in 'Unit_NumeroRacional.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
