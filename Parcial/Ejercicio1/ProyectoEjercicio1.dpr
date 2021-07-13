program ProyectoEjercicio1;

uses
  Vcl.Forms,
  CodigoEjercicio1 in 'CodigoEjercicio1.pas' {Form1},
  ListArray in '..\TADS\ListArray.pas',
  ListCursor in '..\TADS\ListCursor.pas',
  ListPointer in '..\TADS\ListPointer.pas',
  Tipos in '..\TADS\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
