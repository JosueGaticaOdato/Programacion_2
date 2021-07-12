program projEj3Hash;

uses
  Vcl.Forms,
  Ej3Hash in '..\Ej3Hash.pas' {Form1},
  TadHash in '..\TadHash.pas',
  TadHashZO in '..\TadHashZO.pas',
  Ej3HashTAD in '..\Ej3HashTAD.pas',
  Tipos in '..\..\Tipos.pas',
  ListArray in '..\..\practica3-listas\ListArray.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
