unit TADEjercicio1Cola;

interface

uses
  Tipos,
  //QueuesArrayNCMejorada;
  //QueuesCursor;
  QueuesPointer;

type
  Ejercicio1 = Object
    private
      C: Cola;
    Public
      procedure crearCola(Tipo_Clave: Variant; Tamaño: Integer);
      procedure cargarAleatorio(Tamaño, RangoA, RangoB: Integer);
      function mostrarCola():String;
      function contarElementos(): Integer;
      function comprobarElemento(Elemento: TipoElemento): Boolean;
      procedure Agregar(Elemento: TipoElemento; Posicion: Integer);
      procedure Eliminar(Elemento: TipoElemento);
      function Copia(): Ejercicio1;
      procedure Concatenar(var C1: Ejercicio1);
      function Invertir(): Ejercicio1;


  End;

implementation

//Operaicion que crea la cola
procedure Ejercicio1.crearCola(Tipo_Clave: Variant; Tamaño: Integer);
begin
  C.Crear(Tipo_Clave, Tamaño);
end;

//Procedimiento que carga la cola de forma aleatoria, dados 2 rangos de valores
procedure Ejercicio1.cargarAleatorio(Tamaño, RangoA, RangoB: Integer);
begin
  C.LLenarClavesRandom(Tamaño, RangoA, RangoB);
end;

//Funcion que muestra el contenido de la cola
function Ejercicio1.mostrarCola;
begin
  mostrarCola := C.RetornarClaves;
end;

//Funcion que cuenta la cantidad de elementos de una cola
function Ejercicio1.contarElementos;
var AUX1: Cola;
  X: TipoElemento;
  Contador: Integer;
begin
  Aux1.Crear(Numero,C.SizeQueue); //Creo auxiliar
  Contador := 0;
  while not C.EsVacia do //Hasta que no recorra toda la cola
  begin
    X := C.Recuperar; //Recupero el frente
    C.DesEncolar; //Desencolo en la origen
    AUX1.Encolar(X); //Encolo lo que saque en la aux
    Contador := Contador + 1;//Subo el contador
  end;
  C.InterCambiar(AUX1,false); //Restauro la cola original
  Result := Contador;
end;

//Funcion que comprueba si un elemento se encuentra en la cola. Devuelve true si esta
function Ejercicio1.comprobarElemento(Elemento: TipoElemento): Boolean;
var AUX1: Cola;
  Bandera: Boolean;
  X: TipoElemento;
begin
  Aux1.Crear(Numero,C.SizeQueue); //Creo auxiliar
  Bandera := False;
  while (not C.EsVacia) do
  begin
    X := C.Recuperar;
    if X.Clave = Elemento.Clave then //Si el frente no coincide con el elemento que busco
    begin
      Bandera := True; //Si coincide, entonces es el elemento que busco
    end;
    C.DesEncolar;  //Saco de origen y encolo en aux
    AUX1.Encolar(X);
  end;
  C.InterCambiar(Aux1,false);   //Restauro la cola original
  Result := Bandera;
end;

//Procedimiento que agrega un elemento en la cola dada una posicion
procedure Ejercicio1.Agregar(Elemento: TipoElemento; Posicion: Integer);
var AUX1: Cola;
  X: TipoElemento;
  ContadorPosicion: Integer;
  Encolada: boolean;
begin
  Aux1.Crear(Numero,C.SizeQueue + 1); //Creo la auxiliar con un lugar mas
  ContadorPosicion := 1;
  while (not C.EsVacia) do  //Mientras no haya recorrido toda la cola y no haya encolado el valor
  begin
    if ContadorPosicion = Posicion then //Comparo si es la posicion en que la quiero poner
    begin
      AUX1.Encolar(Elemento); //Lo pongo en la auxiliar
    end
    else
    begin //Cargo en aux el frente de origen
      X := C.Recuperar;
      C.DesEncolar;
      AUX1.Encolar(X);
    end;
    ContadorPosicion := ContadorPosicion + 1;
  end;
  C.Crear(Numero, C.SizeQueue + 1); //Creo la nueva cola con un tamaño mas
  C.InterCambiar(aux1,false);  //Restauro la cola original
end;

//Procedimiento que elimina un elemento en la cola dada una posicion
procedure Ejercicio1.Eliminar(Elemento: TipoElemento);
var AUX1: Cola;
  X: TipoElemento;
begin
  Aux1.Crear(Numero,C.SizeQueue);
  while (not C.EsVacia) do //Mientras no haya recorrido toda la cola
  begin
    X := C.Recuperar;
    C.DesEncolar;
    if X.Clave <> Elemento.Clave then //Comparo si es el valor que tengo que eliminar
    begin
      AUX1.Encolar(X); //Solamente si no es el valor guardo en auxiliar, sino lo elimino, ya que es el valor que quiero eliminar
    end;
  end;
  C.Crear(Numero, Aux1.SizeQueue); //Creo la nueva cola con un tamaño menos
  C.InterCambiar(Aux1,false);  //Restauro la cola original
end;

//Funcion que crea una copia de la cola
function Ejercicio1.Copia():Ejercicio1;
var AUX1: Cola;
  AUX2,AUX3: Ejercicio1;
  X: TipoElemento;
begin
  //Creo dos colas aux
  Aux1.Crear(Numero,C.SizeQueue);
  Aux2.C.Crear(Numero,C.SizeQueue);
  while (not C.EsVacia)do //Recorro toda la cola origen
  begin
    //Recupero, desencolo en origen y encolo en las dos aux
    X := C.Recuperar;
    C.DesEncolar;
    AUX1.Encolar(X);
    AUX2.C.Encolar(X);
  end;
  C.InterCambiar(aux1,false);  //Restauro la cola original
  Result := AUX2; //Devuelvo la copia
end;

//Procedimiento que Concatenar dos colas dejando el resultado en la primera de ellas
procedure Ejercicio1.Concatenar(var C1: Ejercicio1);
var AUX1: Cola;
  X: TipoElemento;
  Tamaño: Integer;
begin
  Tamaño := C1.C.SizeQueue + c.SizeQueue;
  AUX1.Crear(Numero,Tamaño); //Creo una cola auxiliar con el tamaño de ambas colas
  while not C.EsVacia do //Recorro primero una cola
  begin
    //Recupero, desencolo en origen y encolo en aux
    X := C.Recuperar;
    C.DesEncolar;
    AUX1.Encolar(X);
  end;
  while not C1.C.EsVacia do //Recorro la segunda cola
  begin
    //Recupero, desencolo en origen y encolo en aux
    X := C1.C.Recuperar;
    C1.C.DesEncolar;
    AUX1.Encolar(X);
  end;
  C.Crear(Numero,Tamaño);
  C.InterCambiar(aux1,false);  //Restauro la cola original
end;

//Funcion que invierte la cola origen sin destruilar
function Ejercicio1.Invertir():Ejercicio1;
var AUX1: Cola;
  AUX2: Ejercicio1;
  X: TipoElemento;
begin
  //Creo dos colas aux
  Aux1.Crear(Numero,C.SizeQueue);
  Aux2.C.Crear(Numero,C.SizeQueue);
  while (not C.EsVacia)do  //Recorro toda la cola origen
  begin
    //Recupero, desencolo en origen y encolo en las dos aux
    X := C.Recuperar;
    C.DesEncolar;
    AUX1.Encolar(X);
    AUX2.C.Encolar(X);
  end;
  C.InterCambiar(AUX1,false);  //Restauro la cola original
  Result := AUX2;
end;

end.
