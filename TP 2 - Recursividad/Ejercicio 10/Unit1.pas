unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

const
  //Definido el maximo y minimo de filas y columnas
  cantidadFilasMax = 7;
  min = 1;
  cantidadColumnasMax = 13;

type

//Record de posicion, que posee filas y columnas
 Posicion = Record
   Fila : Integer;
   Columna : Integer;
 End;

 //Creo un vector de Posicion
 Vector = Array of Posicion;

  TForm1 = class(TForm)
    Memo2: TMemo;
    Button1: TButton;
    Tabla: TImage;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//Creo la matriz que contiene la cadena de carbonos
Matriz = Array [1..7,1..13] of String;

var
  Form1: TForm1;
  //Tengo la matriz con la cadena de carbonos
  Cadena: Matriz = (
                    ('C','.','.','.','.','.','.','.','.','.','.','.','.'),
                    ('C','C','.','C','.','.','.','.','.','.','.','.','.'),
                    ('.','C','.','C','.','.','.','.','.','C','.','.','.'),
                    ('.','C','.','C','.','.','.','.','.','C','.','.','.'),
                    ('.','C','C','C','C','C','C','C','C','C','.','.','.'),
                    ('.','C','.','.','.','.','.','.','.','.','.','.','.'),
                    ('.','C','.','.','.','.','.','.','.','.','.','.','.')
                    );

implementation

(*
En la química orgánica se tienen cadenas de Carbono e
Hidrógeno juntos, que forman distintas clases de alcanos,
que se diferencian unos de otros por la cantidad de carbonos que existen.
La forma de encontrar además la nominación correcta es
considerando la cadena lineal más larga que se pueda tener,
la misma que da la nominación básica y encima de esa se obtienen otras más,
que se basan en las ramificaciones existentes sobre la cadena lineal principal.
Lo importante por el momento es identificar la cadena lineal
de carbono más larga que se pueda hallar en una composición.

Dada una composición representada en una matriz de símbolos {C, .},
se pide escribir un algoritmo recursivo para encontrar la cadena lineal
más larga de carbonos. La cadena siempre empieza en la posición (1, 1).

Por ejemplo, se tiene la composición:

C	.	.	.	.	.	.	.	.	.	.	.	.
C	C	.	C	.	.	.	.	.	.	.	.	.
.	C	.	C	.	.	.	.	.	C	.	.	.
.	C	.	C	.	.	.	.	.	C	.	.	.
.	C	C	C	C	C	C	C	C	C	.	.	.
.	C	.	.	.	.	.	.	.	.	.	.	.
.	C	.	.	.	.	.	.	.	.	.	.	.
*)

//Funcion que devuelve el vector mas largo
function Vector_Mas_Largo (C1,C2,C3,C4: Vector): Vector;
begin
  //Segun cual sea mas largo, devuelve dicho vector
  if (((Length(C1) > Length (C2)) and (Length(C1) > Length (C3)) and (Length(C1) > Length(C4)))) then
  begin
    Result := C1;
  end
  else if (Length(C2) > Length (C3)) and (Length(C2) > Length(C4)) then
  begin
    Result := C2;
  end
  else if (Length(C3) > Length(C4)) then
  begin
    Result := C3;
  end
  else
  begin
    Result := C4;
  end;
end;

//Funcion principal, recibe la cadena de carbonos, la posicion actual de donde estoy
//y de donde vengo
function Cadena_CarbonoAUX (Carbono: Matriz; Posicion_Actual, Vengo: Posicion): Vector;
//Paso las variables
var Variable, Mas_Larga: Vector;
  Cadena1, Cadena2, Cadena3, Cadena4: Vector;
  Posicion_Abajo,Posicion_Derecha,Posicion_Arriba, Posicion_Izquierda: Posicion;
begin
  //Hago de tamaño fijo al vector
  SetLength(Variable, 1);
  //Si en la posicion en la que estoy es un punto, quiere decir
  //que no hay nada, por lo tanto devuelvo el vector vacio
  if Carbono[Posicion_Actual.Fila,Posicion_Actual.Columna] = '.' then
  begin
      Result := Variable;//Vector vacio
  end
  else
  //Sino, quiere decir que tengo un carbono y tengo que continuar
  begin
  //Defino el vector y le paso fila y columna actual
    SetLength(Variable, 1);
    Variable[0].Fila := Posicion_Actual.Fila;
    Variable[0].Columna := Posicion_Actual.Columna;
  //A mis alrededores del carbono voy a tener 4 posiciones distintas, que son:
  //abajo, arriba, izquierda y derecha. Segun a donde vaya, tengo que restar
  //o subir 1 a la fila o columna
  //Es por eso que paso en cada record la posicion actual
    Posicion_Abajo := Posicion_Actual;
    Posicion_Derecha := Posicion_Actual;
    Posicion_Arriba := Posicion_Actual;
    Posicion_Izquierda := Posicion_Actual;
  //Mientras no sobrepase el maximo y el minimo indicado (osea que exista la posicion)
  //voy a seguir por ese lado
  if (Posicion_Abajo.Fila + 1 >= min) and (Posicion_Abajo.Fila + 1 < cantidadFilasMax) then
    begin
    //En este caso, como es abajo, le sumo 1 a la fila
    Posicion_Abajo.Fila := Posicion_Abajo.Fila + 1;
    //Si es distinto de donde vengo, voy al algoritmo recursivo
    if (Posicion_Abajo.Fila <> Vengo.Fila) or (Posicion_Abajo.Columna <> Vengo.Columna) then
        //Le paso la cadena de carbono, la posicion nueva y de donde vengo,
        //que termina siendo la posicion actual
        Cadena1 := Cadena_CarbonoAUX(Carbono,Posicion_Abajo, Posicion_Actual);
    end;
  //Mientras no sobrepase el maximo y el minimo indicado (osea que exista la posicion)
  //voy a seguir por ese lado
  if (Posicion_Arriba.Fila - 1 >= min) and (Posicion_Arriba.Fila - 1 < cantidadFilasMax)then
    begin
    //En este caso, como es arriba, le resto 1 a la fila
    Posicion_Arriba.Fila := Posicion_Arriba.Fila - 1;
    //Si es distinto de donde vengo, voy al algoritmo recursivo
      if (Posicion_Arriba.Fila <> Vengo.Fila) or (Posicion_Arriba.Columna <> Vengo.Columna) then
        //Le paso la cadena de carbono, la posicion nueva y de donde vengo,
        //que termina siendo la posicion actual
        Cadena2 := Cadena_CarbonoAUX(Carbono,Posicion_Arriba, Posicion_Actual);
    end;
  //Mientras no sobrepase el maximo y el minimo indicado (osea que exista la posicion)
  //voy a seguir por ese lado
  if (Posicion_Derecha.Columna + 1 < cantidadColumnasMax) and (Posicion_Derecha.Columna + 1 >=  min) then
    begin
    //En este caso, como es derecha, le sumo 1 a la columna
    Posicion_Derecha.Columna := Posicion_Derecha.Columna + 1;
    //Si es distinto de donde vengo, voy al algoritmo recursivo
      if (Posicion_Derecha.Fila <> Vengo.Fila) or (Posicion_Derecha.Columna <> Vengo.Columna) then
        //Le paso la cadena de carbono, la posicion nueva y de donde vengo,
        //que termina siendo la posicion actual
        Cadena3 := Cadena_CarbonoAUX(Carbono,Posicion_Derecha, Posicion_Actual);
    end;
  //Mientras no sobrepase el maximo y el minimo indicado (osea que exista la posicion)
  //voy a seguir por ese lado
  if (Posicion_Izquierda.Columna - 1 < cantidadColumnasMax) and (Posicion_Izquierda.Columna - 1 > min)  then
    begin
    //En este caso, como es izquierda, le resto 1 a la columna
    Posicion_Izquierda.Columna := Posicion_Izquierda.Columna - 1;
    //Si es distinto de donde vengo, voy al algoritmo recursivo
      if (Posicion_Izquierda.Fila <> Vengo.Fila) or (Posicion_Izquierda.Columna <> Vengo.Columna) then
        //Le paso la cadena de carbono, la posicion nueva y de donde vengo,
        //que termina siendo la posicion actual
        Cadena4 := Cadena_CarbonoAUX(Carbono,Posicion_Izquierda, Posicion_Actual);
    end;



  //Llamo a la funcion que devuelve el vector mas largo
  Mas_Larga := Vector_Mas_Largo(Cadena1,Cadena2,Cadena3,Cadena4);
  //Como resultado, obtengo la cadena mas larga
  Result := Variable + Mas_Larga;
 end;

end;

//Funcion que llama a la funcion recursiva
function Cadena_Carbono (Carbono: Matriz): Vector;
var Posicion_Arranque : Posicion;
begin
  //Le paso la posicion de inicio, que es la 1,1
  Posicion_Arranque.Fila := 1;
  Posicion_Arranque.Columna := 1;
  //Obtengo la cadena de carbono mas larga
  Result := Cadena_CarbonoAUX(Carbono, Posicion_Arranque, Posicion_Arranque );
end;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var V: Vector;
  x: Integer;
  y: Integer;
  Mostrar: String;
begin
  //Guardo en un vector de posciones, las posiciones de la cadena mas larga
  V := Cadena_Carbono(Cadena);
  //Muestro en el memo las filas y columnas que conforman
  //la cadena mas larga
  memo2.Lines.Add('Las posiciones de la cadena de carbono mas larga son');
  for x := 0 to length(V) - 2 do
    memo2.Lines.Add('Fila: ' + V[x].Fila.ToString + '/Columna: ' + V[x].Columna.ToString);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo2.Clear;
end;

end.
