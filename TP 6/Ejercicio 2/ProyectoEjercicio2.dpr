program ProyectoEjercicio2;

uses
  Vcl.Forms,
  CodigoEjercicio2 in 'CodigoEjercicio2.pas' {Form1},
  TADEjercicio2 in 'TADEjercicio2.pas',
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
