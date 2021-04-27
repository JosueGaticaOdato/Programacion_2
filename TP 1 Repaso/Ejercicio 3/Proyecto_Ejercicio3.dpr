program Proyecto_Ejercicio3;

uses
  Vcl.Forms,
  Unidad_Ejercicio3 in 'Unidad_Ejercicio3.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
