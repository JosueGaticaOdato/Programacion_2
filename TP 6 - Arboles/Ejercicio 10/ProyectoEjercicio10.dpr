program ProyectoEjercicio10;

uses
  Vcl.Forms,
  Ejercicio10 in 'Ejercicio10.pas' {Form1},
  ArbolesBinariosAVL in '..\ArbolesBinariosAVL.pas',
  ArbolesBinariosBusqueda in '..\ArbolesBinariosBusqueda.pas',
  Tipos in '..\Tipos.pas',
  QueuesPointer in '..\QueuesPointer.pas',
  StackPointer in '..\StackPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
