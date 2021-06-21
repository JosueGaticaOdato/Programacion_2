unit TADEjercicio6;


interface

uses
  Tipos,
  //QueuesArrayNCMejorada;
  //QueuesCursor;
  QueuesPointer;

const
  //Estos dos arreglos son usados para cargar el ejemplo del ejercicio
  Arreglo1 : Array [1..7] of String = ('A','B','E','D','H','A','Z');
  Arreglo2 : Array [1..6] of String = ('B','A','D','H','Z','E');

type
  Ejercicio6 = Object
    private
      //Aspecto
      C: Cola;
    Public
      //Comportamiento
      procedure Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
      procedure Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
      procedure Cargar_Ejemplo1();
      procedure Cargar_Ejemplo2();
      function Mostrar_Cola():String;
      procedure Apilar_Cola(var C1, Auxiliar: Cola);
      function Son_Iguales(Cola1,Cola2: Ejercicio6): Boolean;
  End;

implementation

//Procedimiento que crea la cola, pasandole el tipo de clave y el tamaño
procedure Ejercicio6.Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
begin
  C.Crear(Tipo_Clave, Tamaño);
end;

//Procedimiento que recarga la cola de forma aleatoria, pasandole
//el tamaño de la cola, y los rangos de minimo y maximo
procedure Ejercicio6.Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
begin
  C.LLenarClavesRandom(Tamaño, RangoA, RangoB);
end;

//Funcion que muestra el contenido de la cola
function Ejercicio6.Mostrar_Cola;
begin
  Mostrar_Cola := C.RetornarClaves;
end;

//Procedimiento que devuelve el contenido de una cola, pasandole el auxiliar
procedure Ejercicio6.Apilar_Cola(var C1, Auxiliar: Cola);
var X: TipoElemento;
begin
  //Mientras el auxiliar no este vacio, cargo en la cola el contenido
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesEncolar;
    C1.Encolar(X);
  end;
end;

//Procedimieto que carga el ejemplo para la cola 1
procedure Ejercicio6.Cargar_Ejemplo1();
var i: Integer;
  X: TipoElemento;
begin
  C.Crear(Cadena,Length(Arreglo1));
  for i := 1 to Length(Arreglo1) do
  begin
    X.Clave := Arreglo1[i];
    C.Encolar(X);
  end;
end;

//Procedimiento que carga el ejemplo para la cola 2
procedure Ejercicio6.Cargar_Ejemplo2();
var i: Integer;
  X: TipoElemento;
begin
  C.Crear(Cadena,Length(Arreglo2));
  for i := 1 to Length(Arreglo2) do
  begin
    X.Clave := Arreglo2[i];
    C.Encolar(X);
  end;
end;

//Funcion que me dice si dos colas son iguales, sin importar repeticion y posicion
//Complejidad O(N): Lineal
//.Recorrer la cola 1, recuperando cada elemento en cada pasada
//.Por cada pasada de la cola 1, tengo que recorrer la 2, recuperando
//cada elemento de esta
//.Comparo si el elemento de la cola 1 es igual al elemento de la cola 2:
//Si son iguales, recupero los elementos de la cola 2 guardados en un auxiliar y sigo
//con el elemento siguiente de la cola
//Si son distintis voy al siguiente de la cola 2. Si todos son distintos, freno
//el bucle y devuelvo falso.
//.Recupero los elementos de ambas colas
function Ejercicio6.Son_Iguales(Cola1,Cola2: Ejercicio6): Boolean;
var AUX1,AUX2: Cola;
  X,Y: TipoElemento;
  Bandera1,Bandera2: Boolean;
begin
  Bandera1 := True;
  AUX1.Crear(Cola1.C.DatoDeLaClave,Cola1.C.SizeQueue);
  //Mientras no este vacia y no este el elemento encontrado
  while (not Cola1.C.EsVacia) and (Bandera1) do
  begin
    X := Cola1.C.Recuperar;
    Bandera2 := True;
    //Creo el AUX2 en cada pasada
    AUX2.Crear(Cola2.C.DatoDeLaClave,Cola2.C.SizeQueue);
    //Mientras la cola 2 no este vacia y no halla encontrado el elemento
    while not Cola2.C.EsVacia and (Bandera2) do
    begin
      Y := Cola2.C.Recuperar;
      //Si son iguales devuelvo false
      if X.Clave = Y.Clave then
      begin
        Bandera2 := False;
      end
      else
      begin
        //Sino, voy al siguiente
        Cola2.C.DesEncolar;
        AUX2.Encolar(Y);
      end;
    end;
    //Pregunto si lo encontre, osea que bandera tiene que ser Falso
    if not Bandera2 then
    begin
      //Si es un si apilo la cola 2 para seguir y desencolo el elemento de la cola 1
      Apilar_Cola(Cola2.C,AUX2);
      Cola1.C.DesEncolar;
      AUX1.Encolar(X);
    end
    else
    begin
      Bandera1 := False;
    end;
  end;
  Cola1.Apilar_Cola(Cola1.C,AUX1);
  Result := Bandera1;
end;
end.
