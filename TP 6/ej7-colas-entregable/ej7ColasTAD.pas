unit ej7ColasTAD;

interface

uses
  QueuesArray,QueuesArrayNC,QueuesArrayNCMejorada,QueuesCursor,
  QueuesPointer,Tipos,Math;

const
  tipoClave = Numero;
  cantElemCola = 3;
  Min = 10;
  Max = 60;
  Q = 10;

//Un negocio tiene 3 ventanillas para atender a sus clientes.
//Los clientes forman cola en cada ventanilla. Un día, dos de los
//tres empleados que atienden las ventanillas no pueden asistir
//al trabajo, quedando uno solo para atender a las tres colas.
//Este empleado decide que, a medida que lleguen los clientes,
//atenderá por cierta cantidad de minutos (que denominaremos Q)
//a cada cola, paseándose por todas las colas equitativamente.
//Se pide que implemente un algoritmo que modele esta situación y
//dé como resultado el orden en que fueron atendidos los clientes.
//Ejemplo: El algoritmo recibe un Q de tiempo que atenderá a
//cada cola y las tres colas cargadas con clientes, donde cada
//cliente es la cantidad de tiempo que se necesita para atenderlo.
//Q = 10
//Cola1 = (40, 20, 30)
//Cola2 = (20, 10)
//Cola3 = (10, 10, 10)

// Resultado =
// Cliente 1 Cola 3,
// Cliente 1 Cola 2,
// Cliente 2 Cola 3,
// Cliente 2 Cola 2,
// Cliente 3 Cola 3,
// Cliente 1 Cola 1,
// Cliente 2 Cola 1,
// Cliente 3 Cola 1

type
  Ej7 = Object
  private
    Q: Cola;
  public
    procedure crearCola(aTClave:tipoDatosClave;aCantElem:integer);
    procedure cargarColas(aCantElem,aMin,aMax:integer);
    function mostrarColas() : string;
    function atenderColas(aQ:integer;aC1,aC2,aC3:Ej7) : Ej7;
    procedure pasarAColaAux(var aQAux:Cola);
    procedure atenderCliente(var aQAux:Cola;var aQRes:Ej7;var aI:integer;var aE:tipoElemento;aNCola:integer);
    function mostrarOrdenClientes(aQRes:Ej7) : Ej7;
  End;

implementation


function Ej7.mostrarOrdenClientes(aQRes:Ej7) : Ej7;
var qAux:Ej7;
    Elem,Elem1:tipoElemento;
    nCliente,nCola:string;
begin
  qAux.Q.Crear(Cadena,aQRes.Q.SizeQueue);
  Elem1.Inicializar(qAux.Q.DatoDeLaClave,'');
  while not aQRes.Q.EsVacia do begin
    Elem := aQRes.Q.Recuperar;
    nCliente := Elem.Clave;
    nCola := Elem.Valor1;
    //pasa a string la clave y el valor 1
    Elem1.Clave := 'Cliente ' + nCliente + ' Cola ' + nCola;
    qAux.Q.Encolar(Elem1);
    aQRes.Q.DesEncolar;
  end;
  Result := qAux;
end;


procedure Ej7.pasarAColaAux(var aQAux:Cola);
var Elem:tipoElemento;
begin
  while not Q.EsVacia do begin
    Elem := Q.Recuperar;
    aQAux.Encolar(Elem);
    Q.DesEncolar;
  end;
end;

procedure Ej7.atenderCliente(var aQAux:Cola;var aQRes:Ej7;var aI:integer;var aE:tipoElemento;aNCola:integer);
begin
  if aE.Clave = 0 then begin
    aI := aI + 1;
    aE.Clave := aI;
    aE.Valor1 := aNCola;
    aQRes.Q.Encolar(aE);
    aQAux.DesEncolar;
    aE := aQAux.Recuperar;
  end;
end;

function Ej7.atenderColas(aQ:integer;aC1,aC2,aC3:Ej7) : Ej7;
var E1,E2,E3: tipoElemento;
    qRes: Ej7;
    I1,I2,I3: integer;
    qAux1,qAux2,qAux3:Cola;
begin
  qAux1.Crear(aC1.Q.DatoDeLaClave,aC1.Q.SizeQueue);
  qAux2.Crear(aC2.Q.DatoDeLaClave,aC2.Q.SizeQueue);
  qAux3.Crear(aC3.Q.DatoDeLaClave,aC3.Q.SizeQueue);
  qRes.Q.Crear(aC1.Q.DatoDeLaClave,aC1.Q.SizeQueue+aC2.Q.SizeQueue+aC3.Q.SizeQueue);
  aC1.pasarAColaAux(qAux1);
  aC2.pasarAColaAux(qAux2);
  aC3.pasarAColaAux(qAux3);
  //para el numero de cliente
  I1 := 0;
  I2 := 0;
  I3 := 0;
  E1 := qAux1.Recuperar;
  E2 := qAux2.Recuperar;
  E3 := qAux3.Recuperar;
  while (not qAux1.EsVacia) or (not qAux2.EsVacia) or (not qAux3.EsVacia) do begin
    if not qAux1.EsVacia then begin

      if E1.Clave > 0 then begin
        E1.Clave := E1.Clave - aQ;
      end;
      atenderCliente(qAux1,qRes,I1,E1,aQ,1);
    end;

    if not qAux2.EsVacia then begin
      if E2.Clave > 0 then begin
        E2.Clave := E2.Clave - aQ;
      end;
      atenderCliente(qAux2,qRes,I2,E2,aQ,2);
    end;

    if not qAux3.EsVacia then begin
      if E3.Clave > 0 then begin
        E3.Clave := E3.Clave - aQ;
      end;
      atenderCliente(qAux3,qRes,I3,E3,aQ,3);
    end;
  end;
  Result := qRes;
end;

procedure Ej7.crearCola(aTClave:tipoDatosClave;aCantElem:integer);
begin
  Q.Crear(aTClave,aCantElem);
end;

procedure Ej7.cargarColas(aCantElem,aMin,aMax:integer);
var Elem: tipoElemento;
begin
  while not Q.EsLlena do begin
    Elem.Inicializar(Q.DatoDeLaClave,'');
    Elem.Clave := RandomRange(1,6) * 10;
    Q.Encolar(Elem);
  end;
end;

function Ej7.mostrarColas() : string;
begin
  Result := Q.RetornarClaves;
end;

end.
