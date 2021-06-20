program ProyectoEjercicio10;

uses
  Vcl.Forms,
  CodigoEjercicio10 in 'CodigoEjercicio10.pas' {Form1},
  TADEjercicio10 in 'TADEjercicio10.pas',
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
