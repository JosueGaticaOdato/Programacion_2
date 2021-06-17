unit TADVehiculos;

interface

uses
  ListArray, ListPointer, ListCursor, Tipos;

const
  cantElemMax = 10;
  nError = -1;

type
  TMulta = Record
    Estado : string;
    Importe : integer;
    Fecha : TDate;
  End;
  puntLM = ^Lista;
  Vehiculos = Object
  Private
    L: Lista;
    nroMulta: integer;
    function getNumMulta() : integer;
    function getListaMultas(posAuto: posicionLista) : puntLM;
    function buscarAuto(Patente: string) : posicionLista;
  Public
    procedure inicializarLista(tipoClave:tipoDatosClave;cantElem:integer);
    function guardarAuto(Patente: string) : Errores;
    function insertarMulta(Patente,Estado: string;Importe: integer;Fecha:TDate) : Errores;
    function mostrarLista() : string;
    function totalMultas(Patente: string) : integer;
    function fechaMulta(Patente: string;masAntigua:boolean) : tipoElemento;
    function cantMultasMayor() : string;
  End;

implementation

//recorre la lista de autos y la de multas y devuelve la patente con mas multas
//totales (los tres estados)
function Vehiculos.cantMultasMayor() : string;
var posAuto, posMulta: posicionLista;
    elemAuto, elemMulta: tipoElemento;
    LM: ^Lista;
    cantMultas, mayorCantMultas: integer;
    autoInfractor: string;
    datosMulta: ^TMulta;
begin
  cantMultas := 0;
  mayorCantMultas := 0;
  autoInfractor := 'Vacia';
  posAuto := L.Comienzo;
  while posAuto <> Nulo do begin
    LM := getListaMultas(posAuto);
    posMulta := LM.Comienzo;
    while posMulta <> Nulo do begin
      elemMulta := LM.Recuperar(posMulta);
      datosMulta := elemMulta.Valor2;
      if datosMulta.Importe <> 0 then cantMultas := cantMultas + 1;
      posMulta := LM.Siguiente(posMulta);
    end;
    if cantMultas > mayorCantMultas then begin
      mayorCantMultas := cantMultas;
      elemAuto := L.Recuperar(posAuto);
      autoInfractor := elemAuto.Clave;
    end;
    posAuto := L.Siguiente(posAuto);
  end;
  Result := autoInfractor;
end;



//devuelve un tipo elemento con la fecha (reciente o antigua) y una bandera
//por si no hay fecha
function Vehiculos.fechaMulta(Patente: string;masAntigua:boolean) : tipoElemento;
var LM: ^Lista;
    posMulta, posAuto: posicionLista;
    fechaComparar, fechaElemActual: TDateTime;
    elemMulta,elemDevolver: tipoElemento;
    datosMulta: ^TMulta;
begin
  elemDevolver.Inicializar(Fecha,CError);

  posAuto := buscarAuto(Patente);
  if posAuto <> Nulo then begin
    LM := getListaMultas(posAuto);
    posMulta := LM.Comienzo;
    if posMulta <> Nulo then begin
      elemMulta := LM.Recuperar(posMulta);
      datosMulta := elemMulta.Valor2;
      fechaComparar := datosMulta^.Fecha;
//si por parametro paso true busca la mas antigua, sino busca la mas reciente
      if masAntigua then begin
        while posMulta <> Nulo do begin
          elemMulta := LM.Recuperar(posMulta);
          datosMulta := elemMulta.Valor2;
          fechaElemActual := datosMulta^.Fecha;
          if fechaElemActual < fechaComparar then fechaComparar := fechaElemActual;
            posMulta := LM.Siguiente(posMulta);
        end;
      end
      else begin
        while posMulta <> Nulo do begin
          elemMulta := LM.Recuperar(posMulta);
          datosMulta := elemMulta.Valor2;
          fechaElemActual := datosMulta^.Fecha;
          if fechaElemActual > fechaComparar then fechaComparar := fechaElemActual;
          posMulta := LM.Siguiente(posMulta);
        end;
      end;
    end;
    elemDevolver.Clave := fechaComparar;
    elemDevolver.Valor1 := OK;
  end;

  Result := elemDevolver;
end;

function Vehiculos.buscarAuto(Patente: string) : posicionLista;
var elemAuto: tipoElemento;
    posAuto: posicionLista;
    Busqueda: posicionLista;
begin
  elemAuto.Inicializar(Cadena,'');
  elemAuto.Clave := Patente;
  posAuto := L.Buscar(elemAuto);
  if posAuto <> NULO then Busqueda := posAuto
  else Busqueda := Nulo;
  Result := Busqueda;
end;

function Vehiculos.getListaMultas(posAuto: posicionLista) : puntLM;
var LM: ^Lista;
    elemAuto: tipoElemento;
begin
  elemAuto := L.Recuperar(posAuto);
  LM := elemAuto.Valor2;
  Result := LM;
end;

function Vehiculos.totalMultas(Patente: string) : integer;
var elemMulta: tipoElemento;
    posAuto, posMulta: posicionLista;
    LM: ^Lista;
    datosMulta: ^TMulta;
    Total, Sumador: integer;
begin
  Total := nError;

  posAuto := buscarAuto(Patente);
  if posAuto <> Nulo then begin
    Sumador := 0;
    LM := getListaMultas(posAuto);
    posMulta := LM.Comienzo;
    while posMulta <> Nulo do begin
      elemMulta := LM.Recuperar(posMulta);
      datosMulta := elemMulta.Valor2;
      if datosMulta^.Estado = 'Pendiente' then begin
        Sumador := Sumador  + datosMulta^.Importe;
      end;
      posMulta := LM.Siguiente(posMulta);
    end;
    Total := Sumador;
  end;
  Result := Total;
end;

procedure Vehiculos.inicializarLista(tipoClave:tipoDatosClave;cantElem:integer);
begin
  L.Crear(tipoClave,cantElem);
  nroMulta := 0;
end;

function Vehiculos.getNumMulta() : integer;
begin
  nroMulta := nroMulta + 1;
  Result := nroMulta;
end;

function Vehiculos.insertarMulta(Patente,Estado: string;Importe: integer;Fecha:TDate) : Errores;
var elemMulta: tipoElemento;
    datosMulta: ^TMulta;
    LM: puntLM;
    posAuto: posicionLista;
    Insertado: Errores;
begin
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

  elemAuto.Valor2 := LM;
  posAuto := L.Buscar(elemAuto);

  if posAuto = Nulo then begin
    seGuardo := L.Agregar(elemAuto);
  end
  else begin
    seGuardo := ClaveDuplicada;
  end;
  Result := seGuardo;
end;

function Vehiculos.mostrarLista() : string;
var Mostrar: string;
begin

  Mostrar := L.RetornarClaves;
  Result := Mostrar;
end;


end.
