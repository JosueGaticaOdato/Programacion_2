program ProyectoEj2;

uses
  Vcl.Forms,
  UnidadEj2 in 'UnidadEj2.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
