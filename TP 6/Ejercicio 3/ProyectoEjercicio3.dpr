program ProyectoEjercicio3;

uses
  Vcl.Forms,
  CodigoEjercicio3 in 'CodigoEjercicio3.pas' {Form1},
  TADEjercicio3 in 'TADEjercicio3.pas',
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
