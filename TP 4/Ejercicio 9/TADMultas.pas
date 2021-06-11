unit TADMultas;

interface

uses
  ListArray, //ListPointer,//ListCursor
  Tipos;

const
  numError = -1;

type
  pMultas = ^Lista;
  puntMulta = ^TMulta;
  TMulta = Record
    Estado : string;
    Importe : integer;
    Fecha : TDate;
  End;

  Vehiculo = Object
  Private
    L: Lista;
  Public
    function Sin_Deuda(L1:Lista): String;
    function Mayor_Deuda(L1:Lista): tipoElemento;
    function Mayor_Cant_Infracciones(L1:Lista): tipoElemento;
    function multaReciente (L1: Lista; Auto: String): tipoElemento;
    function multaAntigua (L1: Lista; Auto: String): tipoElemento;
    function totalMultas (L1: Lista; Auto: String): tipoElemento;
    function buscarAuto(var L1: Lista;patent: string) : integer;
    function buscarPosDispo(var L1: Lista) : integer;
    function buscarPosMulta(var L1: Lista;fecha: TDate; posAuto: integer) : integer;
    procedure guardarPatente(var L1: Lista;patente: string; posGuardar: integer);
    procedure guardarMulta(var L1: Lista;multa: TDate;posAuto,posGuardar,
 nro,monto:integer;estado:string);
  End;

var
  L: Lista;

implementation

function Vehiculo.buscarAuto(var L1: Lista;patent: string) : integer;
var Encontrado: boolean;
    posElem: posicionLista;
    Elem: tipoElemento;
    posAuto: integer;
begin
  Encontrado := False;
  posElem := L.Comienzo;
  Elem := L.Recuperar(posElem);
  posAuto := numError;
  //si la patente pasada es igual a la patente guardada devuelve la pos
  while (posElem <> Nulo) and (not Encontrado) do begin
    if patent = Elem.Clave then begin
      Encontrado := True;
      posAuto := posElem;
    end
    else begin
      posElem := L.Siguiente(posElem);
      Elem := L.Recuperar(posElem);
    end;
  end;
  if not Encontrado then begin
    posAuto := numError;
  end;
  Result := posAuto;
end;

function Vehiculo.buscarPosDispo(var L1: Lista) : integer;
var Encontrado: boolean;
    posElem: posicionLista;
    Elem: tipoElemento;
    posDispo: integer;
begin
  Encontrado := False;
  posElem := L.Comienzo;
  Elem := L.Recuperar(posElem);
  posDispo := numError;
  //busco posición disponible y devuelve la pos
  while (posElem <> Nulo) and (not Encontrado) do begin
    if Elem.Clave = Nulo then begin
      Encontrado := True;
      posDispo := posElem;
    end
    else begin
      posElem := L.Siguiente(posElem);
      Elem := L.Recuperar(posElem);
    end;
  end;
  if not Encontrado then begin
    posDispo := numError;
  end;
  Result := posDispo;
end;


function Vehiculo.buscarPosMulta(var L1: Lista;fecha: TDate; posAuto: integer) :
integer;
var Elem, elemMulta: tipoElemento;
    posMulta: posicionLista;
    LM: pMultas;
    Encontrado: boolean;
    posMultaDispo: integer;
begin
  Encontrado := False;
  Elem := L.Recuperar(posAuto);
  LM := Elem.Valor2;
  posMulta := LM.Comienzo();
  elemMulta := LM.Recuperar(posMulta);
  posMultaDispo := numError;
  //recorro las multas buscando posición disponible
  while (posMulta <> Nulo) and (not Encontrado) do begin
    if elemMulta.Clave = Nulo then begin
      Encontrado := True;
      posMultaDispo := posMulta;
    end
    else begin
      posMulta := LM.Siguiente(posMulta);
      elemMulta := Lm.Recuperar(posMulta);
    end;
  end;
  if not Encontrado then posMultaDispo := numError;

  Result := posMultaDispo;
end;

procedure Vehiculo.guardarPatente(var L1: Lista;patente: string; posGuardar: integer);
var Elem: tipoElemento;
begin
  Elem := L1.Recuperar(posGuardar);
  Elem.Clave := patente;
end;

procedure Vehiculo.guardarMulta(var L1: Lista;multa: TDate;posAuto,posGuardar,
 nro,monto:integer;estado:string);
var fecha: TDate;
    E: string;
    importe: integer;
    Elem, elemMulta: tipoElemento;
    LM: pMultas;
    punteroMulta: puntMulta;
begin
  fecha := multa;
  importe := monto;
  E := estado;
  Elem := L1.Recuperar(posAuto);

  Elem.Valor2 := LM;
  elemMulta := LM.Recuperar(posGuardar);
  elemMulta.Clave := posGuardar;
  punteroMulta.Fecha := fecha;
  punteroMulta.Importe := importe;
  punteroMulta.Estado := E;
  elemMulta.Valor2 := punteroMulta;
end;





//Funcion que me devuelve aquel auto que no tenga deudas
function Vehiculo.Sin_Deuda(L1:Lista): String;
var posAuto, posMulta: PosicionLista;
    Auto,Multa: TipoElemento;
    lisMultas: pMultas;
    datosMulta: puntMulta;
    menorDeudor: string;
    menosDeudas, Contador: integer;
begin
  posAuto := L1.Comienzo;
  Auto := L1.Recuperar(posAuto);
  menorDeudor := '';
  menosDeudas := 0;
  Contador := 0;
  //recorro para ver cual es el que mas deudas no pendiente tiene, y lo guardo en valor1
  //cuando termina con un auto pregunta si tiene mas deudas no pendiente que la var
  //'menosDeudas'
  while (posAuto <> Nulo) do begin
    lisMultas := Auto.Valor2;
    posMulta := lisMultas.Comienzo();
    while (posMulta <> Nulo) do begin
      Multa := lisMultas.Recuperar(posMulta);
      datosMulta := Multa.Valor2;
      Contador := 0;
      if datosMulta.Estado <> 'Pendiente' then begin
        Contador := Contador + 1;
      end;
      posMulta := lisMultas.Siguiente(posMulta);
      Multa := lisMultas.Recuperar(posMulta);
    end;
    if Contador > menosDeudas then begin
        menosDeudas := Contador;
        menorDeudor := Auto.Clave;
    end;
    posAuto := L.Siguiente(posAuto);
    Auto := L.Recuperar(posAuto);
  end;

  Result := menorDeudor;
end;

//Funcion que devuelve el auto con la mayor deuda
function Vehiculo.Mayor_Deuda(L1:Lista): tipoElemento;
var impTotal, mayorDeuda: integer;
    mayorDeudor: string;
    P, M: PosicionLista;
    X1,X2, elemDevolver: TipoElemento;
    Puntero1: pMultas;
    Puntero2: puntMulta;
begin
  //Inicializo para recorrer
  P := L1.Comienzo;
  X1 := L1.Recuperar(P);
  impTotal := 0;
  mayorDeuda := -1;
  //sumo las deudas si son 'pendiente' y comparo con mayorDeuda, me quedo con la patente
  while (P <> Nulo) do begin
    Puntero1 := X1.Valor2;
    M := Puntero1.Comienzo;
    X2 := Puntero1.Recuperar(M);
    Puntero2 := X2.Valor2;
    impTotal := 0;
    while M <> Nulo do begin
      if Puntero2.Estado = 'Pendiente' then begin
        impTotal := impTotal + Puntero2.Importe;
      end;
      if impTotal > mayorDeuda then begin
        mayorDeuda := impTotal;
        mayorDeudor := X1.Clave;
      end;
      M := Puntero1.Siguiente(M);
      X2 := Puntero1.Recuperar(M);
    end;
    P := L1.Siguiente(P);
    X1 := L1.Recuperar(P);
  end;

  elemDevolver.Clave := mayorDeudor;
  elemDevolver.Valor1 := mayorDeuda;
  Result := elemDevolver;
end;

//Funcion que devuelve el auto con mayor cantidad de infracciones
function Vehiculo.Mayor_Cant_Infracciones(L1:Lista): tipoElemento;
var elemDevolver:TipoElemento;
  cantMultas,mayorCantMultas: integer;
  autoInfractor: string;
  P,M: PosicionLista;
  X1,X2: TipoElemento;
  Bandera: Boolean;
  Puntero1: pMultas;
  Puntero2: puntMulta;
begin
  cantMultas := 0;
  mayorCantMultas := 0;
  P := L1.Comienzo;
  X1 := L1.Recuperar(P);
  while P <> Nulo do begin
    Puntero1 := X1.Valor2;
    M := Puntero1.Comienzo;
    X2 := Puntero1.Recuperar(M);
    Puntero2 := X2.Valor2;
    cantMultas := 0;
    while M <> Nulo do begin
      if not X2.EsTEVacio then begin
        cantMultas := cantMultas + 1;
      end;
      if cantMultas > mayorCantMultas then begin
        mayorCantMultas := cantMultas;
        autoInfractor := X1.Clave;
      end;

    end;
    P := Puntero1.Siguiente(P);
    X1 := Puntero1.Recuperar(P);
  end;
  elemDevolver.Clave := autoInfractor;
  elemDevolver.Valor1 := mayorCantMultas;
  Result := elemDevolver;
end;



//Funcion que calcula la multa mas reciente para un vehiculo
function Vehiculo.multaReciente (L1: Lista; Auto: String): tipoElemento;
var elemAuto, elemMulta, elemGuardar: tipoElemento;
    posAuto,posMulta: posicionLista;
    posAGuardar, multaMasReciente: integer;
    Fecha: double;
    lisMultas: pMultas;
    datosMulta: puntMulta;
    Encontrado: Boolean;

begin
  Encontrado := False;
  Fecha := -1;
  posAuto := L1.Comienzo;
  elemAuto := L1.Recuperar(posAuto);
  while (posAuto <> Nulo) and (Encontrado) do begin
    if elemAuto.Clave = Auto then begin
      Encontrado := True;
      posAGuardar := posAuto;
    end;
  end;
  elemAuto := L1.Recuperar(posAGuardar);
  lisMultas := elemAuto.Valor2;
  posMulta := lisMultas.Comienzo;

  while (posMulta <> Nulo) do begin
    elemMulta := lisMultas.Recuperar(posMulta);
    datosMulta := elemMulta.Valor2;
    if datosMulta.Fecha > Fecha then begin
      Fecha := datosMulta.Fecha;
      multaMasReciente := elemMulta.Clave;
    end;
    posMulta := lisMultas.Siguiente(posMulta);
  end;
  elemGuardar.Clave := elemAuto.Clave;
  elemGuardar.Valor1 := multaMasReciente;
  Result := elemGuardar;
end;


//Funcion que calcula la multa mas antigua de un vehiculo, devolviendo el importe y la fecha
function Vehiculo.multaAntigua (L1: Lista; Auto: String): tipoElemento;
var elemAuto, elemMulta, elemDevolver: tipoElemento;
    posAuto,posMulta: posicionLista;
    posAGuardar,  multaMasAntigua: integer;
    Fecha: double;
    lisMultas: pMultas;
    datosMulta: puntMulta;
    Encontrado: Boolean;

begin
  Encontrado := False;
  Fecha := 999999;
  posAuto := L1.Comienzo;
  elemAuto := L1.Recuperar(posAuto);
  while (posAuto <> Nulo) and (Encontrado) do begin
    if elemAuto.Clave = Auto then begin
      Encontrado := True;
      posAGuardar := posAuto;
    end;
  end;
  elemAuto := L1.Recuperar(posAGuardar);
  lisMultas := elemAuto.Valor2;
  posMulta := lisMultas.Comienzo;

  while (posMulta <> Nulo) do begin
    elemMulta := lisMultas.Recuperar(posMulta);
    datosMulta := elemMulta.Valor2;
    if datosMulta.Fecha < Fecha then begin
      Fecha := datosMulta.Fecha;
      multaMasAntigua := elemMulta.Clave;
    end;
    posMulta := lisMultas.Siguiente(posMulta);
  end;
  elemDevolver.Clave := elemAuto.Clave;
  elemDevolver.Valor1 := multaMasAntigua;
  Result := elemDevolver;
end;


//Funcion que calcula el total de multas de un vehiculo
function Vehiculo.totalMultas (L1: Lista; Auto: String): tipoElemento;
var sumador, posAVer: integer;
    elemAuto, elemMulta, elemDevolver: tipoElemento;
    posAuto, posMulta: posicionLista;
    lisMultas: pMultas;
    Encontrado: boolean;
begin
  Encontrado := False;
  posAuto := L1.Comienzo;
  elemAuto := L1.Recuperar(posAuto);
  while (posAuto <> Nulo) and (Encontrado) do begin
    if elemAuto.Clave = Auto then begin
      Encontrado := True;
      posAVer := posAuto;
    end;
  end;
  elemAuto := L1.Recuperar(posAVer);
  lisMultas := elemAuto.Valor2;
  posMulta := lisMultas.Comienzo;
  elemMulta := lisMultas.Recuperar(posMulta);
  while not elemMulta.EsTEVacio do begin
    sumador := sumador + 1;
    posMulta := lisMultas.Siguiente(posMulta);
    elemMulta := lisMultas.Recuperar(posMulta);
  end;
  elemDevolver.Clave := elemAuto.Clave;
  elemDevolver.Valor1 := sumador;
  Result := elemDevolver;
end;






end.
