unit TADEjercicio3;


interface

uses
  Tipos,
  //QueuesArrayNCMejorada;
  //QueuesCursor;
  QueuesPointer;

type
  Ejercicio3 = Object
    private
      C: Cola;
    Public
      procedure Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
      procedure Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
      function Mostrar_Cola():String;
      procedure Apilar_Cola_Origen(Auxiliar: Cola);
      function Eliminar_Repeticiones(Tamaño: Integer): Ejercicio3;
  End;

implementation

procedure Ejercicio3.Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
begin
  C.Crear(Tipo_Clave, Tamaño);
end;

procedure Ejercicio3.Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
begin
  C.LLenarClavesRandom(Tamaño, RangoA, RangoB);
end;

function Ejercicio3.Mostrar_Cola;
begin
  Mostrar_Cola := C.RetornarClaves;
end;

procedure Ejercicio3.Apilar_Cola_Origen(Auxiliar: Cola);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesEncolar;
    C.Encolar(X);
  end;
end;

function Ejercicio3.Eliminar_Repeticiones(Tamaño: Integer): Ejercicio3;
var AUX1: Ejercicio3;
  AUX2: Cola;
  X,Y,Z: TipoElemento;
begin
  AUX1.C.Crear(Numero,Tamaño);
  Z.Clave := 0;
  AUX1.C.Encolar(Z);
  AUX2.Crear(Numero,Tamaño);
  while not C.EsVacia do
  begin
    X := C.Recuperar;
    Y := AUX1.C.Recuperar;
    if (X.Clave <> Y.Clave)then
    begin
      if Y.Clave = 0 then
      begin
        AUX1.C.DesEncolar;
      end;
      AUX1.C.Encolar(X);
    end;
    C.DesEncolar;
    AUX2.Encolar(X);
  end;
  Apilar_Cola_Origen(AUX2);
  Result := AUX1;
end;

end.
