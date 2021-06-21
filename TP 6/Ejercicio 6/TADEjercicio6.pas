unit TADEjercicio6;


interface

uses
  Tipos,
  //QueuesArrayNCMejorada;
  //QueuesCursor;
  QueuesPointer;

const
  //Enumerado1 = (A, B, E, D, H, A, Z);
  Arreglo1 : Array [1..7] of String = ('A','B','E','D','H','A','Z');
  Arreglo2 : Array [1..6] of String = ('B','A','D','H','Z','E');

type
  Ejercicio6 = Object
    private
      C: Cola;
    Public
      procedure Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
      procedure Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
      procedure Cargar_Ejemplo1();
      procedure Cargar_Ejemplo2();
      function Mostrar_Cola():String;
      procedure Apilar_Cola_Origen(Auxiliar: Cola);
      procedure Apilar_Cola(var C1, Auxiliar: Cola);
      function Son_Iguales(Cola1,Cola2: Ejercicio6): Boolean;
  End;

implementation

procedure Ejercicio6.Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
begin
  C.Crear(Tipo_Clave, Tamaño);
end;

procedure Ejercicio6.Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
begin
  C.LLenarClavesRandom(Tamaño, RangoA, RangoB);
end;

function Ejercicio6.Mostrar_Cola;
begin
  Mostrar_Cola := C.RetornarClaves;
end;

procedure Ejercicio6.Apilar_Cola_Origen(Auxiliar: Cola);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesEncolar;
    C.Encolar(X);
  end;
end;

procedure Ejercicio6.Apilar_Cola(var C1, Auxiliar: Cola);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesEncolar;
    C1.Encolar(X);
  end;
end;

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

function Ejercicio6.Son_Iguales(Cola1,Cola2: Ejercicio6): Boolean;
var AUX2: Cola;
  X,Y: TipoElemento;
  Bandera1,Bandera2: Boolean;
begin
  Bandera1 := True;
  while (not Cola1.C.EsVacia) and (Bandera1) do
  begin
    X := Cola1.C.Recuperar;
    Bandera2 := True;
    AUX2.Crear(Cola2.C.DatoDeLaClave,Cola2.C.SizeQueue);
    while not Cola2.C.EsVacia and (Bandera2) do
    begin
      Y := Cola2.C.Recuperar;
      if X.Clave = Y.Clave then
      begin
        Bandera2 := False;
      end
      else
      begin
        Cola2.C.DesEncolar;
        AUX2.Encolar(Y);
      end;
    end;
    if not Bandera2 then
    begin
      Apilar_Cola(Cola2.C,AUX2);
      Cola1.C.DesEncolar;
    end
    else
    begin
      Bandera1 := False;
    end;
  end;
  Result := Bandera1;
end;
end.
