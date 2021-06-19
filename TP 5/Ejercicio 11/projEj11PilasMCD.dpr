program projEj11PilasMCD;

uses
  Vcl.Forms,
  ej11pilasMCD in 'ej11pilasMCD.pas' {Form1},
  McdTAD in '..\..\TP 3\Ejercicio 2\McdTAD.pas',
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
