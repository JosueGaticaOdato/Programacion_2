unit Ejercicio5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

(*
Se tiene el siguiente problema problemático,
de generar una cadena parsimoniosa y armoniosa que va así:

parmoniosa(1) =           **\/**

parmoniosa(2) =     ++\**\/**/++

parmoniosa(3) = **\++\**\/**/++/**

Se pide encontrar la solución recursiva para parmoniosa(n).
*)

function parmoniosa(numero: Integer): String;
begin
  //Caso base: sea 0, osea, no agrego nada
  if (numero = 0) then
  begin
    parmoniosa := '';
  end
  else //Caso recursivo, tengo que agregar por afuera los caracteres
  begin
    if (numero mod 2) = 0 then //Si es par
    begin
      parmoniosa := '++\' + parmoniosa(numero - 1) + '/++';
    end
    else //Si es impar
    begin
      parmoniosa := '**\' + parmoniosa(numero - 1) + '/**';
    end;

  end;
end;



procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Lines.Add(parmoniosa(strtoint(Edit1.Text)));
end;

end.
