unit Ejercicio14Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Vector = Array of String;

var
  Form1: TForm1;

implementation

{$R *.dfm}

(*
Se dice que n es un ńumero que explosivo cuando éste
explota en varios fragmentos más chicos que él, dada una bomba.

Si se tiene que n es el número y b la bomba, tales que n es mayor
que b, se puede hacer que n explote en dos números
n1 = n / b (división entera) y n2 = n - (n / b).

Pero b es una bomba que produce una reacción en cadena,
si n1 o n2 son mayores que b, estos también explotan con
la regla anterior, hasta que se encuentre que el número no
es mayor que b; entonces se dice que ya no se puede explotar el número.

Escribe una función que retorne una lista con los
pedazos del número n, dado que se tiene la bomba b.

Por ejemplo:

Número: 10
Bomba: 3
Resultado: [3 2 1 1 3]
Número: 20
Bomba: 5
Resultado: [4 3 2 2 1 1 1 1 5]
*)

//Funcion que realiza el parsing o split
Function Parsing(aSS: String; aSep: String): Vector;
Var I: Integer;
    P: Integer;
    V: Vector;
Begin
  I := 0;
  // Controlo que el ultimo caracter sea el separador, sino lo agrega
  if aSS.Substring(aSS.Length,1) <> aSep then aSS := aSS + aSep;

  // Hacemos el split
  P := Pos(aSep, aSS);
  while P > 0 do Begin
    Inc(I);
    SetLength(V, I);  // Se redimensiona el array y no se pierden los datos
    V[I-1] := Copy(aSS, 1, P-1);
    aSS := Copy(aSS, P+1, Length(aSS));
    P := Pos(aSep, aSS);
  End;

  // Retorno el array
  Parsing := V;
End;

//Funcion que realiza la recursividad, que recibe el numero y la bomba
function ExplosionAux(Numero, Bomba: Integer): String;
begin
  //El caso base es si el numero es menor qe la bomba, en ese caso devuelvo el numero
  if Numero <= Bomba then
  begin
    Result := Numero.ToString;
  end
  else
  begin
  //Si no es el caso base,
  //Realizo el llamado de la funcion con el numero divido la bomba y otro llamado
  //con el numero divido la bomba, pero a este le resto el numero
    Result := ExplosionAux(Numero DIV Bomba, Bomba) + ' ' +
      ExplosionAux(Numero - (Numero DIV Bomba), Bomba);
  end;
end;

//Esta funcion realiza el parsing para cargar en un vector los numeros
function Explosion(Numero, Bomba: Integer): Vector;
begin
  Result := Parsing(ExplosionAux(Numero,Bomba),' ');
end;

procedure TForm1.Button1Click(Sender: TObject);
var Numeros: Vector;
  i: Integer;
begin
  memo1.Clear;
  //Condicion en caso de que la bomba sea mayor que el numero
  if strtoint(Edit1.Text) < strtoint(Edit2.Text) then
  begin
    memo1.Lines.Add('La bomba tiene que ser menor que el numero inicial.');
  end
  else if strtoint(Edit2.Text) <= 1 then
  begin
    memo1.Lines.Add('La bomba no tiene que ser un numero menor o igual que 1.');
  end
  else
  begin
    //Hago el llamado y guardo en "Numeros" el resultado
    Numeros := Explosion(strtoint(Edit1.Text),strtoint(Edit2.Text));
    //Muestro el vector con el contenido
    memo1.Lines.Add('El resultado es:');
    for i := 0 to Length(Numeros) - 1 do
    begin
      memo1.Lines.Add(Numeros[i]);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
