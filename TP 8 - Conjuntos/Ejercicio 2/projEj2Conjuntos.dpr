program projEj2Conjuntos;

uses
  Vcl.Forms,
  Ej2Conjuntos in 'Ej2Conjuntos.pas' {Form1},
  Ej2ConjuntosTAD in 'Ej2ConjuntosTAD.pas',
  Tipos in '..\..\Tipos.pas',
  ConjuntosAVL in '..\ConjuntosAVL.pas',
  ArbolesBinariosAVL in '..\..\TP 7\ArbolesBinariosAVL.pas',
  QueuesPointer in '..\..\TP 6\QueuesPointer.pas',
  StackPointer in '..\..\TP 5\StackPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
