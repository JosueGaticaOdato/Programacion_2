program projEjercicio5;

uses
  Vcl.Forms,
  ejercicio5 in 'ejercicio5.pas' {Form1},
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
