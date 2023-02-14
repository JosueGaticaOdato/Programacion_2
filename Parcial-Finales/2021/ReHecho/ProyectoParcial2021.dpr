program ProyectoParcial2021;

uses
  Vcl.Forms,
  Parcial2021 in 'Parcial2021.pas' {Form1},
  ListArray in '..\TADS\ListArray.pas',
  ListCursor in '..\TADS\ListCursor.pas',
  ListPointer in '..\TADS\ListPointer.pas',
  Tipos in '..\TADS\Tipos.pas',
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
