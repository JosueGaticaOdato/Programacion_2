program ProyectoEjercicio6;

uses
  Vcl.Forms,
  Ejercicio6 in 'Ejercicio6.pas' {Form1},
  ListArray in '..\ListArray.pas',
  TadHash in '..\TadHash.pas',
  TadHashZO in '..\TadHashZO.pas',
  Tipos in '..\Tipos.pas',
  ArbolesBinariosAVL in '..\..\TP 6 - Arboles\ArbolesBinariosAVL.pas',
  BTree in '..\..\TP 6 - Arboles\BTree.pas',
  QueuesPointer in '..\..\TP 6 - Arboles\QueuesPointer.pas',
  StackPointer in '..\..\TP 6 - Arboles\StackPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
