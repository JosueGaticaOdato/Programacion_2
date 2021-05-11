program Ejercicio5Proyecto;

uses
  Vcl.Forms,
  Ejercicio5Codigo in 'Ejercicio5Codigo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
