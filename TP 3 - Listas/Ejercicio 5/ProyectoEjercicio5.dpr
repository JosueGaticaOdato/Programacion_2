program ProyectoEjercicio5;

uses
  Vcl.Forms,
  CodigoEJercicio5 in 'CodigoEJercicio5.pas' {Form1},
  ListArray in 'ListArray.pas',
  ListCursor in 'ListCursor.pas',
  ListPointer in 'ListPointer.pas',
  Tipos in 'Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
