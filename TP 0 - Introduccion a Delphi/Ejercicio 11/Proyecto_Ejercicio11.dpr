program Proyecto_Ejercicio11;

uses
  Vcl.Forms,
  Unit_Ejercicio11 in 'Unit_Ejercicio11.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
