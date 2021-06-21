program ProyectoEjercicio6;

uses
  Vcl.Forms,
  CodigoEjercicio6 in 'CodigoEjercicio6.pas' {Form1},
  TADEjercicio6 in 'TADEjercicio6.pas',
  QueuesArrayNCMejorada in '..\QueuesArrayNCMejorada.pas',
  QueuesCursor in '..\QueuesCursor.pas',
  QueuesPointer in '..\QueuesPointer.pas',
  Tipos in '..\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
