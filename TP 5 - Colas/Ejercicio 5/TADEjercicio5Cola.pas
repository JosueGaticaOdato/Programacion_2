unit TADEjercicio5Cola;

interface

uses
  Tipos,
  //QueuesArrayNCMejorada;
  //QueuesCursor;
  QueuesPointer;

type
  Ejercicio5Cola = Object
    private
      C: Cola;
    Public
      procedure Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
      procedure Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
      function Mostrar_Cola():String;
      procedure Apilar_Cola_Origen(Auxiliar: Cola);
  End;

implementation

procedure Ejercicio5Cola.Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
begin
  C.Crear(Tipo_Clave, Tamaño);
end;

procedure Ejercicio5Cola.Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
begin
  C.LLenarClavesRandom(Tamaño, RangoA, RangoB);
end;

function Ejercicio5Cola.Mostrar_Cola;
begin
  Mostrar_Cola := C.RetornarClaves;
end;

procedure Ejercicio5Cola.Apilar_Cola_Origen(Auxiliar: Cola);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesEncolar;
    C.Encolar(X);
  end;
end;

end.
