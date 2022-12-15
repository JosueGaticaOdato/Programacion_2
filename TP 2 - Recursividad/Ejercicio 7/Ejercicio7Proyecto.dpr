program Ejercicio7Proyecto;

uses
  Vcl.Forms,
  Ejercicio7Codigo in 'Ejercicio7Codigo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
