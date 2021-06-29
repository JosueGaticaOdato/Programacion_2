program projEj3Colas;

uses
  Vcl.Forms,
  ej3Colas in 'ej3Colas.pas' {Form1},
  ej3ColasTAD in 'ej3ColasTAD.pas',
  QueuesArray in '..\QueuesArray.pas',
  QueuesArrayNC in '..\QueuesArrayNC.pas',
  QueuesArrayNCMejorada in '..\QueuesArrayNCMejorada.pas',
  QueuesCursor in '..\QueuesCursor.pas',
  QueuesPointer in '..\QueuesPointer.pas',
  Tipos in '..\Tipos.pas',
  ListArray in '..\..\practica3-listas\ListArray.pas',
  ListCursor in '..\..\practica3-listas\ListCursor.pas',
  ListPointer in '..\..\practica3-listas\ListPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
