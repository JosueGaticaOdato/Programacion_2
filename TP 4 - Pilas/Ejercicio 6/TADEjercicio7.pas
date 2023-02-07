unit TADEjercicio7;

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
      procedure cargarPilaAleatoria(Tamaño: Integer);
      {procedure Apilar_Pila(P1: Pila;Auxiliar: Pila);}
      function Son_Iguales(P1,P2: MiPila):Boolean;
  End;

implementation

//Procedimiento qeu crea la pila dado un tamaño
procedure MiPila.crearPila(Tamaño: Integer);
begin
  P.Crear(Numero,Tamaño);
end;

//Funcion que muestra el contenido de la pila
function MiPila.mostrarPila;
begin
  mostrarPila := P.RetornarClaves;
end;

//Carga de la pila con valores aleatorios
procedure MiPila.cargarPilaAleatoria(Tamaño: Integer);
begin
  P.LlenarClavesRandom(Tamaño, 1, 10);
end;


{Complejida algoritmica lineal:
.Creo 2 pila auxiliar
.Recorro la pila 1 y recupero un elemento
.Cada vez que recupero un elemento de la pila 1, recorro toda la pila2
para comprobar si existe ese valor
.El ciclo corta si lo encontro o no existe
.Siempre recupero los valores originales de ambas pilas}

//Funcion que me dice si dos pilas son iguales sin importar sus posiciones, ni sus repeticiones
function MiPila.Son_Iguales(P1,P2: MiPila):Boolean;
var AUX1,AUX2: Pila;
  X: TipoElemento;
  Y: TipoElemento;
  isIguales, encontraPila2: Boolean;
begin
  //Creo las dos pilas auxiliares
  AUX1.Crear(Numero,P1.P.SizeStack);
  AUX2.Crear(Numero,P2.P.SizeStack);
  isIguales := True;
  while (not P1.P.EsVacia) and (isIguales) do //Mientras no llegue al final de la pila
  // y no haya comprobado que sean iguales
  begin
    X := P1.P.Recuperar; //Recupero el topes
    encontraPila2 := False;
    while (not P2.P.EsVacia) and (not encontraPila2) do //Recorro la segunda pila
    begin
      Y := P2.P.Recuperar;
      if X.Clave = Y.Clave then //Comparo ambos valores
      begin
        encontraPila2 := True;//Si son iguales, salgo del bucle de la pila 2 y vuelvo
        // a pedir otro elemento de la 1
      end
      else
      begin
        //Sino, tengo que seguir buscando: desapilo en la 2 pero guardo en un
        //auxiliar para no perder su contenido
        P2.P.DesApilar;
        AUX2.Apilar(Y);
      end;
      //Si la pila 2 esta vacia, quiere decir que me recorri todo y
      // no encontre ningun valor, entonces no son iguales
      if P2.P.EsVacia then
      begin
        isIguales := False;
      end;
    end;
    //Cada vez que termino un bucle de la pila 2,
    //desapilo en 1, guardo en un auxiliar 1 y recupero los valores de origen de 2
    P1.P.DesApilar;
    aux1.Apilar(X);
    P2.P.InterCambiar(AUX2,false);
  end;
  //Al final del bucle, recupero los valores de la pila 1 y devuelvo el resultado
  P1.P.InterCambiar(AUX1,false);
  Result := isIguales;
end;

end.
