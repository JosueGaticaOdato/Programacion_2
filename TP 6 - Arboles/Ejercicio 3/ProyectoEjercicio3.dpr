program ProyectoEjercicio3;

uses
  Vcl.Forms,
  Ejercicio3 in 'Ejercicio3.pas' {Form1},
  TADEjercicio3 in 'TADEjercicio3.pas',
  Tipos in '..\..\Tipos.pas',
  ArbolesBinarios in '..\ArbolesBinarios.pas',
  QueuesPointer in '..\..\TP 6\QueuesPointer.pas',
  StackPointer in '..\..\TP 5\StackPointer.pas',
  ListPointer in '..\..\TP 4\ListPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
