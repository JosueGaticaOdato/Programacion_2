unit TADEjercicio7;

interface

uses
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  Ejercicio7 = Object
    private
      P: Pila;
    public
      procedure Definir_Tamaño_Pila(Tamaño: Integer);
      Function Mostrar_Pila(): String;
      procedure Cargar_Pila_Aleatoria(Tamaño: Integer);
      procedure Apilar_Pila(P1: Pila;Auxiliar: Pila);
      function Son_Iguales(P1,P2: Ejercicio7):Boolean;
  End;

implementation

procedure Ejercicio7.Definir_Tamaño_Pila(Tamaño: Integer);
begin
  P.Crear(Numero,Tamaño);
end;

function Ejercicio7.Mostrar_Pila;
begin
  Mostrar_Pila := P.RetornarClaves;
end;

procedure Ejercicio7.Apilar_Pila(P1: Pila;Auxiliar: Pila);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesApilar;
    P1.Apilar(X);
  end;
end;

procedure Ejercicio7.Cargar_Pila_Aleatoria(Tamaño: Integer);
begin
  P.LlenarClavesRandom(Tamaño, 1, 10);
end;

function Ejercicio7.Son_Iguales(P1,P2: Ejercicio7):Boolean;
var AUX1,AUX2: Pila;
  X: TipoElemento;
  Y: TipoElemento;
  Listo1, Listo2: Boolean;
begin
  AUX1.Crear(Numero,P1.P.SizeStack);
  AUX2.Crear(Numero,P2.P.SizeStack);
  Listo1 := True;
  while (not P1.P.EsVacia) and (Listo1) do
  begin
    X := P1.P.Recuperar;
    Listo2 := False;
    while (not P2.P.EsVacia) and (not Listo2) do
    begin
      Y := P2.P.Recuperar;
      if X.Clave = Y.Clave then
      begin
        Listo2 := True;
      end
      else
      begin
        P2.P.DesApilar;
        AUX2.Apilar(Y);
      end;
    if P2.P.EsVacia then
    begin
      Listo1 := False;
    end;
    end;
    P1.P.DesApilar;
    aux1.Apilar(X);
    Apilar_Pila(P2.P,AUX2);
  end;
  Apilar_Pila(P1.P,AUX1);
  Result := Listo1;
end;

end.
