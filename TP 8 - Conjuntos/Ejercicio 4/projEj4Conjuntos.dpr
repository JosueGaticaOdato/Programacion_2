program projEj4Conjuntos;

uses
  Vcl.Forms,
  Ej4Conjuntos in 'Ej4Conjuntos.pas' {Form1},
  Ej4ConjuntosTAD in 'Ej4ConjuntosTAD.pas',
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
