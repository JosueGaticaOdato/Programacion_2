program Ejercicio2Proyecto;

uses
  Vcl.Forms,
  Ejercicio2Codigo in 'Ejercicio2Codigo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
