program projEj3Conjuntos;

uses
  Vcl.Forms,
  Ej3Conjuntos in 'Ej3Conjuntos.pas' {Form1},
  Ej3ConjuntosTAD in 'Ej3ConjuntosTAD.pas',
  ConjuntosAVL in '..\ConjuntosAVL.pas',
  ArbolesBinariosAVL in '..\..\TP 7\ArbolesBinariosAVL.pas',
  Tipos in '..\..\Tipos.pas',
  QueuesPointer in '..\..\TP 6\QueuesPointer.pas',
  StackPointer in '..\..\TP 5\StackPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
