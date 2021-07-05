program projEj2Arboles;

uses
  Vcl.Forms,
  Ej2Arboles in 'Ej2Arboles.pas' {Form1},
  Ej2ArbolesTAD in 'Ej2ArbolesTAD.pas',
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
