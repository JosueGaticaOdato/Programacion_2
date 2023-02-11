program projEj5Conjuntos;

uses
  Vcl.Forms,
  Ej5Conjuntos in 'Ej5Conjuntos.pas' {Form1},
  Ej5ConjuntosTAD in 'Ej5ConjuntosTAD.pas',
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
