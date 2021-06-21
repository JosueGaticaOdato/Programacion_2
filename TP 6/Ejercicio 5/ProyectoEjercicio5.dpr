program ProyectoEjercicio5;

uses
  Vcl.Forms,
  CodigoEjercicio5 in 'CodigoEjercicio5.pas' {Form1},
  TADEjercicio5Pila in 'TADEjercicio5Pila.pas',
  TADEjercicio5Cola in 'TADEjercicio5Cola.pas',
  TADEjercicio5Lista in 'TADEjercicio5Lista.pas',
  QueuesArrayNCMejorada in '..\QueuesArrayNCMejorada.pas',
  QueuesCursor in '..\QueuesCursor.pas',
  QueuesPointer in '..\QueuesPointer.pas',
  Tipos in '..\Tipos.pas',
  StackArray in '..\..\TP 5\StackArray.pas',
  StackCursor in '..\..\TP 5\StackCursor.pas',
  StackPointer in '..\..\TP 5\StackPointer.pas',
  ListArray in '..\..\TP 4\ListArray.pas',
  ListCursor in '..\..\TP 4\ListCursor.pas',
  ListPointer in '..\..\TP 4\ListPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
