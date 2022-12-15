program ProyectoEjercicio7;

uses
  Vcl.Forms,
  CodigoEjercicio7 in 'CodigoEjercicio7.pas' {Form1},
  TADEjercicio7 in 'TADEjercicio7.pas',
  ArbolesBinarios in '..\ArbolesBinarios.pas',
  Tipos in '..\Tipos.pas',
  QueuesPointer in '..\..\TP 6\QueuesPointer.pas',
  StackPointer in '..\..\TP 5\StackPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
