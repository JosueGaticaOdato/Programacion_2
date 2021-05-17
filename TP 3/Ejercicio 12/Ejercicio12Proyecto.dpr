program Ejercicio12Proyecto;

uses
  Vcl.Forms,
  Ejercicio12Codigo in 'Ejercicio12Codigo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
