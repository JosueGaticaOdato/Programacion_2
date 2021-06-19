unit TADEjercicio10;

interface

uses
  SysUtils,
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  Ejercicio10 = Object
    private
      //Atributos
      P: Pila;
    public
      //Comportamiento
      procedure Definir_Tamaño_Pila(Tamaño: Integer);
      Function Mostrar_Pila(): String;
      procedure Apilar_Pila_Origen(Auxiliar: Pila);
      procedure Convertir(Numero,Base: Integer);
      function Transformar (): String;
  End;

implementation

//Procedimiento que crea la pila
procedure Ejercicio10.Definir_Tamaño_Pila(Tamaño: Integer);
begin
  P.Crear(Numero,Tamaño);
end;

//Funcion que muestra la pila
function Ejercicio10.Mostrar_Pila;
begin
  Mostrar_Pila := P.RetornarClaves;
end;

//Procedimiento que recupera la pila origen
procedure Ejercicio10.Apilar_Pila_Origen(Auxiliar: Pila);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesApilar;
    P.Apilar(X);
  end;
end;


//Procedimiento recursivo que realiza la transformacion de un numero a cualquier base
//Complejidad O(n) Lineal
//.Caso base: Si el numero es menor a la base, devuelvo el numero solamente
//.Si no se cumple el caso base,realizo el cociente y el resto entre el numero y su base,
//apilando el resto y llamando otra vez al procedimiento, pero esta vez entre el cociente que quedo y la misma base
procedure Ejercicio10.Convertir(Numero,Base: Integer);
var Resto, Cociente: TipoElemento;
begin
  if Numero < Base then
  begin
    Cociente.Clave := Numero;
    P.Apilar(Cociente);
  end
  else
  begin
    Resto.Clave := Numero MOD Base;
    Cociente.Clave := Numero DIV Base;
    P.Apilar(Resto);
    Convertir(Cociente.Clave,Base);
  end;
end;

//Funcion que devuelve el contenido de la pila como string
function Ejercicio10.Transformar():String;
var Cadena: String;
  X: TipoElemento;
begin
  Cadena := '';
  while not P.EsVacia do
  begin
    X := P.Recuperar;
    P.DesApilar;
    Cadena := Cadena + InttoStr(X.Clave);
  end;
  Result := Cadena;
end;

end.
