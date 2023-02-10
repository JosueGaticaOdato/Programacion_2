program ProyectoEjercicio7;

uses
  Vcl.Forms,
  Ejercicio7 in 'Ejercicio7.pas' {Form1},
  TADEjercicio7 in 'TADEjercicio7.pas',
  ArbolesBinarios in '..\ArbolesBinarios.pas',
  QueuesPointer in '..\QueuesPointer.pas',
  StackPointer in '..\StackPointer.pas',
  Tipos in '..\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
