unit TADEjercicio1;

interface

uses
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

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
      procedure Eliminar_Ocurrencias(X: TipoElemento);
      procedure Cambiar_Tope_y_Fondo(X: TipoElemento);
      procedure Duplicar;
      function Contar(): Integer;
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
  PAuxiliar.Crear(Numero,P.SizeStack);
  while not P.EsVacia do
  begin
    Y := P.Recuperar;
    P.DesApilar;
    PAuxiliar.Apilar(Y);
  end;
  P.Crear(Numero, P.SizeStack + 1);
  P.Apilar(X);
  Apilar_Pila_Origen(PAuxiliar);
end;

procedure Ejercicio1.Eliminar_Ocurrencias(X: TipoElemento);
var PAuxiliar: Pila;
    Y: TipoElemento;
begin
  PAuxiliar.Crear(Numero,P.SizeStack);
  while not P.EsVacia do
  begin
    Y := P.Recuperar;
    if Y.Clave <> X.Clave then
    begin
      PAuxiliar.Apilar(Y);
    end;
    P.DesApilar;
  end;
  Apilar_Pila_Origen(PAuxiliar);
end;

procedure Ejercicio1.Cambiar_Tope_y_Fondo(X: TipoElemento);
var PAuxiliar: Pila;
    Y: TipoElemento;
begin
  PAuxiliar.Crear(Numero,P.SizeStack);
  P.DesApilar;
  P.Apilar(X);
  while not P.EsVacia do
  begin
    Y := P.Recuperar;
    PAuxiliar.Apilar(Y);
    P.DesApilar;
  end;
  PAuxiliar.DesApilar;
  PAuxiliar.Apilar(X);
  Apilar_Pila_Origen(PAuxiliar);
end;

procedure Ejercicio1.Duplicar;
var PAuxiliar: Pila;
    Y: TipoElemento;
begin
  PAuxiliar.Crear(Numero,P.SizeStack * P.SizeStack);
  while not P.EsVacia do
  begin
    Y := P.Recuperar;
    PAuxiliar.Apilar(Y);
    PAuxiliar.Apilar(Y);
    P.DesApilar;
  end;
  P.Crear(Numero,P.SizeStack * P.SizeStack);
  Apilar_Pila_Origen(PAuxiliar);
end;

function Ejercicio1.Contar(): Integer;
var PAuxiliar: Pila;
    Y: TipoElemento;
    Contador: Integer;
begin
  Contador := 0;
  PAuxiliar.Crear(Numero,P.SizeStack);
  while not P.EsVacia do
  begin
    Contador := Contador + 1;
    Y := P.Recuperar;
    PAuxiliar.Apilar(Y);
    P.DesApilar;
  end;
  Apilar_Pila_Origen(PAuxiliar);
  Result := Contador;
end;

end.
