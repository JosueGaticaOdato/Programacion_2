program Proyecto_Ejercicio9;

uses
  Vcl.Forms,
  Unit_Ejercicio9 in 'Unit_Ejercicio9.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
