program Proyecto_Ejercicio12BIS;

uses
  Vcl.Forms,
  Ejercicio12BIS in 'Ejercicio12BIS.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
