program ProyectoEjercicio9;

uses
  Vcl.Forms,
  Ejercicio9 in 'Ejercicio9.pas' {Form1},
  TADEjercicio9 in 'TADEjercicio9.pas',
  ArbolesBinariosAVL in '..\ArbolesBinariosAVL.pas',
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
