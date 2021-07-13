program ProyectoEjercicio2;

uses
  Vcl.Forms,
  CodigoEjercicio2 in 'CodigoEjercicio2.pas' {Form1},
  ArbolesBinariosAVL in '..\TADS\ArbolesBinariosAVL.pas',
  ArbolesBinariosBusqueda in '..\TADS\ArbolesBinariosBusqueda.pas',
  Tipos in '..\TADS\Tipos.pas',
  ListArray in '..\TADS\ListArray.pas',
  ListCursor in '..\TADS\ListCursor.pas',
  ListPointer in '..\TADS\ListPointer.pas',
  ArbolesBinarios in '..\TADS\ArbolesBinarios.pas',
  QueuesPointer in '..\TADS\QueuesPointer.pas',
  StackPointer in '..\TADS\StackPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
