program ProyectoEjercicio1;

uses
  Vcl.Forms,
  CodigoEjercicio1 in 'CodigoEjercicio1.pas' {Form1},
  TADEjercicio1 in 'TADEjercicio1.pas',
  StackArray in '..\StackArray.pas',
  StackCursor in '..\StackCursor.pas',
  StackPointer in '..\StackPointer.pas',
  Tipos in '..\..\TP 4\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
