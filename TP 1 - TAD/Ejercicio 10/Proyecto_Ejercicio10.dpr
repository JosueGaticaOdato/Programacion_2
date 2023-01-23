program Proyecto_Ejercicio10;

uses
  Vcl.Forms,
  Ejercicio10 in 'Ejercicio10.pas' {Form1},
  TADTarjetaDeCredito in 'TADTarjetaDeCredito.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
