unit TADEjercicio4;

interface

uses
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  MiPila = Object
    private
      P: Pila;
    public
      procedure crearPila(Tamaño: Integer);
      Function mostrarPila(): String;
      procedure Cargar_Pila_Aleatoria(Tamaño: Integer);
      function Invertir(): MiPila;
  End;

implementation

//Procedimiento que crea la pila con x tamaño
procedure MiPila.crearPila(Tamaño: Integer);
begin
  P.Crear(Numero,Tamaño);
end;

//Funcion que muestra la pila
function MiPila.mostrarPila;
begin
  mostrarPila := P.RetornarClaves;
end;

{
//Procedimiento que apila la pila dada una auxiliar
procedure MiPila.Apilar_Pila_Origen(Auxiliar: Pila);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesApilar;
    P.Apilar(X);
  end;
end;   }

procedure MiPila.Cargar_Pila_Aleatoria(Tamaño: Integer);
begin
  P.LlenarClavesRandom(Tamaño, 1, 10);
end;

//Complejidad algoritimica: Lineal
//.Crear dos pilas auxiliares
//.Mientras no tenga vacia la pila origen:
//  .Recuperar el valor de la pila origen
//  .Desapilar el tope de la pila origen
//  .Apilar ese valor en ambas pilas auxiliares
//.Uso una de las pilas auxiliares para volver a recuperar la original
//.Devuelvo con resultado la pila auxiliar restante

{
Invertir el contenido de una pila sin destruir la pila original.
Se debe retornar la nueva pila invertida y la original no se debe perder.
}

//Funcion que invierte la pila
function MiPila.Invertir(): MiPila;
var PilaAuxiliar1, PilaAuxiliar2: MiPila;
  X: TipoElemento;
begin
  //Creo dos pilas auxiliares
  PilaAuxiliar1.P.Crear(P.DatoDeLaClave,P.SizeStack);
  PilaAuxiliar2.P.Crear(P.DatoDeLaClave,P.SizeStack);
  while not P.EsVacia do //Mientras no este vacia mi pila origen
  begin
    X := P.Recuperar;
    P.DesApilar; //Recupero y desapilo de la origen
    PilaAuxiliar1.P.Apilar(X); //Apilo en ambas auxiliares
    PilaAuxiliar2.P.Apilar(X);
  end;
  //Recupero la pila origen gastando una auxiliar
  P.InterCambiar(PilaAuxiliar1.P, false);
  //Devuelvo la pila invertida
  Result := PilaAuxiliar2;
end;

end.
