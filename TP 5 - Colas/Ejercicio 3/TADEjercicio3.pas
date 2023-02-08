unit TADEjercicio3;


interface

uses
  Tipos,
  QueuesArrayNCMejorada;
  //QueuesCursor;
  //QueuesPointer;

const
//Ejemplo del ejercicio
  aX: Array [0..6] of Integer = (12,6,8,5,8,12,12);

type
  Ejercicio3 = Object
    private
      C: Cola;
    Public
      procedure Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
      procedure Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
      procedure cargarEjemplo();
      function Mostrar_Cola():String;
      function Eliminar_Repeticiones(Tamaño: Integer): Ejercicio3;
  End;

implementation

//Procedimiento que crea la cola
procedure Ejercicio3.Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
begin
  C.Crear(Tipo_Clave, Tamaño);
end;

//Procedimineot que carga la cola como en el ejemplo
procedure Ejercicio3.cargarEjemplo;
var X: TipoElemento;
i: integer;
begin
  //(12, 6, 8, 5, 8, 12, 12)
  i := 0;
  C.Crear(Numero,length(aX));
  while i < length(aX) do
  begin
    X.Clave := aX[i];
    C.Encolar(X);
    inc(i);
  end;
end;

//Procedimiento que carga la cola de forma aleatoria
procedure Ejercicio3.Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
begin
  C.LLenarClavesRandom(Tamaño, RangoA, RangoB);
end;

//Funcion que muestra el contenido de la cola
function Ejercicio3.Mostrar_Cola;
begin
  Mostrar_Cola := C.RetornarClaves;
end;

//Funcion que comprueba si un elemento se encuentra en la cola repetido. Devuelve true si esta repetido
function comprobarElementoRepetido(C: Cola;Elemento: TipoElemento): Boolean;
var AUX1: Cola;
  Bandera: Boolean;
  X: TipoElemento;
  Contador: integer;
begin
  Aux1.Crear(Numero,C.SizeQueue); //Creo auxiliar
  Bandera := False;
  Contador := 0;
  while (not C.EsVacia) do
  begin
    X := C.Recuperar;
    if X.Clave = Elemento.Clave then //Si el frente no coincide con el elemento que busco
    begin
      inc(Contador);
    end;
    C.DesEncolar;  //Saco de origen y encolo en aux
    AUX1.Encolar(X);
  end;
  if Contador > 1 then
  begin
    Bandera := true;
  end;
  C.InterCambiar(Aux1,false);   //Restauro la cola original
  Result := Bandera;
end;

{Complejidad lineal:
  .Creacion de una cola auxiliar y una replica de la original
  .Recorre la cola hasta el final
  .Recuperar el elemento del tope y buscarlo por la cola copia a ver si esta mas de 1 vez (funcion comprobarElementoRepetido)
  .Si esta solamente una vez, la agrego a la AUX1
  .Desencolo para buscar al siguiente elemento}

//Funcion que crea una nueva cola pero sin los elementos repetidos
function Ejercicio3.Eliminar_Repeticiones(Tamaño: Integer): Ejercicio3;
var AUX1: Ejercicio3;
  AUX2: Cola;
  X: TipoElemento;
begin
  //Creo dos colas, AUX1 Y AUX2
  AUX1.C.Crear(Numero,Tamaño); //Esta tendra los valores no repetidos
  AUX2 := C; //Y esta sera una copia de la original
  while (Not C.EsVacia) do //Mientras no llegue al final de la cola
  begin
    X := C.Recuperar;
    if not comprobarElementoRepetido(AUX2,X) then
    begin
      AUX1.C.Encolar(X);
    end;
    C.DesEncolar;
  end;
  C.InterCambiar(AUX2,false);
  Result := AUX1;
end;

end.
