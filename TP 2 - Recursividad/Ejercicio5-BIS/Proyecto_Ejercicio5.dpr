program Proyecto_Ejercicio5;

uses
  Vcl.Forms,
  Ejercicio5 in 'Ejercicio5.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
