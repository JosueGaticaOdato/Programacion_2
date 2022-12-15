program ProyectoEjercicio7;

uses
  Vcl.Forms,
  CodigoEjercicio7 in 'CodigoEjercicio7.pas' {Form1},
  PacManTAD in 'PacManTAD.pas',
  ListArray in '..\ListArray.pas',
  ListCursor in '..\ListCursor.pas',
  ListPointer in '..\ListPointer.pas',
  Tipos in '..\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
