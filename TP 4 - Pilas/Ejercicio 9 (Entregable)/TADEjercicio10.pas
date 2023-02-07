unit TADEjercicio10;

interface

uses
  SysUtils,
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  Stack = Object
    private
      //Atributos
      P: Pila;
    public
      //Comportamiento
      procedure crearPila(Tamaño: Integer);
      Function mostrarPila(): String;
      procedure Convertir(Numero,Base: Integer);
      function Transformar (): String;
  End;

implementation

//Procedimiento que crea la pila
procedure Stack.crearPila(Tamaño: Integer);
begin
  P.Crear(Numero,Tamaño);
end;

//Funcion que muestra la pila
function Stack.mostrarPila;
begin
  mostrarPila := P.RetornarClaves;
end;



//Complejidad O(n) Lineal
//.Caso base: Si el numero es menor a la base, devuelvo el numero solamente
//.Si no se cumple el caso base,realizo el cociente y el resto entre el numero y su base,
//apilando el resto y llamando otra vez al procedimiento, pero esta vez entre el cociente que quedo y la misma base

//Procedimiento recursivo que realiza la transformacion de un numero a cualquier base
procedure Stack.Convertir(Numero,Base: Integer);
var Resto, Cociente: TipoElemento;
begin
  if Numero < Base then //Si el numero es menor a mi base, quiere decir que termine
  //la recursion, ya que no se puede dividir mas ese numero
  begin
    Cociente.Clave := Numero;
    P.Apilar(Cociente); //Agrego el cociente a mi pila
  end
  else
  begin
    //Obtengo el resto y el cociente
    Resto.Clave := Numero MOD Base;
    Cociente.Clave := Numero DIV Base;
    P.Apilar(Resto); //Apilo el resto
    //Realizo nuevamente la recursividad con el nuevo cociente obtenido
    Convertir(Cociente.Clave,Base);
  end;
end;

//Funcion que devuelve el contenido de la pila como string
function Stack.Transformar():String;
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
