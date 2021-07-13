program ProyectoEjercicio5;

uses
  Vcl.Forms,
  CodigoEjercicio4 in 'CodigoEjercicio4.pas' {Form1},
  TADEjercicio5 in 'TADEjercicio5.pas',
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
