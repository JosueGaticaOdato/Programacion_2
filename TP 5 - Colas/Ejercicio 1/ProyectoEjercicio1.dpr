program ProyectoEjercicio1;

uses
  Vcl.Forms,
  CodigoEjercicio1 in 'CodigoEjercicio1.pas' {Form1},
  QueuesArrayNCMejorada in '..\QueuesArrayNCMejorada.pas',
  QueuesCursor in '..\QueuesCursor.pas',
  QueuesPointer in '..\QueuesPointer.pas',
  Tipos in '..\Tipos.pas',
  StackArray in '..\..\TP 4 - Pilas\StackArray.pas',
  StackCursor in '..\..\TP 4 - Pilas\StackCursor.pas',
  StackPointer in '..\..\TP 4 - Pilas\StackPointer.pas',
  TADEjercicio1Pila in '..\..\TP 4 - Pilas\Ejercicio 1\TADEjercicio1Pila.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
