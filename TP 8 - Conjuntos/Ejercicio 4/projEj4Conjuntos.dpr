program projEj4Conjuntos;

uses
  Vcl.Forms,
  Ej4Conjuntos in 'Ej4Conjuntos.pas' {Form1},
  Ej4ConjuntosTAD in 'Ej4ConjuntosTAD.pas',
  ConjuntosAVL in '..\ConjuntosAVL.pas',
  ArbolesBinariosAVL in '..\..\TP 7\ArbolesBinariosAVL.pas',
  QueuesPointer in '..\..\TP 6\QueuesPointer.pas',
  StackPointer in '..\..\TP 5\StackPointer.pas',
  Tipos in '..\..\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
