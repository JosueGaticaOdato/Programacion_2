program Proyecto_Ejercicio5;

uses
  Vcl.Forms,
  Codigo_Ejercicio5 in 'Codigo_Ejercicio5.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
