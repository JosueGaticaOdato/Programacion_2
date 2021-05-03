program prj_Ej6_Estacionamiento;

uses
  Vcl.Forms,
  ej6_Estacionamiento in 'ej6_Estacionamiento.pas' {Form1},
  estacionamientoTAD in 'estacionamientoTAD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
