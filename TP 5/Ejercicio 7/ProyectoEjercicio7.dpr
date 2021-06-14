program ProyectoEjercicio7;

uses
  Vcl.Forms,
  CodigoEjercicio7 in 'CodigoEjercicio7.pas' {Form1},
  TADEjercicio7 in 'TADEjercicio7.pas',
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
