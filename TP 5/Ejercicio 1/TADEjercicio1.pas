unit TADEjercicio1;

interface

uses
  Tipos,
  StackArray;
  //StackCursor;
  //StackPointer;

type
  Ejercicio1 = Object
    private
      P: Pila;
    public
      procedure Definir_Tamaño_Pila(Tamaño: Integer);
      Function Mostrar_Pila(): String;
      procedure Cargar_Pila_Aleatoria(Tamaño: Integer);
      function Buscar_Clave(X: TipoElemento): Boolean;
      procedure Apilar_Pila_Origen(Auxiliar: Pila);
      procedure Colocar_en_el_fondo(X: TipoElemento);
  End;

implementation

procedure Ejercicio1.Definir_Tamaño_Pila(Tamaño: Integer);
begin
  P.Crear(Numero,Tamaño);
end;

function Ejercicio1.Mostrar_Pila;
begin
  Mostrar_Pila := P.RetornarClaves;
end;

procedure Ejercicio1.Apilar_Pila_Origen(Auxiliar: Pila);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesApilar;
    P.Apilar(X);
  end;
end;

procedure Ejercicio1.Cargar_Pila_Aleatoria(Tamaño: Integer);
begin
  P.LlenarClavesRandom(Tamaño, 1, 10);
end;

function Ejercicio1.Buscar_Clave(X: TipoElemento): Boolean;
var Y: TipoElemento;
  Encontrado: Boolean;
  PAuxiliar : Pila;
begin
  Encontrado := False;
  PAuxiliar.Crear(Numero,P.SizeStack);
  while not P.EsVacia and (not Encontrado) do
  begin
    Y := P.Recuperar;
    if X.Clave = y.Clave then
    begin
      Encontrado := True;
    end
    else
    begin
      PAuxiliar.Apilar(Y);
      P.DesApilar;
    end;
  end;
  Apilar_Pila_Origen(PAuxiliar);
  Result := Encontrado;
end;

procedure Ejercicio1.Colocar_en_el_fondo(X: TipoElemento);
var PAuxiliar: Pila;
  Y: TipoElemento;
begin
  while not P.EsVacia do
  begin
    Y := P.Recuperar;
    P.DesApilar;
    PAuxiliar.Apilar(Y);
  end;
  P.Apilar(X);
  Apilar_Pila_Origen(PAuxiliar);
end;

end.
