unit Ejercicio12BIS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

Const
  //Definido el maximo y minimo de filas y columnas
  cantidadColumnasMax = 10;
  cantidadFilaMax = 7;
  cantidadColumnasMin = 1;
  cantidadFilaMin = 1;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

    //Record de posicion, que posee filas y columnas
 Posicion = Record
   Fila : Integer;
   Columna : Integer;
 End;

 Camino = Record
   Direccion: String;
   Situacion: String;
 End;

  //Creo un vector de Posicion
 Vector = Array of Camino;

  //Creo la matriz
  Matriz = Array [cantidadFilaMin..cantidadFilaMax,
  cantidadColumnasMin..cantidadColumnasMax] of String;

var
  Form1: TForm1;

  Campo: Matriz = (
                    ('P','P','P','P','P','M','P','P','M','M'),
                    ('P','E','S','S','S','S','M','S','S','P'),
                    ('S','S','S','P','P','P','P','S','S','S'),
                    ('S','M','S','S','P','P','P','M','S','M'),
                    ('S','S','S','S','S','D','S','S','M','S'),
                    ('P','P','P','S','S','S','S','M','S','S'),
                    ('S','S','M','S','M','S','M','S','M','S')
                    );

implementation

{$R *.dfm}

{
Ejercicio 12
En la guerra de los “UNLuBots” se han diseñado robots que
permiten explorar caminos seguros en campos minados.
Los humanos deben caminar por este campo minado buscando
documentos secretos que están ubicados en algún lugar del campo.
La misión de estos robots es indicar cuál es el camino más seguro,
además de informar en qué posiciones están las minas para que los
exploradores humanos no las pisen y puedan cumplir con su objetivo.

En este campo minado existen alambres de puas que no pueden ser
sobrepasados, espacios seguros de camino, minas, el lugar donde
están los exploradores humanos y el lugar donde se encuentran
los documentos secretos.

Por ejemplo:

P	P	P	P	P	M	P	P	M	M
P	E	S	S	S	S	M	S	S	P
S	S	S	P	P	P	P	S	S	S
S	M	S	S	P	P	P	M	S	M
S	S	S	S	S	D	S	S	M	S
P	P	P	S	S	S	S	M	S	S
S	S	M	S	M	S	M	S	M	S
Donde E representa la posición en la que están los exploradores ,
P identifica la existencia de puas,
M indica la existencia de una mina y
D indica el lugar donde están los documentos secretos.

Los robots sólo se mueven en línea recta, es decir jamás diagonal,
considerando estas condiciones encuentra el camino más seguro de exploración.

Tomando en cuenta el ejemplo anterior, el camino más seguro sería:

(R, S); (D, S); (D, S); (D, S); (R, S); (R, S); (R, D)

En este caso se ha encontrado un camino sin minas,
pero en caso de que no exista tal camino, se debe devolver
el camino que tiene menos minas e informar dónde están para que
los exploradores tengan cuidado.

Para aclarar, en el camino se tiene una lista de pasos que deben dar,
cada uno de estos pasos es de la forma (DIRECCION, SITUACION),
por ejemplo (R,S) dice que el movimiento es a la derecha=RIGHT
y la situacion es segura=S.

Para completar la dirección puede ser: R=derecha, L=izquierda, D=abajo, U=arriba;
la situación puede ser: M=mina, D=documento, S=segura

Realizar el (los) procesos recursivos necesarios, para que,
dado un campo minado, la ubicación de los exploradores y
la ubicación de los documentos; se encuentre el camino “más” seguro de exploración.}

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

function obtenerDireccion(Posicion_Actual, Vengo: Posicion): String;
var valor: String;
begin
  if Posicion_Actual.Fila = Vengo.Fila then //Izq o derecha
  begin
    if Posicion_Actual.Columna > Vengo.Columna then //Derecha
    begin
      valor := 'R';
    end
    else //Izq
    begin
      valor := 'L';
    end;
  end
  else //Arriba o abajo
  begin
    if Posicion_Actual.Fila > Vengo.Fila then //Arriba
    begin
      valor := 'U';
    end
    else //Izq
    begin
      valor := 'D';
    end;
  end;
  Result := valor;
end;

//Funcion principal, recibe el snake, la posicion actual de donde estoy
//y de donde vengo
function SnakeRecursivo (Snake: Matriz; Posicion_Actual, Vengo: Posicion): Vector;
//Paso las variables
var Variable, Mas_Larga: Vector;
  Cadena1, Cadena2, Cadena3, Cadena4: Vector;
  Posicion_Abajo,Posicion_Derecha,Posicion_Arriba, Posicion_Izquierda: Posicion;
begin
  //Hago de tamaño fijo al vector
  SetLength(Variable, 1);
  //Si en la posicion en la que estoy no hay nada, devuelvo vacio;
  if (Snake[Posicion_Actual.Fila,Posicion_Actual.Columna] = 'D') or
    (Snake[Posicion_Actual.Fila,Posicion_Actual.Columna] = 'P') then
  begin
      Result := Variable;//Vector vacio
  end
  else
  //Sino, quiere decir que tengo que buscar la cola y tengo que continuar
  begin
  //Defino el vector y le paso fila y columna actual
    SetLength(Variable, 1);
    Variable[0].Direccion := obtenerDireccion(Posicion_Actual, Vengo);
    Variable[0].Situacion := Snake[Posicion_Actual.Fila][Posicion_Actual.Columna];
  //A mis alrededores del snake voy a tener 4 posiciones distintas, que son:
  //abajo, arriba, izquierda y derecha. Segun a donde vaya, tengo que restar
  //o subir 1 a la fila o columna
  //Es por eso que paso en cada record la posicion actual
    Posicion_Abajo := Posicion_Actual;
    Posicion_Derecha := Posicion_Actual;
    Posicion_Arriba := Posicion_Actual;
    Posicion_Izquierda := Posicion_Actual;

    Posicion_Abajo.Fila := Posicion_Abajo.Fila + 1;
    //Mientras no sobrepase el maximo y el minimo indicado (osea que exista la posicion)
    //voy a seguir por ese lado
    if (Posicion_Abajo.Fila + 1 >= cantidadFilaMin) and (Posicion_Abajo.Fila + 1 < cantidadFilaMax) then
    begin
      //Si es distinto de donde vengo, voy al algoritmo recursivo
      if (Posicion_Abajo.Fila <> Vengo.Fila) or (Posicion_Abajo.Columna <> Vengo.Columna) then
      begin
          //Le paso el snake, la posicion nueva y de donde vengo,
          //que termina siendo la posicion actual
          Cadena1 := SnakeRecursivo(Snake,Posicion_Abajo, Posicion_Actual);
      end;
    end;

    //Mientras no sobrepase el maximo y el minimo indicado (osea que exista la posicion)
    //voy a seguir por ese lado
    if (Posicion_Arriba.Fila - 1 >= cantidadFilaMin) and (Posicion_Arriba.Fila - 1 < cantidadFilaMax)then
    begin
      //En este caso, como es arriba, le resto 1 a la fila
      Posicion_Arriba.Fila := Posicion_Arriba.Fila - 1;
      //Si es distinto de donde vengo, voy al algoritmo recursivo
      if (Posicion_Arriba.Fila <> Vengo.Fila) or (Posicion_Arriba.Columna <> Vengo.Columna) then
      begin
          //Le paso el snake, la posicion nueva y de donde vengo,
          //que termina siendo la posicion actual
          Cadena2 := SnakeRecursivo(Snake,Posicion_Arriba, Posicion_Actual);
      end;
    end;

     //Mientras no sobrepase el maximo y el minimo indicado (osea que exista la posicion)
     //voy a seguir por ese lado
    if (Posicion_Derecha.Columna + 1 < cantidadColumnasMax) and (Posicion_Derecha.Columna + 1 >=  cantidadColumnasMin) then
    begin
      //En este caso, como es derecha, le sumo 1 a la columna
      inc(Posicion_Derecha.Columna);
      //Si es distinto de donde vengo, voy al algoritmo recursivo
      if (Posicion_Derecha.Fila <> Vengo.Fila) or (Posicion_Derecha.Columna <> Vengo.Columna) then
      begin
          //Le paso el snake, la posicion nueva y de donde vengo,
          //que termina siendo la posicion actual
          Cadena3 := SnakeRecursivo(Snake,Posicion_Derecha, Posicion_Actual);
      end;
    end;

     //Mientras no sobrepase el maximo y el minimo indicado (osea que exista la posicion)
    //voy a seguir por ese lado
    if (Posicion_Izquierda.Columna - 1 < cantidadColumnasMax) and (Posicion_Izquierda.Columna - 1 > cantidadColumnasMin)  then
    begin
      //En este caso, como es izquierda, le resto 1 a la columna
      dec(Posicion_Izquierda.Columna);
      //Si es distinto de donde vengo, voy al algoritmo recursivo
      if (Posicion_Izquierda.Fila <> Vengo.Fila) or (Posicion_Izquierda.Columna <> Vengo.Columna) then
      begin
          //Le paso el snake, la posicion nueva y de donde vengo,
          //que termina siendo la posicion actual
          Cadena4 := SnakeRecursivo(Snake,Posicion_Izquierda, Posicion_Actual);
      end;
    end;

  //Llamo a la funcion que devuelve el vector mas largo
  Mas_Larga := Vector_Mas_Largo(Cadena1,Cadena2,Cadena3,Cadena4);
  //Como resultado, obtengo la cadena del snake
  Result := Variable + Mas_Larga;
 end;

end;

//Funcion para obtener la cabeza
function obtenerExplorador(): Posicion;
var
  encontrado: boolean;
  pos: Posicion;
  f: integer;
  c: integer;
begin
  encontrado := false;
  f := cantidadFilaMin;
  while (F <= cantidadFilaMax) and (not encontrado) do
  begin
    c := cantidadColumnasMin;
    while (c <= cantidadColumnasMax) and (not encontrado) do
    begin
      if Campo[f][c] = 'E' then
      begin
        encontrado := true;
        pos.Fila := f;
        pos.Columna := c;
      end;
      inc(c);
    end;
    inc(f);
  end;
  result := pos;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
V: Vector;
  i: Integer;
begin
  V := SnakeRecursivo(Campo,obtenerExplorador(),obtenerExplorador());
  for i := 0 to length(V) - 2 do //Mostrar recorrido
  begin
    memo1.Lines.Add('(' + V[i].Direccion + ',' + V[i].Situacion + ');');
  end;
end;

end.
