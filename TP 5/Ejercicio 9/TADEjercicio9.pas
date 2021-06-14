unit TADEjercicio9;


interface

uses
  SysUtils,
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

const
  Arreglo : Array [1..20] of String = ('Ata','Nicolas','Aviva','Domingo','Azuza','Messi','Apa','Argentina','Afromorfa','Palmeras',
                'Nadan','Sopa','Neuquen','Celular','Nomon','Asado','Non','Reconocer','Solos','Somos') ;

type
  Ejercicio9 = Object
    private
      P: Pila;
    public
      procedure Definir_Tamaño_Pila(Tamaño: Integer);
      procedure Cargar_Palindromo();
      Function Mostrar_Pila(): String;
      procedure Apilar_Pila_Origen(Auxiliar: Pila);
      function Apilas_entre_pilas(AUX1: Pila; AUX2: Pila): Pila;
      function Es_Palindromo(): Boolean;
      function Generar_Pilas_Palindromo(): Pila;
  End;

implementation

procedure Ejercicio9.Definir_Tamaño_Pila(Tamaño: Integer);
begin
  P.Crear(Cadena,Tamaño);
end;

function Ejercicio9.Mostrar_Pila;
begin
  Mostrar_Pila := P.RetornarClaves;
end;

procedure Ejercicio9.Cargar_Palindromo;
var Palabra: String;
  i: Integer;
  X: TipoElemento;
begin
  Randomize;
  Palabra := Arreglo [Random(Length(Arreglo))];
  Definir_Tamaño_Pila(Length(Palabra));
  for i := Length(Palabra) downto 1 do
  begin
    X.Clave := Palabra[i];
    P.Apilar(X);
  end;
end;

procedure Ejercicio9.Apilar_Pila_Origen(Auxiliar: Pila);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesApilar;
    P.Apilar(X);
  end;
end;

function Ejercicio9.Apilas_entre_pilas(AUX1: Pila; AUX2: Pila): Pila;
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

function Ejercicio9.Generar_Pilas_Palindromo(): Pila;
var AUX1,AUX2: Pila;
  X: TipoElemento;
begin
  AUX1.Crear(Cadena,P.SizeStack);
  AUX2.Crear(Cadena,P.SizeStack);
  while not P.EsVacia do
  begin
    X := P.Recuperar;
    AUX1.Apilar(X);
    AUX2.Apilar(X);
    P.DesApilar;
  end;
  Apilar_Pila_Origen(AUX1);
  Result := AUX2;
end;


function Ejercicio9.Es_Palindromo():Boolean;
var AUX1,AUX2: Pila;
  Palindromo: Boolean;
  X,Y : TipoElemento;
begin
  AUX1.Crear(Cadena,P.SizeStack);
  AUX2.Crear(Cadena,P.SizeStack);
  AUX2 := Generar_Pilas_Palindromo();
  Palindromo := True;
  while (not P.EsVacia) and (Palindromo) do
  begin
    X := P.Recuperar;
    Y := AUX2.Recuperar;
    if UpperCase(X.Clave) <> UpperCase(Y.Clave) then
    begin
      Palindromo := False;
    end
    else
    begin
      P.DesApilar;
      AUX2.DesApilar;
      AUX1.Apilar(X);
    end;
  end;
  Apilar_Pila_Origen(AUX1);
  Result := Palindromo;
end;

end.
