program projEj7Colas;

uses
  Vcl.Forms,
  ej7Colas in 'ej7Colas.pas' {Form1},
  ej7ColasTAD in 'ej7ColasTAD.pas',
  QueuesArray in '..\QueuesArray.pas',
  QueuesArrayNC in '..\QueuesArrayNC.pas',
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
