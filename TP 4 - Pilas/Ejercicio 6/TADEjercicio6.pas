unit TADEjercicio6;

interface

uses
  SysUtils,
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  Ejercicio6 = Object
    private
      P: Pila;
    public
      procedure Definir_Tamaño_Pila(Tamaño: Integer);
      Function Mostrar_Pila(): String;
      procedure Cargar_Pila_Aleatoria(Tamaño: Integer);
      procedure Apilar_Pila_Origen(Auxiliar: Pila);
      procedure Insertar(Valor, Posicion: Integer);
  End;

implementation

procedure Ejercicio6.Definir_Tamaño_Pila(Tamaño: Integer);
begin
  P.Crear(Numero,Tamaño);
end;

function Ejercicio6.Mostrar_Pila;
begin
  Mostrar_Pila := P.RetornarClaves;
end;

procedure Ejercicio6.Apilar_Pila_Origen(Auxiliar: Pila);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesApilar;
    P.Apilar(X);
  end;
end;

procedure Ejercicio6.Cargar_Pila_Aleatoria(Tamaño: Integer);
begin
  P.LlenarClavesRandom(Tamaño, 1, 10);
end;

procedure Ejercicio6.Insertar(Valor: Integer; Posicion: Integer);
var X,Y: TipoElemento;
  Contador: Integer;
  Aux: Pila;
begin
  Aux.Crear(Numero,P.SizeStack + 1);
  X.Inicializar(Numero,'');
  X.Clave := Valor;
  Contador := 1;
  while not P.EsVacia do
  begin
    if Contador <> Posicion then
    begin
      Y := P.Recuperar;
      P.DesApilar;
      Aux.Apilar(Y);
    end
    else
    begin
      Aux.Apilar(X);
    end;
    Contador := Contador + 1;
  end;
  P.Crear(Numero, P.SizeStack + 1);
  Apilar_Pila_Origen(Aux);
end;
end.
