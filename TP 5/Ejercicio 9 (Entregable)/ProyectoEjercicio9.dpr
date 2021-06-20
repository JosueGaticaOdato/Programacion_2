program ProyectoEjercicio9;

uses
  Vcl.Forms,
  CodigoEjercicio0 in 'CodigoEjercicio0.pas' {Form1},
  TADEjercicio9 in 'TADEjercicio9.pas',
  StackArray in '..\StackArray.pas',
  StackCursor in '..\StackCursor.pas',
  StackPointer in '..\StackPointer.pas',
  Tipos in '..\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
