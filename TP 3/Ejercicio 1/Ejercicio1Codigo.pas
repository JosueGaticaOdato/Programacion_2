unit Ejercicio1Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TEjercicio_1 = class(TForm)
    Palabra: TEdit;
    BtnPalindromo: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    procedure BtnPalindromoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ejercicio_1: TEjercicio_1;

implementation

{$R *.dfm}

(*
Construir una función recursiva que retorne verdadero si una
cadena de caracteres pasada como parámetro es un palíndromo.
Ej. “neuquen” ya que se lee igual de atrás hacia adelante.
*)

//Funcion que devuelve booleano
function Palindromo (Palabra: String; Inicio, Fin: Integer): Boolean;
begin
  //En caso de que se cumpla el caso base, devuelvo true
  if (Fin < 1) or (Fin = Inicio) then
  begin
    Palindromo := True;
  end
  else
  begin
    //Si, compruebo que la ultima letra es igual a la primera
    //AnsiLowerCase transforma el string a minuscula
    if AnsiLowerCase(Palabra[Inicio]) = AnsiLowerCase(Palabra[Fin]) then
    begin
      //Si se cumple, le sumo 1 a inicio y le resto 1 a fin
      Inicio := Inicio + 1;
      Fin := Fin - 1;
      //Realizo el palindromo con el nuevo rango
      Palindromo(Palabra, Inicio, Fin);
    end
    else
      Palindromo := False;
  end;
end;

procedure TEjercicio_1.BtnPalindromoClick(Sender: TObject);
var Inicio, Fin: Integer;
  Palabra_a_chequear : String;
  Resultado : Boolean;
begin
  Palabra_a_chequear := Palabra.Text;
  Inicio:= 1;
  Fin:= Length(Palabra_a_chequear);
  Resultado := Palindromo(Palabra_a_chequear,Inicio,Fin);
  if Resultado then
  begin
    memo1.Lines.Add('Es palindromo');
  end
  else
  begin
    memo1.Lines.Add('No es palindromo');
  end;
end;

end.
