unit TADEjercicio9;


interface

uses
  SysUtils,
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  Stack = Object
    private
      //Atributos
      P: Pila;
    public
      //Comportamiento
      procedure crearPila(Tamaño: Integer);
      procedure cargarPalabra(Palabra: String);
      Function mostrarPila(): String;
      function esPalindromo(): Boolean;
      function generarPilaPalindromo(): Pila;
  End;

implementation

//Procedimiento que crea la pila correspondiente
procedure Stack.crearPila(Tamaño: Integer);
begin
  P.Crear(Cadena,Tamaño);
end;

//Funcion que muestra la pila
function Stack.mostrarPila;
begin
  mostrarPila := P.RetornarClaves;
end;

//Procedimiento que carga cualquier string en una pila
procedure Stack.cargarPalabra(Palabra: String);
var  i: Integer;
  X: TipoElemento;
begin
  crearPila(Length(Palabra));
  //Recorro de atras en adelante la palabra
  for i := Length(Palabra) downto 1 do
  begin
    //Voy colocando la letra y apilo en la pila
    X.Clave := Palabra[i];
    P.Apilar(X);
  end;
end;

//Funcion que crea una pila igual a la pila origen pero al revez,
// para realizar la comparacion
function Stack.generarPilaPalindromo(): Pila;
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
  P.InterCambiar(AUX1,false);
  Result := AUX2;
end;

{Complejidad: O(n): Lineal
.Creacion de dos pilas auxiliares, una sera de soporte para recuperar y
 la otra para comparar
.Recuperacion del contenido de la pila origen y la Auxiliar2
.Comparo ambos contenido, si son iguales continuo, desapilando la original y la AUX2
.En caso de que sean distintas, directamente devuelvo falso
.Al final, uso el contenido de AUX1 para recuperar todo el contenido de la pila original}

//Funcion que me devuelve si una palabra es o no palindromo
function Stack.esPalindromo():Boolean;
var AUX1,AUX2: Pila;
  Palindromo: Boolean;
  X,Y : TipoElemento;
begin
  //Creacion de las dos pilas auxiliares
  AUX1.Crear(Cadena,P.SizeStack);
  AUX2.Crear(Cadena,P.SizeStack);
  //Creo la pila palindromo para comparar
  AUX2 := generarPilaPalindromo();
  Palindromo := True;
  //Mientras no recorra toda la pila y no halla distintas letras, comparo
  while (not P.EsVacia) and (Palindromo) do
  begin
    //En X recupero la pila origen, en Y recupero la pila auxiliar, que tiene el mismo contenido que la origen pero al revez
    X := P.Recuperar;
    Y := AUX2.Recuperar;
    //Comparo (El uppercase es para poner ambas letras en mayuscula y
    //evitar problemas con eso)
    if UpperCase(X.Clave) <> UpperCase(Y.Clave) then
    begin
      Palindromo := False;
    end
    else
    begin
      //Voy a la siguiente
      P.DesApilar;
      AUX2.DesApilar;
      //En AUX1 apilo para luego recuperar lo que tengo en la original
      AUX1.Apilar(X);
    end;
  end;
  //Devuelvo el contenido de la pila original
  P.InterCambiar(AUX1,false);
  Result := Palindromo;
end;

end.
