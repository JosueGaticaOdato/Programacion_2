program prj_ej4_Binarios;

uses
  Vcl.Forms,
  ejercicio4Binarios in 'ejercicio4Binarios.pas' {Form1},
  binarioTAD in 'binarioTAD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
