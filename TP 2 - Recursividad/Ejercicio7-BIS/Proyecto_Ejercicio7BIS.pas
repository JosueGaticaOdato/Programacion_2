unit Proyecto_Ejercicio7BIS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

Const
  //Definido el maximo y minimo de filas y columnas
  cantidadColumnasMax = 'J';
  cantidadFilaMax = 10;
  cantidadColumnasMin = 'A';
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
   Columna : char;
 End;

  //Creo un vector de Posicion
 Vector = Array of Posicion;

  //Creo la matriz
  Matriz = Array [cantidadFilaMin..cantidadFilaMax,cantidadColumnasMin..cantidadColumnasMax] of String;

{
  A	B	C	D	E	F	G	H	I	J
1
2		S
3		S	S
4			S
5			S	S	S	S	S	S
6								S
7								S
8						C	S	S
9
10  *}

var
  Form1: TForm1;
 Cadena: Matriz = (
                    ('','','','','','','','','',''),
                    ('','S','','','','','','','',''),
                    ('','S','S','','','','','','',''),
                    ('','', 'S','','','','','','',''),
                    ('','', 'S','S','S','S','S','S','',''),
                    ('','','','','','','',      'S','',''),
                    ('','','','','','','',      'S','',''),
                    ('','','','','',    'C','S','S','',''),
                    ('','','','','','','','','',''),
                    ('','','','','','','','','','')
                    );

  {Cadena: Matriz = (
                    ('','','','','','','','','',''),
                    ('','','','','','','','','',''),
                    ('','','','','','','','','',''),
                    ('','','','','','','','','',''),
                    ('','','','','','','','','',''),
                    ('','','','','','','','','',''),
                    ('','','','','','','','','',''),
                    ('','','','','','C','S','','',''),
                    ('','','','','','','','','',''),
                    ('','','','','','','','','','')
                    );}

implementation

{$R *.dfm}
{
Ejercicio 7
En el juego de Snake, una serpiente recorre una grilla para comer manzanas
y así poder crecer. La serpiente siempre se mueve a los cuadros adyacentes
(nunca en diagonal) y no puede chocarse con sí misma ni rozarse,
es decir, un cuadro que contiene una parte de la serpiente sólo
puede estar adyacente a, como máximo, dos otras partes.

Si se tiene una matriz que representa a la serpiente en la grilla,
¿cómo podría calcularse su longitud y el recorrido que hizo?

Por ejemplo:

A	B	C	D	E	F	G	H	I	J
1
2		S
3		S	S
4			S
5			S	S	S	S	S	S
6								S
7								S
8						C	S	S
9
10
La serpiente, cuya cabeza es C, empezó en (2,B) y
recorrió (3,B), (3,C), (4,C), ... , (8,F). Su longitud es 15. }

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
  if Snake[Posicion_Actual.Fila,Posicion_Actual.Columna] = '' then
  begin
      Result := Variable;//Vector vacio
  end
  else
  //Sino, quiere decir que tengo que buscar la cola y tengo que continuar
  begin
  //Defino el vector y le paso fila y columna actual
    SetLength(Variable, 1);
    Variable[0].Fila := Posicion_Actual.Fila;
    Variable[0].Columna := Posicion_Actual.Columna;
  //A mis alrededores del snake voy a tener 4 posiciones distintas, que son:
  //abajo, arriba, izquierda y derecha. Segun a donde vaya, tengo que restar
  //o subir 1 a la fila o columna
  //Es por eso que paso en cada record la posicion actual
    Posicion_Abajo := Posicion_Actual;
    Posicion_Derecha := Posicion_Actual;
    Posicion_Arriba := Posicion_Actual;
    Posicion_Izquierda := Posicion_Actual;

    Posicion_Abajo.Fila := Posicion_Abajo.Fila + 1;
    //Si es distinto de donde vengo, voy al algoritmo recursivo
    if (Posicion_Abajo.Fila <> Vengo.Fila) or (Posicion_Abajo.Columna <> Vengo.Columna) then
    begin
        //Le paso el snake, la posicion nueva y de donde vengo,
        //que termina siendo la posicion actual
        Cadena1 := SnakeRecursivo(Snake,Posicion_Abajo, Posicion_Actual);
    end;

    //En este caso, como es arriba, le resto 1 a la fila
    Posicion_Arriba.Fila := Posicion_Arriba.Fila - 1;
    //Si es distinto de donde vengo, voy al algoritmo recursivo
    if (Posicion_Arriba.Fila <> Vengo.Fila) or (Posicion_Arriba.Columna <> Vengo.Columna) then
    begin
        //Le paso el snake, la posicion nueva y de donde vengo,
        //que termina siendo la posicion actual
        Cadena2 := SnakeRecursivo(Snake,Posicion_Arriba, Posicion_Actual);
    end;
    //En este caso, como es derecha, le sumo 1 a la columna
    inc(Posicion_Derecha.Columna);
    //Si es distinto de donde vengo, voy al algoritmo recursivo
    if (Posicion_Derecha.Fila <> Vengo.Fila) or (Posicion_Derecha.Columna <> Vengo.Columna) then
    begin
        //Le paso el snake, la posicion nueva y de donde vengo,
        //que termina siendo la posicion actual
        Cadena3 := SnakeRecursivo(Snake,Posicion_Derecha, Posicion_Actual);
    end;

    //En este caso, como es izquierda, le resto 1 a la columna
    dec(Posicion_Izquierda.Columna);
    //Si es distinto de donde vengo, voy al algoritmo recursivo
    if (Posicion_Izquierda.Fila <> Vengo.Fila) or (Posicion_Izquierda.Columna <> Vengo.Columna) then
    begin
        //Le paso el snake, la posicion nueva y de donde vengo,
        //que termina siendo la posicion actual
        Cadena4 := SnakeRecursivo(Snake,Posicion_Izquierda, Posicion_Actual);
    end;



  //Llamo a la funcion que devuelve el vector mas largo
  Mas_Larga := Vector_Mas_Largo(Cadena1,Cadena2,Cadena3,Cadena4);
  //Como resultado, obtengo la cadena del snake
  Result := Variable + Mas_Larga;
 end;

end;

//Funcion para obtener la cabeza
function obtenerCabeza(): Posicion;
var
  encontrado: boolean;
  pos: Posicion;
  f: integer;
  c: char;
begin
  encontrado := false;
  f := cantidadFilaMin;
  while (F <= cantidadFilaMax) and (not encontrado) do
  begin
    c := cantidadColumnasMin;
    while (c <= cantidadColumnasMax) and (not encontrado) do
    begin
      if Cadena[f][c] = 'C' then
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
  V := SnakeRecursivo(Cadena,obtenerCabeza(),obtenerCabeza());
  memo1.Lines.Add('Cabeza: ' + '(' + inttostr(V[0].Fila) + ',' + V[0].Columna + ')');
  memo1.Lines.Add('Recorrido:');
  for i := 1 to length(V) - 2 do //Mostrar recorrido
  begin
    memo1.Lines.Add('(' + inttostr(V[i].Fila) + ',' + V[i].Columna + ')');
  end;
  memo1.Lines.Add('Longitud es ' + inttostr(length(V) - 1));
end;

end.
