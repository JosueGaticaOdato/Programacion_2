program projEj8Arboles;

uses
  Vcl.Forms,
  Ej8Arboles in 'Ej8Arboles.pas' {Form1},
  Tipos in '..\..\Tipos.pas',
  QueuesPointer in '..\..\TP 6\QueuesPointer.pas',
  StackPointer in '..\..\TP 5\StackPointer.pas',
  Ej8ArbolesTAD in 'Ej8ArbolesTAD.pas',
  ArbolesBinariosBusqueda in '..\ArbolesBinariosBusqueda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
