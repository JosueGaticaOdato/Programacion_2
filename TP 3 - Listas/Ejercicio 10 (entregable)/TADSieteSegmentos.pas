unit TADSieteSegmentos;

interface

uses
  SysUtils, Tipos, Variants,
  //ListArray;
  //ListCursor;
  ListPointer;

const
  //Codigo con su correspondiente valor para cada numero
  Codigos : Array [0..9]
    of String = ('1111110','0110000','1101101','1111001',
              '0110011','1011011','1011111','1110000','1111111','1111011');

type
  Digital = Object
    private
      parteEntera: Lista;
      parteDecimal: Lista;
    public
      procedure cargar(numero: Extended);
      procedure cargarParteEntera(numero: Integer);
      procedure cargarParteDecimal(numero: Extended);
      function mostrarListas(): String;
      function recuperarParteEntera(): String;
      function recuperarParteDecimal(): String;
      function mostrarResultado(L: Lista): String;
      function suma(): Lista;
      function resta(): Lista;
      function multiplicacion(): Lista;
      function division(): Lista;
  End;

implementation

//Procedimiento que carga la parte decimal de un numero
procedure Digital.cargarParteDecimal(numero: Extended);
var
i: integer;
X: TipoElemento;
digital, ubicacion: String;
begin
  digital := numero.ToString; //Paso el numero a string
  parteDecimal.Crear(Cadena,length(digital)); //Creo la lista
  i := 3; //Inicializo en 3 (para evitar el 0,)
  while i <= length(digital) do
  begin
    ubicacion := digital[i]; //Obtengo la posicion de uno de los numeros
    X.Clave := Codigos[strtoint(ubicacion)]; //Obtengo el valor del numero en 7Segmentos y Lo cargo en la clave
    X.Valor1 := ubicacion; //Guardo el valor del numero
    parteDecimal.Agregar(X); //Agrego a la lista
    inc(i);
  end;
end;

//Procedimiento que carga la parte entera de un numero
procedure Digital.cargarParteEntera(numero: Integer);
var
i: integer;
X: TipoElemento;
digital, ubicacion: String;
begin
  digital := numero.ToString; //Paso el numero a string
  parteEntera.Crear(Cadena,length(digital));  //Creo la lista
  i := 1;  //Inicializo en 1 (ya que pensando a los strings como indices comienzan en 1)
  while i <= length(digital) do
  begin
    ubicacion := digital[i]; //Obtengo la posicion de uno de los numeros
    X.Clave := Codigos[strtoint(ubicacion)]; //Obtengo el valor del numero en 7Segmentos y Lo cargo en la clave
    X.Valor1 := ubicacion; //Guardo el valor del numero
    parteEntera.Agregar(X); //Agrego a la lista
    inc(i);
  end;
end;

//Procedimiento que realizar la carga de un numero a Siete Segmentos
procedure Digital.cargar(numero: Extended);
begin
  //Llamo a mis dos funciones, pasando el numero como parte decimal y parte entera
  cargarParteEntera(Trunc(numero));
  cargarParteDecimal(Frac(numero));
end;

//Procedimiento que muestra las dos listas
function Digital.mostrarListas(): String;
var
texto: String;
P: PosicionLista;
X: TipoElemento;
begin
  P := parteEntera.Comienzo;
  texto := 'numero 1: ('; //Primero recorro el numero uno
  while P <> nulo do
  begin
    X := parteEntera.Recuperar(P);
    texto := texto + vartostr(X.Clave) + ','; //Recupero clave y muestro
    P := parteEntera.Siguiente(P);
  end;

  texto := texto + ')' + #13#10 + 'numero 2: ('; //Sigo con el numero 2
  P := parteDecimal.Comienzo;
  while P <> nulo do
  begin
    X := parteDecimal.Recuperar(P);
    texto := texto + vartostr(X.Clave) + ','; //Recupero clave y muestro
    P := parteDecimal.Siguiente(P);
  end;
  texto := texto + ')';

  Result := texto;
end;

//Funcion que muestra el contenido de una lista
function Digital.mostrarResultado(L: Lista): String;
var
texto: String;
P: PosicionLista;
X: TipoElemento;
begin
  P := L.Comienzo;
  texto := 'Resultado: (';
  while P <> nulo do
  begin
    X := L.Recuperar(P);
    texto := texto + vartostr(X.Clave) + ','; //Recupero clave y muestro
    P := L.Siguiente(P);
  end;
  texto := texto + ')';

  Result := texto;
end;

//Funcion que recuperar el contenido de la lista de la parte entera
function Digital.recuperarParteEntera(): String;
var
PL1: PosicionLista;
V1: String;
X1: TipoElemento;
begin
  PL1 := ParteEntera.Comienzo;
  V1 := '';
  while PL1 <> Nulo do
  begin
    X1 := ParteEntera.Recuperar(PL1); //Recupero
    V1 := V1 + vartostr(X1.Valor1); //Concateno para armar el numero
    PL1 := ParteEntera.Siguiente(PL1); //Pido siguiente para seguir
  end;

  Result := V1;
end;

//Funcion que recuperar el contenido de la lista de la parte decimal
function Digital.recuperarParteDecimal(): String;
var
PL2: PosicionLista;
V2: String;
X2: TipoElemento;
begin
  PL2 := parteDecimal.Comienzo;
  V2 := '';
  while PL2 <> Nulo do
  begin
    X2 := parteDecimal.Recuperar(PL2); //Recupero
    V2 := V2 + vartostr(X2.Valor1); //Concateno para armar el numero
    PL2 := parteDecimal.Siguiente(PL2); //Pido siguiente para seguir
  end;

  Result := V2;
end;

//Funcion que pasa un numero a la forma "7 SEGMENTOS"
function pasarASieteSegmentos(numero: String): Lista;
var
i: integer;
X: TipoElemento;
digital, ubicacion: String;
L: Lista;
begin
  digital := numero; //Paso el numero a string
  L.Crear(Cadena,length(digital));  //Creo la lista
  i := 1;  //Inicializo en 1 (ya que pensando a los strings como indices comienzan en 1)
  while i <= length(digital) do
  begin
    ubicacion := digital[i]; //Obtengo la posicion de uno de los numeros
    X.Clave := Codigos[strtoint(ubicacion)]; //Obtengo el valor del numero en 7Segmentos y Lo cargo en la clave
    X.Valor1 := ubicacion; //Guardo el valor del numero
    L.Agregar(X); //Agrego a la lista
    inc(i);
  end;

  Result := L;
end;

//Funcion que realiza la suma
function Digital.suma: Lista;
var
V1,V2: String;
Resultado: String;
begin
  //Obtengo la parte entera y decimal
  V1 := recuperarParteEntera();
  V2 := recuperarParteDecimal();
  Resultado := (strtoint(V1) + strtoint(V2)).toString;
  Result := pasarASieteSegmentos(Resultado); //Sumo y retorno la nueva lista
end;

//Funcion que realiza la resta
function Digital.resta: Lista;
var
V1,V2: String;
Resultado: String;
begin
  //Obtengo la parte entera y decimal
  V1 := recuperarParteEntera();
  V2 := recuperarParteDecimal();
  Resultado := (strtoint(V1) - strtoint(V2)).toString;
  Result := pasarASieteSegmentos(Resultado); //resto y retorno la nueva lista
end;

//Funcion que realiza la multiplicacion
function Digital.multiplicacion: Lista;
var
V1,V2: String;
Resultado: String;
begin
  //Obtengo la parte entera y decimal
  V1 := recuperarParteEntera();
  V2 := recuperarParteDecimal();
  Resultado := (strtoint(V1) * strtoint(V2)).toString;
  Result := pasarASieteSegmentos(Resultado); //multiplico y retorno la nueva lista
end;

//Funcion que realiza la division
function Digital.division: Lista;
var
V1,V2: String;
Resultado: String;
begin
  //Obtengo la parte entera y decimal
  V1 := recuperarParteEntera();
  V2 := recuperarParteDecimal();
  if strtoint(V2) <> 0 then
  begin
    Resultado := (strtoint(V1) DIV strtoint(V2)).toString; //SOLO PARTE ENTERA
  end;
  Result := pasarASieteSegmentos(Resultado); //divido y retorno la nueva lista
end;

end.
