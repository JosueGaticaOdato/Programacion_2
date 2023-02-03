program ProjectEjercicio6;

uses
  Vcl.Forms,
  Ejercicio6 in 'Ejercicio6.pas' {Form1},
  TADPolinomio in 'TADPolinomio.pas',
  ListArray in '..\ListArray.pas',
  ListCursor in '..\ListCursor.pas',
  ListPointer in '..\ListPointer.pas',
  Tipos in '..\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
