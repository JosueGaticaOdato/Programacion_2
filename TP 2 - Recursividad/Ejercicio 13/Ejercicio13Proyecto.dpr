program Ejercicio13Proyecto;

uses
  Vcl.Forms,
  Ejercicio13Codigo in 'Ejercicio13Codigo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
