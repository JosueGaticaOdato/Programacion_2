program projEj1Arboles;

uses
  Vcl.Forms,
  Ej1Arboles in 'Ej1Arboles.pas' {Form1},
  ArbolesBinarios in '..\ArbolesBinarios.pas',
  Tipos in '..\Tipos.pas',
  Ej1ArbolesTAD in 'Ej1ArbolesTAD.pas',
  QueuesPointer in '..\QueuesPointer.pas',
  StackPointer in '..\StackPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
