program Ejercicio6Proyecto;

uses
  Vcl.Forms,
  Ejercicio6Codigo in 'Ejercicio6Codigo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
