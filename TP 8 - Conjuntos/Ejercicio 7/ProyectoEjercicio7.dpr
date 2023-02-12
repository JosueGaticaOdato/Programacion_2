program ProyectoEjercicio7;

uses
  Vcl.Forms,
  Ejercicio7 in 'Ejercicio7.pas' {Form1},
  ArbolesBinariosAVL in '..\ArbolesBinariosAVL.pas',
  Conjuntos in '..\Conjuntos.pas',
  ConjuntosAVL in '..\ConjuntosAVL.pas',
  ListPointer in '..\ListPointer.pas',
  QueuesPointer in '..\QueuesPointer.pas',
  StackPointer in '..\StackPointer.pas',
  Tipos in '..\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
