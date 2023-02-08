program ProyectoEjercicio7;

uses
  Vcl.Forms,
  CodigoEjercicio7 in 'CodigoEjercicio7.pas' {Form1},
  TADEjercicio7 in 'TADEjercicio7.pas',
  Tipos in '..\Tipos.pas',
  QueuesArrayNCMejorada in '..\QueuesArrayNCMejorada.pas',
  QueuesCursor in '..\QueuesCursor.pas',
  QueuesPointer in '..\QueuesPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
