program ProyectoEjercicio5;

uses
  Vcl.Forms,
  CodigoEjercicio5 in 'CodigoEjercicio5.pas' {Form1},
  TADEjercicio5 in 'TADEjercicio5.pas',
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
