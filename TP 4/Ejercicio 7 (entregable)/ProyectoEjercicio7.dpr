program ProyectoEjercicio7;

uses
  Vcl.Forms,
  CodigoEjercicio87 in 'CodigoEjercicio87.pas' {Form1},
  ListArray in 'ListArray.pas',
  ListCursor in 'ListCursor.pas',
  ListPointer in 'ListPointer.pas',
  Tipos in 'Tipos.pas',
  PacManTAD in 'PacManTAD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
