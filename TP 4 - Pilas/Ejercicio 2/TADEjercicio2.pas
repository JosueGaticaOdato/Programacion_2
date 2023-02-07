unit TADEjercicio2;

interface

uses
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  MiPila = Object
    private
      P: Pila;
    public
      procedure crearPila(Tamaño: Integer);
      Function mostrarPila(): String;
      procedure cargarPilasAleatoria(Tamaño: Integer);
      procedure cargarIguales(var P1, P2: MiPila;Tamaño: Integer);
      procedure recuperarPilaOrigen(P1,P2: MiPila;Auxiliar: Pila);
      function sonIguales(P1,P2: MiPila): Boolean;
  End;

implementation

//Procedure que crea la pila dado un tamaño
procedure MiPila.crearPila(Tamaño: Integer);
begin
  P.Crear(Numero,Tamaño);
end;

//Funcion que muestra el contenido de la pila
function MiPila.mostrarPila;
begin
  mostrarPila := P.RetornarClaves;
end;

//Procedure que carga la pila de forma aleatoria
procedure MiPila.cargarPilasAleatoria(Tamaño: Integer);
begin
  P.LlenarClavesRandom(Tamaño, 1, 10);
end;

//Procedimiento que carga dos pilas iguales
procedure MiPila.cargarIguales(var P1, P2: MiPila; Tamaño: Integer);
var Contenedor: Integer;
  X: TipoElemento;
  I: Integer;
begin
  P1.P.Crear(Numero,Tamaño); //Creo ambas pilas
  P2.P.Crear(Numero,Tamaño);
  X.TipoDatoClave(Numero);
  Randomize;
  for I := 1 to P1.P.SizeStack do //Recorro hasta el final
  begin
    Contenedor := Random(10);
    X.Clave := Contenedor;  //Cargo en ambas el mismo contenido
    P1.P.Apilar(X);
    P2.P.Apilar(X);
  end;
end;

//Procedimiento que me devuelve el contenido de las pilas originales
procedure MiPila.recuperarPilaOrigen(P1,P2: MiPila;Auxiliar: Pila);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do //Recorro la auxiliar hasta que sea vacia
  begin
    X := Auxiliar.Recuperar; //Recuper de la auxiliar
    Auxiliar.DesApilar; //Desapilo
    P1.P.Apilar(X); //Apilo en mis dos pilas origen
    P2.P.Apilar(X);
  end;
end;

//Funcion que me dice si dos pilas son iguales (con 1 sola pila aux)
//Complejida algoritmica lineal:
//.Creo la pila auxiliar
//.Recupero los valores del top
//.Comparo si son iguales
//.Si lo son, desapilo ambas y apilo en el auxiliar
//.Si no lo son, directamente devuelvo falso
//.Al final, dejo ambas pilas como estaban
function MiPila.sonIguales(P1,P2: MiPila): Boolean;
var PAuxiliar: Pila;
  Iguales: Boolean;
  X: TipoElemento;
  Y: TipoElemento;
begin
  Iguales := True;
  PAuxiliar.Crear(Numero,P1.P.SizeStack); //Creo la pila auxiliar
  while ( not P1.P.EsVacia or not P2.P.EsVacia) and (Iguales) do //Mientras no este vacia
  //una de las dos pilas y todavia sean iguales
  begin
    X := P1.P.Recuperar;
    Y := P2.P.Recuperar;
    //Recupero el contenido de ambas y comparo sus claves
    if X.Clave <> Y.Clave then
    begin
      Iguales := False; //Si son distintas, corto el bucle
    end
    else
    begin
      //Sino, desapilo en ambas y apilo en la auxiliar
      P1.P.DesApilar;
      P2.P.DesApilar;
      PAuxiliar.Apilar(X);
    end;
  end;
  //Al final devuelvo a la normalidad las pilas
  recuperarPilaOrigen(P1,P2,PAuxiliar);
  Result := Iguales;
end;

end.
