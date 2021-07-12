program projEj3Arboles;

uses
  Vcl.Forms,
  Ej3Arboles in 'Ej3Arboles.pas' {Form1},
  ArbolesBinarios in '..\ArbolesBinarios.pas',
  Tipos in '..\Tipos.pas',
  Ej3ArbolesTAD in 'Ej3ArbolesTAD.pas',
  ListArray in '..\..\TP 4\ListArray.pas',
  StackPointer in '..\..\TP 5\StackPointer.pas',
  QueuesPointer in '..\..\TP 6\QueuesPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
