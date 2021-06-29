unit ej3ColasTAD;

interface

uses
  Tipos, QueuesArray, QueuesArrayNC, QueuesArrayNCMejorada, QueuesCursor,
  QueuesPointer,ListArray,ListCursor,ListPointer;

const
  tipoClave = Numero;
  cantElemCola = 25;
  Min = 1;
  Max = 10;

type
  Ej3 = Object
  private
    Q : Cola;
  public
    procedure cargarColas(aCantElem,aMin,aMax:integer);
    function mostrarCola() : string;
    procedure crearCola(aTClave:tipoDatosClave;aCantElem:integer);
    function pasarNoRepetidos() : Ej3;
    function ordenarCola() : Ej3;
    function pasarACola(L:Lista) : Cola;
    function pasarALista() : Lista;
  End;

implementation

function Ej3.pasarACola(L:Lista) : Cola;
var Elem: tipoElemento;
begin
  while not L.EsVacia do begin
    Elem := L.Recuperar(L.Comienzo);
    Q.Encolar(Elem);
    L.Eliminar(L.Comienzo);
  end;
  Result := Q;
end;

function Ej3.pasarALista() : Lista;
var L: Lista;
    Elem: tipoElemento;
begin
  if not Q.EsVacia then begin
    L.Crear(Q.DatoDeLaClave,Q.SizeQueue);
    while not Q.EsVacia do begin
      Elem := Q.Recuperar;
      L.Agregar(Elem);
      Q.DesEncolar;
    end;
    Result := L;
  end;
end;

function Ej3.ordenarCola() : Ej3;
var L: Lista;
    Elem: tipoElemento;
    C: Ej3;
begin
  L := pasarALista;
  L.Sort(true);
  C.Q := pasarACola(L);
  Result := C;
end;

function Ej3.pasarNoRepetidos() : Ej3;
var qAux1: Cola;
    qRes: Ej3;
    Elem,elemComp: tipoElemento;
    L: Lista;
    posElem: posicionLista;
begin
  L := pasarALista;
  qAux1.Crear(Q.DatoDeLaClave,Q.SizeQueue);
  qRes.Q.Crear(Q.DatoDeLaClave,Q.SizeQueue);

  elemComp.Inicializar(Q.DatoDeLaClave,'');
  elemComp.Clave := -1;
  while not L.EsVacia do begin
    Elem := L.Recuperar(L.Comienzo);
    qAux1.Encolar(Elem);
    L.Eliminar(L.Comienzo);
    posElem := L.Buscar(Elem);
    if (posElem = Nulo) and (Elem.Clave <> elemComp.Clave) then begin
      qRes.Q.Encolar(Elem);
    end
    else begin
      elemComp := Elem;
    end;
  end;
  Q.InterCambiar(qAux1,false);
  Result := qRes;
end;

procedure Ej3.cargarColas(aCantElem,aMin,aMax:integer);
begin
  Q.LLenarClavesRandom(aCantElem,aMin,aMax);
end;

function Ej3.mostrarCola() : string;
begin
  Result := Q.RetornarClaves;
end;

procedure Ej3.crearCola(aTClave:tipoDatosClave;aCantElem:integer);
begin
  Q.Crear(aTClave,aCantElem);
end;
end.
