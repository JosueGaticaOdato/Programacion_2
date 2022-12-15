program Proyecto_Ejercicio7;

uses
  Vcl.Forms,
  Ejercicio7 in 'Ejercicio7.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
