program ProyectoEjercicio3;

uses
  Vcl.Forms,
  Ejercicio3 in 'Ejercicio3.pas' {Form1},
  TADEjercicio3 in 'TADEjercicio3.pas',
  ListArray in '..\ListArray.pas',
  TadHash in '..\TadHash.pas',
  TadHashZO in '..\TadHashZO.pas',
  Tipos in '..\Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
