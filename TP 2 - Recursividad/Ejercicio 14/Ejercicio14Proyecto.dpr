program Ejercicio14Proyecto;

uses
  Vcl.Forms,
  Ejercicio14Codigo in 'Ejercicio14Codigo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
