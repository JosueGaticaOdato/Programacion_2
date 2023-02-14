program ProjectDuville;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  ListArray in '..\..\Trabajos Practicos\TP 3 - Listas\ListArray.pas',
  ListCursor in '..\..\Trabajos Practicos\TP 3 - Listas\ListCursor.pas',
  ListPointer in '..\..\Trabajos Practicos\TP 3 - Listas\ListPointer.pas',
  Tipos in '..\..\Trabajos Practicos\TP 3 - Listas\Tipos.pas',
  ArbolesBinarios in '..\..\Trabajos Practicos\TP 6 - Arboles\ArbolesBinarios.pas',
  StackPointer in '..\..\Trabajos Practicos\TP 4 - Pilas\StackPointer.pas',
  QueuesPointer in '..\..\Trabajos Practicos\TP 5 - Colas\QueuesPointer.pas',
  ArbolesBinariosAVL in '..\..\Trabajos Practicos\TP 6 - Arboles\ArbolesBinariosAVL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
