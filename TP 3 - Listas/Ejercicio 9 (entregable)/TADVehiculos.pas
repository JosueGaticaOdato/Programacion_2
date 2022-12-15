unit TADVehiculos;

interface

uses
  Tipos,
  //ListArray;
  ListPointer;
  //ListCursor;

const
  cantElemMax = 10; //Cantidad maxima de vehiculos
  nError = -1;

type
  //Record que contiene los datos pertenecientes a la multa
  TMulta = Record
    Estado : string;
    Importe : integer;
    Fecha : TDate;
  End;
  //Puntero a la lista
  puntLM = ^Lista;

  //TAD
  Vehiculos = Object
  Private
    //Atributos
    L: Lista;
    nroMulta: integer;
    function getNumMulta() : integer;
    function getListaMultas(posAuto: posicionLista) : puntLM;
    function buscarAuto(Patente: string) : posicionLista;
  Public
    //Comportamiento
    procedure inicializarLista(tipoClave:tipoDatosClave;cantElem:integer);
    function guardarAuto(Patente: string) : Errores;
    function insertarMulta(Patente,Estado: string;Importe: integer;Fecha:TDate) : Errores;
    function mostrarLista() : string;
    function totalMultas(Patente: string) : integer;
    function fechaMulta(Patente: string;masAntigua:boolean) : tipoElemento;
    function cantMultasMayor() : string;
    function mayorDeuda() : string;
    function sinDeuda() : string;
    function validarPatente(patente: string) : boolean;
  End;

implementation


//Funcion que me dice cual es el vehiculo sin deudas, devolviendo un string
//con la patente de dicho vehiculo
//Complejidad O(n), Lineal: Recorre hasta encontrar el primero
function Vehiculos.sinDeuda() : string;
var elemAuto: tipoElemento;
    Patente: string;
    posAuto: posicionLista;
    Encontrado: boolean;
begin
  Encontrado := False;
  posAuto := L.Comienzo;
  //devuelve el primer auto sin deuda
  //Mientras no exista una posicion y no halla encontrado el auto, busco
  while (posAuto <> Nulo) and (not Encontrado) do begin
    elemAuto := L.Recuperar(posAuto);
    Patente := elemAuto.Clave;
    //Si el total de multas es cero, quiere decir que ese no tiene deudas
    if totalMultas(Patente) = 0 then begin
      Encontrado := True;
    end
    else begin
      posAuto := L.Siguiente(posAuto);
    end;
  end;
  //En caso de que no exita, devuelve Error
  if not Encontrado then Patente := 'CError';
  if L.Comienzo = Nulo then Patente := 'Vacia';

  Result := Patente;
end;


//Funcion que devuelve el vehiculo con mayor deuda
//recorre lista de autos y lista de multas y suma importe de multas
//pendientes, devuelve el último con mayor deuda
//Complejidad O(n), Lineal: Recorrer ambas listas, contando la cantidad de multas en un sumador y comparando si es mayor al anterior
function Vehiculos.mayorDeuda() : string;
var posAuto, posMulta: posicionLista;
    elemAuto, elemMulta: tipoElemento;
    LM: ^Lista;
    Sumador, deudaMayor: integer;
    mayorDeudor : string;
    datosMulta: ^TMulta;
    Encontrado: boolean;
begin
  Encontrado := False;
  deudaMayor := 0;
  mayorDeudor := 'Vacia';
  posAuto := L.Comienzo;
  //Mientras no agarre una posicion vacia de la lista de autos, recorro
  while posAuto <> Nulo do begin
    LM := getListaMultas(posAuto);
    posMulta := LM.Comienzo;
    Sumador := 0;
    //Mientras no exista una posicion en la lista de multas, recorro
    while posMulta <> Nulo do begin
      Encontrado := True;
      elemMulta := LM.Recuperar(posMulta);
      datosMulta := elemMulta.Valor2;
      //Recupero los importes y los pongo en el sumador
      Sumador := Sumador  + datosMulta^.Importe;
      posMulta := LM.Siguiente(posMulta);
    end;
    if (LM.Comienzo = Nulo) and (not Encontrado) then mayorDeudor := 'CError';

    //Si el sumador de ese auto es mayor a la deuda mayor del auto anterior, cambio el auto con mayor deuda
    if Sumador > deudaMayor then begin
      deudaMayor := Sumador;
      elemAuto := L.Recuperar(posAuto);
      mayorDeudor := elemAuto.Clave;
    end;
    posAuto := L.Siguiente(posAuto);
  end;
  //Devuelvo el auto con mayor deuda
  Result := mayorDeudor;

end;

//Funcion que devuelve el auto con mayor cantidad de infracciones
//Recorre la lista de autos y la de multas y devuelve la patente con mas multas
//totales (los tres estados)
//Complejidad O(n), Lineal: Recorrer ambas listas, contando la cantidad de multas en un contador y comparando si es mayor al anterior
function Vehiculos.cantMultasMayor() : string;
var posAuto, posMulta: posicionLista;
    elemAuto, elemMulta: tipoElemento;
    LM: ^Lista;
    cantMultas, mayorCantMultas: integer;
    autoInfractor: string;
    datosMulta: ^TMulta;
    Encontrado: boolean;
begin
  Encontrado := False;
  cantMultas := 0;
  mayorCantMultas := 0;
  autoInfractor := 'Vacia';
  posAuto := L.Comienzo;
  //Mientras no encuentre una posicion que no exista, busco
  while posAuto <> Nulo do begin
    LM := getListaMultas(posAuto);
    posMulta := LM.Comienzo;
    //Mientas no exista una posicion vacia en la lista de multas, busco
    while posMulta <> Nulo do begin
      Encontrado := True;
      elemMulta := LM.Recuperar(posMulta);
      datosMulta := elemMulta.Valor2;
      //Si la multa es mayor que 0, aumento el contador de multas y voy al siguiente
      if datosMulta.Importe <> 0 then cantMultas := cantMultas + 1;
      posMulta := LM.Siguiente(posMulta);
    end;
    if (LM.Comienzo = Nulo) and (not Encontrado) then autoInfractor := 'CError';
    //Si la cantidad de multas de ese auto es mayor a el total anterior, cambio el mayor
    if cantMultas > mayorCantMultas then begin
      mayorCantMultas := cantMultas;
      elemAuto := L.Recuperar(posAuto);
      autoInfractor := elemAuto.Clave;
    end;
    posAuto := L.Siguiente(posAuto);
  end;
  //Devuelvo el auto infractor
  Result := autoInfractor;
end;


//Funcion que devuelve la fecha, ya sea mas antigua o mas reciente) de la multa de un vehiculo
//devuelve un tipo elemento con la fecha (reciente o antigua) y una bandera
//por si no hay fecha (falta)
//Complejidad O(n), Lineal
function Vehiculos.fechaMulta(Patente: string;masAntigua:boolean) : tipoElemento;
var LM: ^Lista;
    posMulta, posAuto: posicionLista;
    fechaComparar, fechaElemActual: TDateTime;
    elemMulta,elemDevolver: tipoElemento;
    datosMulta: ^TMulta;
begin
  elemDevolver.Inicializar(Fecha,Vacia);
  //Recupero la posicion del auto
  posAuto := buscarAuto(Patente);
  if posAuto <> Nulo then begin
    LM := getListaMultas(posAuto);
    posMulta := LM.Comienzo;
    //Si la patente existe y sus multas tambien, busco
    if posMulta <> Nulo then begin
      elemMulta := LM.Recuperar(posMulta);
      datosMulta := elemMulta.Valor2;
      fechaComparar := datosMulta^.Fecha;
      //si por parametro paso true busca la mas antigua, sino busca la mas reciente
      if masAntigua then begin
        //Mientras no recorra toda la lista de multas, busco la mas antigua
        while posMulta <> Nulo do begin
          elemMulta := LM.Recuperar(posMulta);
          datosMulta := elemMulta.Valor2;
          fechaElemActual := datosMulta^.Fecha;
          //Comparo la fecha actual con la comparable(inicializada en nada)
          if fechaElemActual < fechaComparar then fechaComparar := fechaElemActual;
            posMulta := LM.Siguiente(posMulta);
        end;
      end
      else begin
        //Mientras no recorra toda la lista de multas, busco la mas reciente
        while posMulta <> Nulo do begin
          elemMulta := LM.Recuperar(posMulta);
          datosMulta := elemMulta.Valor2;
          fechaElemActual := datosMulta^.Fecha;
          //Comparo la fecha actual con la comparable(inicializada en nada)
          if fechaElemActual > fechaComparar then fechaComparar := fechaElemActual;
          posMulta := LM.Siguiente(posMulta);
        end;
      end;
      elemDevolver.Clave := fechaComparar;
      elemDevolver.Valor1 := OK;
    end
    else begin
      elemDevolver.Valor1 := CError;
    end;
  end;
  //Devuelve la fecha correspondiente
  Result := elemDevolver;
end;

//Funcion que buscar el auto en la lista, y devuelve la posicion en la que se encuentra
//Complejidad O(n), Lineal
function Vehiculos.buscarAuto(Patente: string) : posicionLista;
var elemAuto: tipoElemento;
    posAuto: posicionLista;
    Busqueda: posicionLista;
begin
  elemAuto.Inicializar(Cadena,'');
  elemAuto.Clave := Patente;
  posAuto := L.Buscar(elemAuto);
  //Busca el auto y devuelve la posicion, o en caso de que no exista devuelve nulo
  if posAuto <> NULO then Busqueda := posAuto
  else Busqueda := Nulo;
  Result := Busqueda;
end;

//Funcion que crea la lista de multas, devolviendo el puntero a dicha lista
function Vehiculos.getListaMultas(posAuto: posicionLista) : puntLM;
var LM: ^Lista;
    elemAuto: tipoElemento;
begin
  elemAuto := L.Recuperar(posAuto);
  LM := elemAuto.Valor2;
  Result := LM;
end;

//Funcion que calcula el total de multas que presenta un vehiculo, y devuelve el valor
//Complejidad O(n), Lineal: Recorrer la segunda lista, buscando aquellas multas pendientes y colocandolas en el sumador
function Vehiculos.totalMultas(Patente: string) : integer;
var elemMulta: tipoElemento;
    posAuto, posMulta: posicionLista;
    LM: ^Lista;
    datosMulta: ^TMulta;
    Total, Sumador: integer;
begin
  Total := nError;
  //Recupero la posicion
  posAuto := buscarAuto(Patente);
  if posAuto <> Nulo then begin
    Sumador := 0;
    LM := getListaMultas(posAuto);
    posMulta := LM.Comienzo;
    //Mientras en la lista de multas no halla nada, recorro
    while posMulta <> Nulo do begin
      elemMulta := LM.Recuperar(posMulta);
      datosMulta := elemMulta.Valor2;
      //Si es pendiente, lo calculo como deuda
      if datosMulta^.Estado = 'Pendiente' then begin
        Sumador := Sumador  + datosMulta^.Importe;
      end;
      //Voy al siguiente
      posMulta := LM.Siguiente(posMulta);
    end;
    Total := Sumador;
  end;
  //Devuelvo al sumador
  Result := Total;
end;

//Inicializacion de la lista, con el numero de multas en 0 y la cantidad de elementos
procedure Vehiculos.inicializarLista(tipoClave:tipoDatosClave;cantElem:integer);
begin
  L.Crear(tipoClave,cantElem);
  nroMulta := 0;
end;

//Funcion que genera numeros de multa no repetidos
function Vehiculos.getNumMulta() : integer;
begin
  nroMulta := nroMulta + 1;
  Result := nroMulta;
end;

//Funcion que guarda la multa a su respectivo auto, devolviendo "Errores" en caso de que suceda algo
//Complejidad O(n), Lineal
function Vehiculos.insertarMulta(Patente,Estado: string;Importe: integer;Fecha:TDate) : Errores;
var elemMulta: tipoElemento;
    datosMulta: ^TMulta;
    LM: puntLM;
    posAuto: posicionLista;
    Insertado: Errores;
begin
  //Busco el auto
  posAuto := buscarAuto(Patente);
  if posAuto <> Nulo then begin
    elemMulta.Inicializar(Numero, 0);
    elemMulta.Clave := getNumMulta();
    New(datosMulta);
    elemMulta.Valor2 := datosMulta;
    datosMulta^.Estado := Estado;
    datosMulta^.Importe := Importe;
    datosMulta^.Fecha := Fecha;
    LM := getListaMultas(posAuto);
    LM^.Agregar(elemMulta);
    Insertado := OK;
  end
  else Insertado := cError;
  Result := Insertado;
end;

//Funcion que guarda el auto en la lista
function Vehiculos.guardarAuto(Patente: string) : Errores;
var elemAuto: tipoElemento;
    posAuto: posicionLista;
    seGuardo: Errores;
    LM: puntLM;
begin
  elemAuto.Inicializar(Cadena,'');
  elemAuto.Clave := Patente;
  New(LM);
  LM^.Crear(Numero,cantElemMax);

  //En caso de que no exista el auto, le asigno un puntero a su lista de multas
  elemAuto.Valor2 := LM;
  posAuto := L.Buscar(elemAuto);

  //Si no existe en la lista lo agrega, sino devuelve clave duplicada (osea que ya esta)
  if posAuto = Nulo then begin
    seGuardo := L.Agregar(elemAuto);
  end
  else begin
    seGuardo := ClaveDuplicada;
  end;
  Result := seGuardo;
end;

//Funcion que muestra la lista con los autos
function Vehiculos.mostrarLista() : string;
var Mostrar: string;
begin
  Mostrar := L.RetornarClaves;
  Result := Mostrar;
end;

//Funcion que valida la patente del auto, ya sea el formato viejo (AAA123) o el formato nuevo (AA123AA)
function Vehiculos.validarPatente(patente: string) : boolean;
var I,patVieja,patNueva: integer;
    Correcta: boolean;
begin
  Correcta := True;
  patVieja := 6;
  patNueva := 7;
  //Patente vieja
  if (Length(patente) = patVieja) and (Correcta) then begin
    for I := 1 to patVieja do begin
      if (((I >= 1) and (I <= 3)) and ((Ord(patente[I]) <
      Ord('a')) or (Ord(patente[I]) > Ord('z')))) or
      (((I >= 4) and (I <= 6)) and ((Ord(patente[I]) <
      Ord('0')) or (Ord(patente[I]) > Ord('9')))) then Correcta := False;
    end;
  end
  //Patente nueva
  else if (Length(patente) = patNueva) and (Correcta) then begin
    for I := 1 to patNueva do begin

      if (((I = 1) or (I = 2) or (I = 6) or (I = 7)) and ((Ord(patente[I]) <
        Ord('a')) or (Ord(patente[I]) > Ord('z')))) or
        (((I >= 3) and (I <= 5)) and ((Ord(patente[I]) <
        Ord('0')) or (Ord(patente[I]) > Ord('9')))) then Correcta := False;
    end;
  end
  else Correcta := False;
  Result := Correcta;
end;

end.
