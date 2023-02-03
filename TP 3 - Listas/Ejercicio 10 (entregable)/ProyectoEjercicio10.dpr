program ProyectoEjercicio10;

uses
  Vcl.Forms,
  ListArray in '..\ListArray.pas',
  ListCursor in '..\ListCursor.pas',
  ListPointer in '..\ListPointer.pas',
  Tipos in '..\Tipos.pas',
  Ejercicio10 in 'Ejercicio10.pas' {Form1},
  TADSieteSegmentos in 'TADSieteSegmentos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
