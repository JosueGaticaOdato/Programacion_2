unit TADEjercicio2;

interface

uses
  Tipos,
  //QueuesArrayNCMejorada;
  //QueuesCursor;
  QueuesPointer;

const
  valorRandomCargarIguales = 10;

type
  Ejercicio2 = Object
    private
      C: Cola;
    Public
      procedure crearCola(Tipo_Clave: Variant; Tamaño: Integer);
      procedure cargarAleatorio(Tamaño, RangoA, RangoB: Integer);
      function mostrarCola():String;
      procedure cargarColaIguales(var C1: Ejercicio2);
      procedure recuperarColasOrigen(Auxiliar: Cola; Cola1,Cola2: Cola);
      function sonIguales(var C1, C2: Ejercicio2): Boolean;
  End;

implementation

//Procedimiento que crea la cola dado un tamaño
procedure Ejercicio2.crearCola(Tipo_Clave: Variant; Tamaño: Integer);
begin
  C.Crear(Tipo_Clave, Tamaño);
end;

//Procedimiento que carga la cola de forma aleatoria dado dos rangos
procedure Ejercicio2.cargarAleatorio(Tamaño, RangoA, RangoB: Integer);
begin
  C.LLenarClavesRandom(Tamaño, RangoA, RangoB);
end;

//Funcion que muestra la cola
function Ejercicio2.mostrarCola;
begin
  mostrarCola := C.RetornarClaves;
end;

//Procedimiento que recupera los valores de las dos colas origen dada una cola aux
procedure Ejercicio2.recuperarColasOrigen(Auxiliar: Cola; Cola1,Cola2: Cola);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do //Hasta que no termine de recorrer la auxiliar
  begin
    //Recupero, desencolo en auxilair y encolo en mis dos origenes
    X := Auxiliar.Recuperar;
    Auxiliar.DesEncolar;
    Cola1.Encolar(X);
    Cola2.Encolar(X);
  end;
end;

//Procedimiento que carga las dos colas iguales
procedure Ejercicio2.cargarColaIguales(var C1: Ejercicio2);
var
  i: Integer;
  X: TipoElemento;
begin
  Randomize;
  //Vacio primero las dos colas
  C.Crear(C.DatoDeLaClave,C.SizeQueue);
  C1.C.Crear(C.DatoDeLaClave,C.SizeQueue);
  for i := 1 to C.SizeQueue do
  begin
    //Obtengo el valor de la clave y encolo en ambas
    X.Clave := Random(valorRandomCargarIguales);
    C.Encolar(X);
    C1.C.Encolar(X);
  end;
end;

//Funcion que comprueba si las dos colas son iguales, sin perder las colas originales
//ESTA MAL HECHO, HAY QUE ARREGLAR
function Ejercicio2.sonIguales(var C1, C2: Ejercicio2): Boolean;
var X,Y: TipoElemento;
  Bandera: Boolean;
  AUX1: Cola;
begin
  Bandera := True;
  while (not C2.C.EsVacia) and (Bandera) do
  begin
    X := C2.C.Recuperar;
    y := C1.C.Recuperar;
    if X.Clave <> Y.Clave then
    begin
      Bandera := False;
    end
    else
    begin
      AUX1.Encolar(X);
      C2.C.DesEncolar;
      C1.C.DesEncolar;
    end;
  end;
  recuperarColasOrigen(AUX1,C1.C,C2.C);
  Result := Bandera;
end;

end.
