unit TADVehiculos;

interface

uses
  ListArray, ListPointer, ListCursor, Tipos;

const
  cantElemMax = 3;
  
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

  Public
    procedure inicializarLista(tipoClave:tipoDatosClave;cantElem:integer);
    function getNumMulta() : integer;
    function guardarAuto(Patente: string) : Errores;
    function insertarMulta(Patente,Estado: string;Importe: integer;Fecha:TDate) : Errores;
    function mostrarLista() : string;
    function totalMultas(Patente: string) : integer;
  End;

implementation

function Vehiculos.totalMultas(Patente: string) : integer;
var elemAuto,elemMulta: tipoElemento;
    posAuto, posMulta: posicionLista;
    LM: ^Lista;
    datosMulta: ^TMulta;
    Total: integer;
begin
  Total := 0;
  elemAuto.Inicializar(Cadena,'');
  elemAuto.Clave := Patente;
  posAuto := L.Buscar(elemAuto);
  elemAuto := L.Recuperar(posAuto);
  LM := elemAuto.Valor2;
  posMulta := LM.Comienzo;


  while posMulta <> Nulo do begin
    elemMulta := LM.Recuperar(posMulta);
    datosMulta := elemMulta.Valor2;
    if datosMulta^.Estado = 'Pendiente' then begin
      Total := Total + datosMulta^.Importe;
    end;
    posMulta := LM.Siguiente(posMulta);
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
var elemAuto, elemMulta: tipoElemento;
    posAuto: posicionLista;
    datosMulta: ^TMulta;
    LM: puntLM;
begin

  elemAuto.Inicializar(Cadena,0);
  elemAuto.Clave := Patente;
  posAuto := L.Buscar(elemAuto);
  elemAuto := L.Recuperar(posAuto);
  elemMulta.Inicializar(Numero, 0);
  elemMulta.Clave := getNumMulta();
  New(datosMulta);
  elemMulta.Valor2 := datosMulta;
  datosMulta^.Estado := Estado;
  datosMulta^.Importe := Importe;
  datosMulta^.Fecha := Fecha;
  LM := elemAuto.Valor2;
  Result := LM^.Agregar(elemMulta);

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
