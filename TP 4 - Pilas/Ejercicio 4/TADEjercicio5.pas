unit TADEjercicio5;

interface

uses
  Tipos,
  StackArray;
  //StackCursor;
  //StackPointer;

type
  MiPila = Object
    private
      P: Pila;
    public
      procedure crearPila(Tamaño: Integer);
      Function mostrarPila(): String;
      procedure cargarPilaAleatoria(Tamaño: Integer);
      function eliminarOcurrencias(C: TipoElemento):MiPila;
      function eliminarOcurrenciasRecursivo(C: TipoElemento; PilaAuxiliar1, PilaAuxiliar2, PilaAuxiliar3: MiPila): MiPila;
  End;

implementation

//Procedure que crea la pila dado determinado tamaño
procedure MiPila.crearPila(Tamaño: Integer);
begin
  P.Crear(Numero,Tamaño);
end;

function MiPila.mostrarPila;
begin
  mostrarPila := P.RetornarClaves;
end;

//Procedure que carga la pila de forma aleatoria
procedure MiPila.cargarPilaAleatoria(Tamaño: Integer);
begin
  P.LlenarClavesRandom(Tamaño, 1, 10);
end;

{Complejidad algoritmica: Lineal
  .Creacion de 3 pilas auxiliares (1 devuelve la pila origen, 2 tiene el inversor, 3 es la que tengo que devolver)
  .Recorrer la pila original hasta que no este vacia
  .Cada vez que la clave enviada sea distinta a la de la pila origen, apila en auxiliar 2 y 3
  .Si es distinta, apilo solo en 1
  .La primera auxiliar se encargara de devolver tod a la pila origen
  .La segunda pila tiene el contenido sin las ocurrencias, pero invertida, es por eso que necesito un tercer auxiliar que me los coloque de forma correcta
  .Devuelta la tercera pila}

//Funcion que elimina todas las ocurrencias dentro de la pila (iterativo)
function MiPila.eliminarOcurrencias(C:TipoElemento):MiPila;
var PilaAuxiliar1, PilaAuxiliar2, PilaAuxiliar3: MiPila;
  X: TipoElemento;
begin
  //Funcionalidad de las auxiliares:
  //AUX1: Se encarga de retener todos los valores de la pila
  // origen, sin eliminar ocurrencias
  //AUX2: Se encarga de retener todos los valores de la pila
  // origen, eliminando ocurrencias
  //AUX3: Tendra el contenido de la pila sin las ocurrencias
  PilaAuxiliar1.P.Crear(P.DatoDeLaClave,P.SizeStack);
  PilaAuxiliar2.P.Crear(P.DatoDeLaClave,P.SizeStack);
  PilaAuxiliar3.P.Crear(P.DatoDeLaClave,P.SizeStack);
  while not P.EsVacia do
  begin
    X := P.Recuperar;
    if X.Clave <> C.Clave then
    begin
      PilaAuxiliar2.P.Apilar(X); //Apilo en 2 las que son ocurrencia
    end;
    PilaAuxiliar1.P.Apilar(X); //En 1 apilo para recoperar la origen
    P.DesApilar;
  end;
  P.InterCambiar(PilaAuxiliar1.P,false); //Recupero la origen
  PilaAuxiliar3.P.InterCambiar(PilaAuxiliar2.P, false);//Obtengo la pila sin ocurrencias
  Result := PilaAuxiliar3;
end;

//Funcion recursiva que se encarga de eliminar las ocurrencias
function MiPila.eliminarOcurrenciasRecursivo(C: TipoElemento; PilaAuxiliar1, PilaAuxiliar2, PilaAuxiliar3: MiPila): MiPila;
var   X: TipoElemento;
begin
  if P.EsVacia then //Si mi pila origen es vacia, termina el ciclo
  begin
    P.InterCambiar(PilaAuxiliar1.P,false); //Recupero la origen
    PilaAuxiliar3.P.InterCambiar(PilaAuxiliar2.P, false);//Obtengo la pila sin ocurrencias
    Result := PilaAuxiliar3; //Devuelvo la pila sin ocurrencias
  end
  else
  begin
    X := P.Recuperar; //Sino, recupero el tipo elemento del tope
    if X.Clave <> C.Clave then //Comparo si no coincide con el elemento a eliminar
    begin
      PilaAuxiliar2.P.Apilar(X); //Apilo si es distinto
    end;
    PilaAuxiliar1.P.Apilar(X); //Apilo en la AUX1 ya que tiene todo el origen
    P.DesApilar; //Desapilo en el origen
    //Solicito la funcion devuelta
    Result := eliminarOcurrenciasRecursivo(C,PilaAuxiliar1, PilaAuxiliar2, PilaAuxiliar3);
  end;
end;

end.
