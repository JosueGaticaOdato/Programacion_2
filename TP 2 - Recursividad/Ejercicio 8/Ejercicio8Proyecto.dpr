program Ejercicio8Proyecto;

uses
  Vcl.Forms,
  Ejercico8Codigo in 'Ejercico8Codigo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
