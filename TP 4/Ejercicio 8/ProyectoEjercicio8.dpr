program ProyectoEjercicio8;

uses
  Vcl.Forms,
  CodigoEjercicio8 in 'CodigoEjercicio8.pas' {Form1},
  ListArray in '..\ListArray.pas',
  ListCursor in '..\ListCursor.pas',
  ListPointer in '..\ListPointer.pas',
  Tipos in '..\Tipos.pas',
  TADAgenda in 'TADAgenda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
