program ProyectoEjercicio5;

uses
  Vcl.Forms,
  CodigoEjercicio5 in 'CodigoEjercicio5.pas' {Form1},
  QueuesArrayNCMejorada in '..\QueuesArrayNCMejorada.pas',
  QueuesCursor in '..\QueuesCursor.pas',
  QueuesPointer in '..\QueuesPointer.pas',
  Tipos in '..\Tipos.pas',
  StackArray in '..\..\TP 4 - Pilas\StackArray.pas',
  StackCursor in '..\..\TP 4 - Pilas\StackCursor.pas',
  StackPointer in '..\..\TP 4 - Pilas\StackPointer.pas',
  ListArray in '..\..\TP 3 - Listas\ListArray.pas',
  ListCursor in '..\..\TP 3 - Listas\ListCursor.pas',
  ListPointer in '..\..\TP 3 - Listas\ListPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
