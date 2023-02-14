program ProyectoEjercicio3;

uses
  Vcl.Forms,
  CodigoEjercicio3 in 'CodigoEjercicio3.pas' {Form1},
  QueuesArrayNCMejorada in '..\TADS\QueuesArrayNCMejorada.pas',
  QueuesCursor in '..\TADS\QueuesCursor.pas',
  QueuesPointer in '..\TADS\QueuesPointer.pas',
  Tipos in '..\TADS\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
