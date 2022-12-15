program ProyectoEjercicio1;

uses
  Vcl.Forms,
  CodigoEjercicio1 in 'CodigoEjercicio1.pas' {Form1},
  TADEjercicio1 in 'TADEjercicio1.pas',
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
