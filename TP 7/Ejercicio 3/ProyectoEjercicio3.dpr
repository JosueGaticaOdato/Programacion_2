program ProyectoEjercicio3;

uses
  Vcl.Forms,
  Ejercicio3 in 'Ejercicio3.pas' {Form1},
  TADEjercicio3 in 'TADEjercicio3.pas',
  ArbolesBinarios in '..\..\..\Downloads\Programacion 2\TP 7\ArbolesBinarios.pas',
  Tipos in '..\..\..\Downloads\Programacion 2\TP 7\Tipos.pas',
  QueuesPointer in '..\..\..\Downloads\Programacion 2\TP 6\QueuesPointer.pas',
  StackPointer in '..\..\..\Downloads\Programacion 2\TP 5\StackPointer.pas',
  ListPointer in '..\..\..\Downloads\Programacion 2\TP 4\ListPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
