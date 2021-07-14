program projEj11Arboles;

uses
  Vcl.Forms,
  Ej11Arboles in 'Ej11Arboles.pas' {Form1},
  Ej11ArbolesTAD in 'Ej11ArbolesTAD.pas',
  ArbolesBinariosAVL in '..\ArbolesBinariosAVL.pas',
  ArbolesBinarios in '..\ArbolesBinarios.pas',
  QueuesPointer in '..\..\TP 6\QueuesPointer.pas',
  StackPointer in '..\..\TP 5\StackPointer.pas',
  Tipos in '..\..\Tipos.pas',
  ArbolesBinariosBusqueda in '..\ArbolesBinariosBusqueda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
