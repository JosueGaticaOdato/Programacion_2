program ProyectoEJ4;

uses
  Vcl.Forms,
  UnidadEJ4 in 'UnidadEJ4.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
