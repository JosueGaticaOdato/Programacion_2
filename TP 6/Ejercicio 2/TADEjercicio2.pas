unit TADEjercicio2;

interface

uses
  Tipos,
  //QueuesArrayNCMejorada;
  //QueuesCursor;
  QueuesPointer;

type
  Ejercicio2 = Object
    private
      C: Cola;
    Public
      procedure Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
      procedure Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
      function Mostrar_Cola():String;
      procedure Apilar_Cola_Origen(Auxiliar: Cola; Cola1,Cola2: Cola);
      procedure Cargar_Iguales(var C1: Ejercicio2);
      function Son_Iguales(var C1, C2: Ejercicio2): Boolean; 
  End;

implementation

procedure Ejercicio2.Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
begin
  C.Crear(Tipo_Clave, Tamaño);
end;

procedure Ejercicio2.Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
begin
  C.LLenarClavesRandom(Tamaño, RangoA, RangoB);
end;

function Ejercicio2.Mostrar_Cola;
begin
  Mostrar_Cola := C.RetornarClaves;
end;

procedure Ejercicio2.Apilar_Cola_Origen(Auxiliar: Cola; Cola1,Cola2: Cola);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesEncolar;
    Cola1.Encolar(X);
    Cola2.Encolar(X);
  end;
end;

procedure Ejercicio2.Cargar_Iguales(var C1: Ejercicio2);
var
  i: Integer;
  X: TipoElemento;
begin
  Randomize;
  for i := 1 to C.SizeQueue do
  begin
    X.Clave := Random(10);
    C.Encolar(X);
    C1.C.Encolar(X);
  end;
end;

function Ejercicio2.Son_Iguales(var C1, C2: Ejercicio2): Boolean;
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
  Apilar_Cola_Origen(AUX1,C1.C,C2.C);
  Result := Bandera;
end;

end.
