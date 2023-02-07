unit TADEjercicio6;

interface

uses
  SysUtils,
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
      procedure cargarPilaAleatoria(Tamaño: Integer);
      procedure Insertar(Valor, Posicion: Integer);
  End;

implementation

//Procedimiento que crea la pila dado un tamaño
procedure MiPila.crearPila(Tamaño: Integer);
begin
  P.Crear(Numero,Tamaño);
end;

//Funcion que muestra la pila
function MiPila.mostrarPila;
begin
  mostrarPila := P.RetornarClaves;
end;

//Procedimiento que carga la pila de forma aleatoria
procedure MiPila.cargarPilaAleatoria(Tamaño: Integer);
begin
  P.LlenarClavesRandom(Tamaño, 1, 10);
end;

{
Complejida algoritmica lineal:
.Creo la pila auxiliar
.Guardo en un tipo elemento mi valor a agregar
.Recorro la lista hasta llegar a su fin
.Comparo si coincide el contador con la posicion que quiero agregar el elemento
.Si coinciden, agrego el valor
.Sino, recuperar el tope de la origen y desapilo, y apilo en auxiliar
.Finalizado el bucle, aumento el tamaño de la pila origen y recupero su contenido
 usando intercambiar
 }

//Procedimiento que ingresa un valor a la pila dada una posicion
procedure MiPila.Insertar(Valor: Integer; Posicion: Integer);
var X,Y: TipoElemento;
  Contador: Integer;
  Aux: Pila;
begin
  Aux.Crear(Numero,P.SizeStack + 1); //Creo una pila auxiliar
  X.Inicializar(Numero,'');
  X.Clave := Valor; //Guardo en un tipo elemento el valor a agregar
  Contador := 1; //Creo el contador
  while not P.EsVacia do //Mientras la pila no este vacia
  begin
    if Contador <> Posicion then //Si el contador no coincide con la posicion
    begin
      Y := P.Recuperar; //Recupero, desapilo en origen y apilo en aux
      P.DesApilar;
      Aux.Apilar(Y);
    end
    else
    begin
      Aux.Apilar(X); //Sino, apilo mi valor en la auxiliar
    end;
    Contador := Contador + 1; //Siempre aumento el contador
  end;
  P.Crear(Numero, P.SizeStack + 1); //Creo nuevamente la pila origen con un espacio mas
  P.InterCambiar(Aux,false); //Intercambio con la pila auxiliar
end;
end.
