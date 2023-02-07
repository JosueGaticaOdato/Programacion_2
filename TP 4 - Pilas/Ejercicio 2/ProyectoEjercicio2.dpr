program ProyectoEjercicio2;

uses
  Vcl.Forms,
  CodigoEjercicio2 in 'CodigoEjercicio2.pas' {Form1},
  TADEjercicio2 in 'TADEjercicio2.pas',
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
