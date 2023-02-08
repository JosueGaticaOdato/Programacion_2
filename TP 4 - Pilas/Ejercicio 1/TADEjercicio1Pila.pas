unit TADEjercicio1Pila;

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
      procedure definirTamaño(Tamaño: Integer);
      Function mostrarPila(): String;
      procedure cargarAleatorio(Tamaño: Integer);
      function buscarClave(X: TipoElemento): Boolean;
      procedure colocarFondo(X: TipoElemento);
      procedure eliminarOcurrencias(X: TipoElemento);
      procedure cambiarTopeYFondo();
      procedure duplicar;
      function Contar(): Integer;
  End;

implementation

//Procedure que crea la Pila, pasandole un tamaño
procedure MiPila.definirTamaño(Tamaño: Integer);
begin
  P.Crear(Numero,Tamaño);
end;

//Funcion que muestra la pila
function MiPila.mostrarPila;
begin
  mostrarPila := P.RetornarClaves;
end;

//Funcion que llega la pila con valores random
procedure MiPila.cargarAleatorio(Tamaño: Integer);
begin
  P.LlenarClavesRandom(Tamaño, 1, 10);
end;

//Funcion que busca una clave dentro de la pila. Si existe devuelve veradero
function MiPila.buscarClave(X: TipoElemento): Boolean;
var Y: TipoElemento;
  Encontrado: Boolean;
  PAuxiliar : Pila;
begin
  Encontrado := False;
  PAuxiliar.Crear(Numero,P.SizeStack); //Creo la pila auxilar para no perder la pila origen
  while not P.EsVacia and (not Encontrado) do //Mientras la pila no este vacia y no halla encontra mi clave
  begin
    Y := P.Recuperar; //Recupero la clave del tope
    if X.Clave = y.Clave then //Comparo si es la que busco
    begin
      Encontrado := True; //Si es devuelvo true
    end
    else
    begin //Sino, apilo en la auxiliar y desapilo en la origen
      PAuxiliar.Apilar(Y);
      P.DesApilar;
    end;
  end;
  P.InterCambiar(PAuxiliar,false); //Recupero la pila origen
  Result := Encontrado;
end;

//Procedimiento que coloca un elemento en el fondo de la pila
procedure MiPila.colocarFondo(X: TipoElemento);
var PAuxiliar: Pila;
  Y: TipoElemento;
begin
  PAuxiliar.Crear(Numero,P.SizeStack); //Creo la pila auxiliar
  while not P.EsVacia do //Mientras no sea vacia
  begin
    //Recupero, desapilo en la origen y apilo en la auxiliar
    Y := P.Recuperar;
    P.DesApilar;
    PAuxiliar.Apilar(Y);
  end;
  P.Crear(Numero, P.SizeStack + 1); //Creo la pila aumentando su tamaño
  P.Apilar(X); //Apilo el ultimo valor que recupere
  P.InterCambiar(PAuxiliar,false); //Recupero la pila origen
end;

//Procedimiento que elimina todas las ocurrencias de una clave dentro de una pila
procedure MiPila.eliminarOcurrencias(X: TipoElemento);
var PAuxiliar: Pila;
    Y: TipoElemento;
begin
  PAuxiliar.Crear(Numero,P.SizeStack); //Creo la pila auxiliar
  while not P.EsVacia do  //Mientras no sea vacia
  begin
    Y := P.Recuperar;
    if Y.Clave <> X.Clave then //Si la clave es distinta apilo en la auxiliar
    begin
      PAuxiliar.Apilar(Y);
    end;
    P.DesApilar;
  end;
  P.InterCambiar(PAuxiliar,false); //Recupero la pila origen
end;

//Procedimiento que rota el tope y el fondo de la pila
procedure MiPila.cambiarTopeYFondo();
var PAuxiliar: Pila;
    Inicio,Fin: TipoElemento;
begin
  PAuxiliar.Crear(Numero,P.SizeStack); //Creo la auxiliar
  Inicio := P.Recuperar; //Desapilo el tope
  P.Desapilar;
  while not P.EsVacia do
  begin
    Fin := P.Recuperar;
    PAuxiliar.Apilar(Fin);
    P.DesApilar;
  end;
  PAuxiliar.DesApilar; //Desapilo la ultima que es el final de mi pila, que tiene que estar en mi inicio ahora
  PAuxiliar.Apilar(Inicio);
  P.InterCambiar(PAuxiliar,false); //Recupero la pila origen
  P.Apilar(Fin); //Apilo el final, que ahora sea el inicio
end;

//Procedimiento que duplica el contenido de una pila
procedure MiPila.duplicar;
var PAuxiliar: Pila;
    Y: TipoElemento;
begin
  PAuxiliar.Crear(Numero,P.SizeStack * P.SizeStack); //Creo la pila auxiliar con el doble del contenido de la origen
  while not P.EsVacia do //Mientras no sea vacia la pila origen
  begin
    Y := P.Recuperar;
    PAuxiliar.Apilar(Y); //Recupero el tope y apilo dos veces en la auxiliar
    PAuxiliar.Apilar(Y);
    P.DesApilar; //Desapilo
  end;
  P.Crear(Numero,P.SizeStack * P.SizeStack); //Creo la pila nuevamente
  P.InterCambiar(PAuxiliar,false); //Paso el contenido de la pila aux a la origen
end;

//Funcion que me dice la cantidad de elementos que tiene la pila
function MiPila.Contar(): Integer;
var PAuxiliar: Pila;
    Y: TipoElemento;
    Contador: Integer;
begin
  Contador := 0;
  PAuxiliar.Crear(Numero,P.SizeStack);
  while not P.EsVacia do
  begin
    Contador := Contador + 1; //Sumo el contador, cada que vez entro al bucle para saber la cantidad de elementos
    Y := P.Recuperar;
    PAuxiliar.Apilar(Y);
    P.DesApilar;
  end;
  P.InterCambiar(PAuxiliar,false); //Paso el contenido de la pila aux a la origen
  Result := Contador;
end;

end.
