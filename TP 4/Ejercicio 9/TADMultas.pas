unit TADMultas;

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

  Vehiculo = Object
  Private
    L: Lista;
    LM: Lista;
  Public
    procedure inicializarLista(tipoClave:tipoDatosClave;cantElem:integer);
    function Guardar(Patente,Estado,Importe: string;Fecha:TDate) : Errores;
    function mostrarLista() : string;
  End;

implementation

procedure Vehiculo.inicializarLista(tipoClave:tipoDatosClave;cantElem:integer);
begin
  L.Crear(tipoClave,cantElem);
end;

function Vehiculo.Guardar(Patente,Estado,Importe: string;Fecha:TDate) : Errores;
var elemAuto: tipoElemento;
    posAuto: posicionLista;
    seGuardo: Errores;
begin
  elemAuto.Inicializar(Cadena,0);
  elemAuto.Clave := Patente;
  if L.EsVacia then begin
    L.Agregar(elemAuto);
  end
  else begin
    posAuto := L.Buscar(elemAuto);
    if (posAuto = Nulo) and (not L.EsLLena) then begin
      L.Agregar(elemAuto);      
    end
    else begin
      seGuardo := Llena;
    end;
  end;
  seGuardo := OK;
  Result := seGuardo;  
end;

function Vehiculo.mostrarLista() : string;
var Mostrar: string;
begin

  Mostrar := L.RetornarClaves;
  Result := Mostrar;
end;
end.
