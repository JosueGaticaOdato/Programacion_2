program ProyectoEjercicio4;

uses
  Vcl.Forms,
  CodigoEjercicio4 in 'CodigoEjercicio4.pas' {Form1},
  TADEjercicio4 in 'TADEjercicio4.pas',
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
