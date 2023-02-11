program projEj1Conjuntos;

uses
  Vcl.Forms,
  Conjuntos in '..\Conjuntos.pas',
  ConjuntosAVL in '..\ConjuntosAVL.pas',
  Tipos in '..\..\Tipos.pas',
  Ej1Conjuntos in 'Ej1Conjuntos.pas' {Form1},
  Ej1ConjuntosTAD in 'Ej1ConjuntosTAD.pas',
  ArbolesBinariosAVL in '..\ArbolesBinariosAVL.pas',
  ListPointer in '..\ListPointer.pas',
  QueuesPointer in '..\QueuesPointer.pas',
  StackPointer in '..\StackPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
