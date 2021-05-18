unit Ejercicio12Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

const
 Min = 1;
 Max = 50;

type
  Vector = Array [Min..Max] of Integer;
  Vector_String = Array of String;

  TForm1 = class(TForm)
    Label1: TLabel;
    Numero: TEdit;
    Memo1: TMemo;
    Ingresar: TButton;
    Cantidad: TEdit;
    Label2: TLabel;
    Calcular: TButton;
    procedure IngresarClick(Sender: TObject);
    procedure CalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    V: Vector;
    { Public declarations }
  end;


var
  Form1: TForm1;

implementation

{$R *.dfm}

//Funcion que realizar el parsing
Function Parsing(aSS: String; aSep: String): Vector_String;
Var I: Integer;
    P: Integer;
    A: Vector_String;
Begin
  I := 0;
  // Controlo que el ultimo caracter sea el separador, sino lo agrega
  if aSS.Substring(aSS.Length,1) <> aSep then aSS := aSS + aSep;

  // Hacemos el split
  P := Pos(aSep, aSS);
  while P > 0 do Begin
    Inc(I);
    SetLength(A, I);  // Se redimensiona el array y no se pierden los datos
    A[I-1] := Copy(aSS, 1, P-1);
    aSS := Copy(aSS, P+1, Length(aSS));
    P := Pos(aSep, aSS);
  End;

  // Retorno el array
  Parsing := A;
End;

//Procedimiento que vacia un vector
procedure Vaciar (var Vector: Vector);
var i: Integer;
begin
  for i := 1 to Length(Vector) do
  begin
    Vector[i] := 0
  end;
end;

//Funcion que realiza la suma del contenido de un vector
function Suma_Acumuladora(V: Vector): Integer;
var Suma, i: Integer;
begin
  Suma := 0;
  for i := 1 to Length(V) do
  begin
    Suma := Suma + V[i];
  end;
  result := Suma;
end;

//Funcion recursivav
function SubconjuntoAUX(Numeros, Acumulador: Vector; Cantidad, Posicion, Indice: Integer): String;
var Suma, x, y: Integer;
  Texto: String;
begin
  Texto := '';
  //En el vector acumulador guardo el numero para sumarlo luego
  Acumulador[Indice] := Numeros[Posicion];
  Suma := Suma_Acumuladora(Acumulador);
  //Caso base, si la suma entre los elementos es el numero
  if Suma = Cantidad then
  begin
    //Cargo los numeros que cumplen con el numero de la cantidad
    for x := 1 to Indice do
    begin
      Texto := Texto + Acumulador[x].ToString + ',';
    end;
    Texto := Texto + '-';
  end
  //Si la suma es menor hago otra vez la llamada recursiva para buscar los numeros
  else if Suma < Cantidad then
  begin
    for y := Posicion + 1 to Length(Numeros) do
    begin
      if Numeros[y] <> 0 then
        Texto := SubconjuntoAUX(Numeros,Acumulador,Cantidad,y, Indice + 1);
    end;
  end;
  //Devuelvo el texto que contiene a el subconjunto
  Result := Texto;
end;

//Funcion principal
function SubConjunto(Numeros: Vector; Cantidad, Posicion: Integer): String;
var Acumulado : Vector;
  Indice, i: Integer;
  Texto: String;
begin
  Texto := '';
  //Caso base, si el numero elegido es igual a la cantidad devuelvo el numer
  if Numeros[Posicion] = Cantidad then
  begin
    Texto := Texto + Numeros[Posicion].ToString;
  end
  //Si es menor, hago la recursividad
  else if Numeros[Posicion] < Cantidad then
  begin
    //Guardo en un vector el numero y recorro todas las posibilidades
    Vaciar(Acumulado);
    Indice := 1;
    Acumulado[Indice] := Numeros[Posicion];
    for i := Posicion + 1 to Length(Numeros) do
    begin
    if Numeros[i] <> 0 then
      Texto := Texto + SubconjuntoAUX(Numeros,Acumulado,Cantidad,i, Indice + 1);
    end;
  end;
  //Devuelvo el string
  Result := Texto;
end;

procedure TForm1.CalcularClick(Sender: TObject);
var Text: String;
  z,s: Integer;
  Subconjunto_Vector: Vector_String;
begin
  //Recorro el vector 1 por 1 chequeando las posibilidades
  Text := '';
  for z := 1 to Length(V) do
  begin
    if V[z] <> 0 then
    begin
      Text := Text + Subconjunto(V,strtoint(Cantidad.Text),z);
    end;
  end;
  //Hago el parsing y lo cargo en un vector
  Subconjunto_Vector := Parsing(Text,'-');
  //Defino el tamaño del vector
  SetLength(Subconjunto_Vector,Length(Subconjunto_Vector));
  //Muesttro
  memo1.Lines.Add('El subconjunto es:');
  for s := 0 to Length(Subconjunto_Vector) do
  begin
    memo1.Lines.Add(Subconjunto_Vector[s]);
  end;
end;

//Procedure que se encarga de cargar los numeros en un vector
procedure TForm1.IngresarClick(Sender: TObject);
var i: Integer;
  Bandera: Boolean;
begin
  i := 1;
  Bandera := True;
  while (i < Max) and Bandera do
  begin
    if V[I] = 0 then
    begin
      V[i] := strtoint(Numero.Text);
      memo1.Lines.Add('Numero ingresado');
      Bandera := False;
    end
    else
    begin
      i := i + 1;
    end;
  end;
end;

end.
