unit TADEjercicio5;

interface

uses
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  Ejercicio5 = Object
    private
      P: Pila;
    public
      procedure Definir_Tamaño_Pila(Tamaño: Integer);
      Function Mostrar_Pila(): String;
      procedure Cargar_Pila_Aleatoria(Tamaño: Integer);
      procedure Apilar_Pila_Origen(Auxiliar: Pila);
      function Apilas_entre_pilas(AUX1: Pila; AUX2: Pila): Pila;
      function Eliminar_Ocurrencias(C: TipoElemento):Ejercicio5;
  End;

implementation

procedure Ejercicio5.Definir_Tamaño_Pila(Tamaño: Integer);
begin
  P.Crear(Numero,Tamaño);
end;

function Ejercicio5.Mostrar_Pila;
begin
  Mostrar_Pila := P.RetornarClaves;
end;

procedure Ejercicio5.Apilar_Pila_Origen(Auxiliar: Pila);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesApilar;
    P.Apilar(X);
  end;
end;

procedure Ejercicio5.Cargar_Pila_Aleatoria(Tamaño: Integer);
begin
  P.LlenarClavesRandom(Tamaño, 1, 10);
end;

function Ejercicio5.Apilas_entre_pilas(AUX1: Pila; AUX2: Pila): Pila;
var X:TipoElemento;
begin
  while not AUX1.EsVacia do
  begin
    X := AUX1.Recuperar;
    AUX1.DesApilar;
    AUX2.Apilar(X)
  end;
  Apilas_entre_pilas := AUX2;
end;

//Complejidad algoritmica: Lineal
//.Creacion de 3 pilas auxiliares (1 devuelve la pila origen, 2 tiene el inversor, 3 es la que tengo que devolver)
//.Recorrer la pila original hasta que no este vacia
//.Cada vez que la clave enviada sea distinta a la de la pila origen, apila en auxiliar 2 y 3
//.Si es distinta, apilo solo en 1
//.La primera auxiliar se encargara de devolver tod a la pila origen
//.La segunda pila tiene el contenido sin las ocurrencias, pero invertida, es por eso que necesito un tercer auxiliar que me los coloque de forma correcta
//.Devuelta la tercera pila

function Ejercicio5.Eliminar_Ocurrencias(C:TipoElemento):Ejercicio5;
var PilaAuxiliar1, PilaAuxiliar2, PilaAuxiliar3: Ejercicio5;
  X: TipoElemento;
begin
  PilaAuxiliar1.P.Crear(P.DatoDeLaClave,P.SizeStack);
  PilaAuxiliar2.P.Crear(P.DatoDeLaClave,P.SizeStack);
  PilaAuxiliar3.P.Crear(P.DatoDeLaClave,P.SizeStack);
  while not P.EsVacia do
  begin
    X := P.Recuperar;
    if X.Clave <> C.Clave then
    begin
      PilaAuxiliar2.P.Apilar(X);
    end;
    PilaAuxiliar1.P.Apilar(X);
    P.DesApilar;
  end;
  Apilar_Pila_Origen(PilaAuxiliar1.P);
  PilaAuxiliar3.P := Apilas_entre_pilas(PilaAuxiliar2.P,PilaAuxiliar3.P);
  Result := PilaAuxiliar3;
end;

end.
