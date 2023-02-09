program ProyectoEjercicio6;

uses
  Vcl.Forms,
  Ejercicio6 in 'Ejercicio6.pas' {Form1},
  TADEjercicio6 in 'TADEjercicio6.pas',
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
