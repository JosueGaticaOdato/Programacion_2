program ProyectoEjercicio7;

uses
  Vcl.Forms,
  CodigoEjercicio7 in 'CodigoEjercicio7.pas' {Form1},
  TADEjercicio7 in 'TADEjercicio7.pas',
  QueuesArrayNCMejorada in '..\..\..\..\Documents\Pruebas\TP 6\QueuesArrayNCMejorada.pas',
  QueuesCursor in '..\..\..\..\Documents\Pruebas\TP 6\QueuesCursor.pas',
  QueuesPointer in '..\..\..\..\Documents\Pruebas\TP 6\QueuesPointer.pas',
  Tipos in '..\..\..\..\Documents\Pruebas\TP 6\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
