unit TADEjercicio1;

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
      procedure Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
      procedure Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
      function Mostrar_Cola():String;
      procedure Apilar_Cola_Origen(Auxiliar: Cola);
      function Contar_Elementos(): Integer;
      function Chequear_Elemento(Elemento: TipoElemento): Boolean;
      procedure Agregar(Elemento: TipoElemento; Posicion: Integer);
      procedure Eliminar(Elemento: TipoElemento);
      function Copia(): Ejercicio1;
      procedure Concatenar(var C1: Ejercicio1);
      //function Invertir(): Ejercicio1;


  End;

implementation

procedure Ejercicio1.Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
begin
  C.Crear(Tipo_Clave, Tamaño);
end;

procedure Ejercicio1.Cargar_Aleatorio(Tamaño, RangoA, RangoB: Integer);
begin
  C.LLenarClavesRandom(Tamaño, RangoA, RangoB);
end;

function Ejercicio1.Mostrar_Cola;
begin
  Mostrar_Cola := C.RetornarClaves;
end;

procedure Ejercicio1.Apilar_Cola_Origen(Auxiliar: Cola);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesEncolar;
    C.Encolar(X);
  end;
end;

function Ejercicio1.Contar_Elementos;
var AUX1: Cola;
  X: TipoElemento;
  Contador: Integer;
begin
  Contador := 0;
  while not C.EsVacia do
  begin
    X := C.Recuperar;
    C.DesEncolar;
    AUX1.Encolar(X);
    Contador := Contador + 1;
  end;
  Apilar_Cola_Origen(AUX1);
  Result := Contador;
end;

function Ejercicio1.Chequear_Elemento(Elemento: TipoElemento): Boolean;
var AUX1: Cola;
  Bandera: Boolean;
  X: TipoElemento;
begin
  Aux1.Crear(Numero,C.SizeQueue);
  Bandera := False;
  while (not C.EsVacia) and (not Bandera) do
  begin
    X := C.Recuperar;
    if X.Clave <> Elemento.Clave then
    begin
      C.DesEncolar;
      AUX1.Encolar(X);
    end
    else
    begin
      Bandera := True;
    end;
  end;
  Apilar_Cola_Origen(AUX1);
  Result := Bandera;
end;

procedure Ejercicio1.Agregar(Elemento: TipoElemento; Posicion: Integer);
var AUX1: Cola;
  X: TipoElemento;
  ContadorPosicion: Integer;
begin
  Aux1.Crear(Numero,C.SizeQueue + 1);
  ContadorPosicion := 1;
  while (not C.EsVacia)do
  begin
    if ContadorPosicion = Posicion then
    begin
      AUX1.Encolar(Elemento);
    end
    else
    begin
      X := C.Recuperar;
      C.DesEncolar;
      AUX1.Encolar(X);
    end;
    ContadorPosicion := ContadorPosicion + 1;
  end;
  C.Crear(Numero, C.SizeQueue + 1);
  Apilar_Cola_Origen(AUX1);
end;

procedure Ejercicio1.Eliminar(Elemento: TipoElemento);
var AUX1: Cola;
  X: TipoElemento;
begin
  Aux1.Crear(Numero,C.SizeQueue);
  while (not C.EsVacia)do
  begin
    X := C.Recuperar;
    if X.Clave = Elemento.Clave then
    begin
      C.DesEncolar;
    end
    else
    begin
      C.DesEncolar;
      AUX1.Encolar(X);
    end;
  end;
  C.Crear(Numero, C.SizeQueue - 1);
  Apilar_Cola_Origen(AUX1);
end;

function Ejercicio1.Copia():Ejercicio1;
var AUX1: Cola;
  AUX2: Ejercicio1;
  X: TipoElemento;
begin
  Aux1.Crear(Numero,C.SizeQueue);
  Aux2.C.Crear(Numero,C.SizeQueue);
  while (not C.EsVacia)do
  begin
    X := C.Recuperar;
    C.DesEncolar;
    AUX1.Encolar(X);
    AUX2.C.Encolar(X);
  end;
  C.Crear(Numero, C.SizeQueue);
  Apilar_Cola_Origen(AUX1);
  Result := AUX2;
end;

procedure Ejercicio1.Concatenar(var C1: Ejercicio1);
var AUX1: Cola;
  X: TipoElemento;
  Tamaño: Integer;
begin
  Tamaño := C1.C.SizeQueue + c.SizeQueue;
  AUX1.Crear(Numero,Tamaño);
  while not C.EsVacia do
  begin
    X := C.Recuperar;
    C.DesEncolar;
    AUX1.Encolar(X);
  end;
  while not C1.C.EsVacia do
  begin
    X := C1.C.Recuperar;
    C1.C.DesEncolar;
    AUX1.Encolar(X);
  end;
  C.Crear(Numero,Tamaño);
  Apilar_Cola_Origen(AUX1);
end;

//function Ejercicio1.Invertir():Ejercicio1;
//var AUX1: Cola;
//  AUX2: Ejercicio1;
//  X: TipoElemento;
//begin
//  Aux1.Crear(Numero,C.SizeQueue);
//  Aux2.C.Crear(Numero,C.SizeQueue);
//  while (not C.EsVacia)do
//  begin
//    X := C.Recuperar;
//    C.DesEncolar;
//    AUX1.Encolar(X);
//    AUX2.C.Encolar(X);
//  end;
//  C.Crear(Numero, C.SizeQueue);
//  Apilar_Cola_Origen(AUX1);
//  Result := AUX2;
//end;

end.
