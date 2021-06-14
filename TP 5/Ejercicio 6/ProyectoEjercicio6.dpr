program ProyectoEjercicio6;

uses
  Vcl.Forms,
  CodigoEjercicio6 in 'CodigoEjercicio6.pas' {Form1},
  TADEjercicio6 in 'TADEjercicio6.pas',
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
