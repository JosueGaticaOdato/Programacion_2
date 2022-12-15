program projEj1Conjuntos;

uses
  Vcl.Forms,
  Conjuntos in '..\Conjuntos.pas',
  ConjuntosAVL in '..\ConjuntosAVL.pas',
  ArbolesBinariosAVL in '..\..\TP 7\ArbolesBinariosAVL.pas',
  QueuesPointer in '..\..\TP 6\QueuesPointer.pas',
  StackPointer in '..\..\TP 5\StackPointer.pas',
  ListPointer in '..\..\TP 4\ListPointer.pas',
  Tipos in '..\..\Tipos.pas',
  Ej1Conjuntos in 'Ej1Conjuntos.pas' {Form1},
  Ej1ConjuntosTAD in 'Ej1ConjuntosTAD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
