program Ejercicio4Proyecto;

uses
  Vcl.Forms,
  Ejercicio4Codigo in 'Ejercicio4Codigo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
