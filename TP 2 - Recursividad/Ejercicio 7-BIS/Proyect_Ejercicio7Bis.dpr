program Proyect_Ejercicio7Bis;

uses
  Vcl.Forms,
  Proyecto_Ejercicio7BIS in 'Proyecto_Ejercicio7BIS.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
