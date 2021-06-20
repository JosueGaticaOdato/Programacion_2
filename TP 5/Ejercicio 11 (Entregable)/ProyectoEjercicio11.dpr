program ProyectoEjercicio11;

uses
  Vcl.Forms,
  CodigoEjercicio11 in 'CodigoEjercicio11.pas' {Form1},
  TADEjercicio11 in 'TADEjercicio11.pas',
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
