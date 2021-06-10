unit TADMultas;

interface

uses
  ListArray, ListPointer,ListCursor,Tipos;

const
  numError = -1;

type
  pMultas = ^Lista;
  puntMulta = ^TMulta;
  TMulta = Record
    nroActa : integer;
    Estado : string;
    Importe : integer;
    Fecha : string;
  End;

  Vehiculo = Object
  Private
    L: Lista;
  Public
    function Sin_Deuda(): String;
    //ME FALTAN ARREGLAR DESDE ESTA DE ABAJO
    function Mayor_Deuda(L1:Lista): TipoElemento;
    function Mayor_Cant_Infracciones(L1:Lista): TipoElemento;
    function multaReciente (L1: Lista; Auto: String): TipoElemento;
    function multaAntigua (L1: Lista; Auto: String): TipoElemento;
    function totalMultas (L1: Lista; Auto: String): Integer;
    //HASTA ESTA DE ARRIBA
    function buscarAuto(patent: string) : integer;
    function buscarPosDispo() : integer;
    function buscarPosMulta(fecha: TDate; posAuto: integer) : integer;
    procedure guardarPatente(patente: string; posGuardar: integer);
    procedure guardarMulta(multa: TDateTime;posAuto,posGuardar,
 nro:integer;monto:string;estado:string);
  End;

var
  L: Lista;

implementation

function Vehiculo.buscarAuto(patent: string) : integer;
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

function Vehiculo.buscarPosDispo() : integer;
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


function Vehiculo.buscarPosMulta(fecha: TDate; posAuto: integer) :
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

procedure Vehiculo.guardarPatente(patente: string; posGuardar: integer);
var Elem: tipoElemento;
begin
  Elem := L.Recuperar(posGuardar);
  Elem.Clave := patente;
end;

procedure Vehiculo.guardarMulta(multa: TDateTime;posAuto,posGuardar,
 nro:integer;monto:string;estado:string);
var fecha, E: string;
    importe: integer;
    Elem, elemMulta: tipoElemento;
    LM: pMultas;
    punteroMulta: puntMulta;
begin
  fecha := dateToStr(multa);
  importe := strToInt(monto);
  E := estado;
  Elem := L.Recuperar(posAuto);

  Elem.Valor2 := LM;
  elemMulta := LM.Recuperar(posGuardar);
  elemMulta.Clave := posGuardar;
  punteroMulta.Fecha := fecha;
  punteroMulta.Importe := importe;
  punteroMulta.Estado := E;
  elemMulta.Valor2 := punteroMulta;
end;





//Funcion que me devuelve aquel auto que no tenga deudas
function Vehiculo.Sin_Deuda(): String;
var P, M: PosicionLista;
    X1,X2: TipoElemento;
    Puntero1: pMultas;
    Puntero2: puntMulta;
    menorDeudor: string;
    menosDeudas, Contador: integer;
begin
  P := L.Comienzo;
  X1 := L.Recuperar(P);
  menorDeudor := '';
  menosDeudas := 0;
  Contador := 0;
  //recorro para ver cual es el que mas deudas no pendiente tiene, y lo guardo en valor1
  //cuando termina con un auto pregunta si tiene mas deudas no pendiente que la var
  //'menosDeudas'
  while (P <> Nulo) do begin
    Puntero1 := X1.Valor2;
    M := Puntero1.Comienzo();
    X2 := Puntero1.Recuperar(M);
    Puntero2 := X2.Valor2;
    while (M <> Nulo) do begin
      if Puntero2.Estado <> 'Pendiente' then begin
        Contador := Contador + 1;
      end;
      M := Puntero1.Siguiente(M);
      X2 := Puntero1.Recuperar(M);
    end;
    X2.Valor1 := Contador;
    if X2.Valor1 > menosDeudas then begin
        menosDeudas := X2.Valor1;
        menorDeudor := X2.Clave;
    end;
    P := L.Siguiente(P);
    X1 := Puntero1.Recuperar(P);
  end;

  Result := menorDeudor;
end;

//Funcion que devuelve el auto con la mayor deuda
function Vehiculo.Mayor_Deuda(L1:Lista): TipoElemento;
var Contador, SubContador: TipoElemento;
  P, Inicio: PosicionLista;
  X1,X2,X3, Comprobante: TipoElemento;
  Bandera: Boolean;
  Puntero1: pMultas;
  Puntero2: puntMulta;
begin
  //Primer elemento
  P := L.Comienzo;
  Inicio := L.Comienzo;
  X1 := L.Recuperar(P);
  Comprobante := X1;
  Contador.Valor1 := 0;
  Bandera := True;
  //Mientras no llegue al final y sea otro valor distinto
  while (P <> Nulo) and (Bandera) do
  begin
    X1 := L.Recuperar(P);
    if Comprobante.Clave = X1.Clave then
    begin
      if X1.Valor1 = 'Pendiente' then
      begin
        Puntero1 := X1.Valor2;
        X2 := Puntero1^.Recuperar(Inicio);
        Puntero2 := X2.Valor2;
        Contador.Clave := X1.Clave; //Recupero el nombre del auto
        Contador.Valor1 := Contador.Valor1 + Puntero2^;  //Recupero el importe
        P := L.Siguiente(P);
      end;
    end
    else
    begin
      Bandera := False; //En el caso que sea otra patente, termino el ciclo
    end;
  end;

  //Mientras no llegue al final
  SubContador.Valor1 := 0;
  while (P <> Nulo) do
  begin
  X1 := L.Recuperar(P);
  if X1.Valor1 = 'Pendiente' then
  begin
      Puntero1 := X1.Valor2;
      X2 := Puntero1^.Recuperar(Inicio);
      Puntero2 := X2.Valor2;
      SubContador.Clave := X1.Clave;   //Guardo en otro contador el nombre del auto y su importe
      SubContador.Valor1 := SubContador.Valor1 + Puntero2^;
  end;
  P := L.Siguiente(P);
  //En caso de que sea mayor, cambio el contador
  if SubContador.Valor1 > Contador.Valor1 then
  begin
    Contador := SubContador;
  end;
  Comprobante := L.Recuperar(P);
  //Si el que sigue es distinto, arranca de 0 devuelta
  if X1.Clave <> Comprobante.Clave then
  Begin
    SubContador.Valor1 := 0;
  End;
  end;
  //Devuelve el TE
  Result := Contador;
end;

//Funcion que devuelve el auto con mayor cantidad de infracciones
function Vehiculo.Mayor_Cant_Infracciones(L1:Lista): TipoElemento;
var Contador, SubContador: TipoElemento;
  P: PosicionLista;
  X1,X2: TipoElemento;
  Bandera: Boolean;
begin
  //Tomo un auto como eje
  P := L.Comienzo;
  Contador.Clave := L.Recuperar(P).Clave;  //Clave contiene al auto
  Contador.Valor1 := 0;      //Valor 1 tiene la cantidad de ocurrencias
  Bandera := True;
  while (P <> Nulo) and (Bandera) do
  begin
  X1 := L.Recuperar(P);
  X2 := L.Recuperar(L.Siguiente(P));
  if X1.Clave <> X2.Clave then
  begin
    Bandera := False;
  end;
  P := L.Siguiente(P);
  //Aumento el contador a medida que encuentro ocurrencias
  Contador.Valor1 := Contador.Valor1 + 1;
  end;

  //Averiguo los demas
  Bandera := True;
  SubContador.Valor1 := 1;
  while (P <> Nulo) do
  begin
  X1 := L.Recuperar(P);
  X2 := L.Recuperar(L.Siguiente(P));
  if X1.Clave = X2.Clave then
  begin
    //Aumento el subcontador a medida que encuentro ocurrencias
    SubContador.Clave := L.Recuperar(P).Clave;
    SubContador.Valor1 := SubContador.Valor1 + 1;
  end
  else
  begin
    //Sino, vuelve a empeza
    SubContador.Valor1 := 1;
  end;
  //Pido el siguiente
  P := L.Siguiente(P);
  //Si es mayor, tengo un auto con mas ocurrencias que otro, cambio el contador
  if SubContador.Valor1 > Contador.Valor1 then
  begin
    Contador := SubContador;
  end;
  end;
  //Devuelvo el auto con la cantidad de ocurrencias
  Result := Contador;
end;

//Funcion que calcula la multa mas reciente para un vehiculo
function Vehiculo.multaReciente (L1: Lista; Auto: String): TipoElemento;
var contL1, contL2, Mas_Antiguo: tipoElemento;
    pos,Inicio: posicionLista;
    puntero: ^Lista;
    puntero2: ^integer;
    Bandera: Boolean;
begin
  //El algoritmo es igual al mas antigua, lo unico que cambia es en la linea 255, que ahora es mayor igual
  Inicio := L.Comienzo;
  pos := L.Comienzo;
  Bandera := True;
  while (Pos <> Nulo) and Bandera do
  begin
  contL1 := L.Recuperar(pos);
  if contL1.Clave = Auto then
    begin
      puntero := contL1.Valor2;
      contL2 := puntero^.Recuperar(Inicio);
      Mas_antiguo := contL2;
      Bandera := False;
    end;
  pos := L.Siguiente(pos);
  end;

  while (Pos <> Nulo) do
  begin
  contL1 := L.Recuperar(pos);
  if contL1.Clave = Auto then begin
    puntero := contL1.Valor2;
    contL2 := puntero^.Recuperar(Inicio);
    if contL2.Valor1 >= Mas_Antiguo.Valor1 then
    begin
      Mas_Antiguo := contL2;
    end;
  end;
  pos := L.Siguiente(pos);
  end;
  multaReciente := Mas_Antiguo;
end;

//Funcion que calcula la multa mas antigua de un vehiculo, devolviendo el importe y la fecha
function Vehiculo.multaAntigua (L1: Lista; Auto: String): TipoElemento;
var contL1, contL2, Mas_Antiguo: tipoElemento;
    pos, Inicio: posicionLista;
    puntero: ^Lista;
    puntero2: ^integer;
    Bandera: Boolean;
begin
  //Inicializo la posicion, el inicio y bandera
  pos := L.Comienzo;
  Inicio := L.Comienzo; //Inicio me indica la primera posicion de la segunda lista
  Bandera := True;
  //Mientas posicion no tenga nada y no halla encontrado la primera ocurrencia
  while (Pos <> Nulo) and Bandera do
  begin
  contL1 := L.Recuperar(pos);
  //Si encuentro la ocurrencia, guardo
  if contL1.Clave = Auto then
    begin
      puntero := contL1.Valor2;
      contL2 := puntero^.Recuperar(Inicio);
      //Guardo en la variable y termina el ciclo
      Mas_antiguo := contL2;
      Bandera := False;
    end;
  //Pido el siguiente
  pos := L.Siguiente(pos);
  end;

  //Mientras halla posiciones
  while (Pos <> Nulo) do
  begin
  //Recupero
  contL1 := L.Recuperar(pos);
  //Si es del mismo auto, la guardo y comparo
  if contL1.Clave = Auto then begin
    puntero := contL1.Valor2;
    contL2 := puntero^.Recuperar(Inicio);
    //Si es menor quiere decir que es mas antigua
    if contL2.Valor1 < Mas_Antiguo.Valor1 then
    begin
      //Guardo en la variable
      Mas_Antiguo := contL2;
    end;
  end;
  //Pido siguiente posicion
  pos := L.Siguiente(pos);
  end;
  //Devuelvo la multa mas antigua
  multaAntigua := Mas_Antiguo;
end;

//Funcion que calcula el total de multas de un vehiculo
function Vehiculo.totalMultas (L1: Lista; Auto: String): Integer;
var sumador: integer;
    contL1, contL2: tipoElemento;
    pos,Inicio: posicionLista;
    puntero: ^Lista;
    puntero2: ^integer;
begin
  //Inicializo el sumador, la posicion y el inicio
  Inicio := l.Comienzo;
  pos := L.Comienzo;
  sumador := 0;
  //Mientras la posicion sea distinto de nulo
  while pos <> Nulo do begin
    //Necesito que los autos tengan la misma patente y sea pendiente
    contL1 := L.Recuperar(pos);
    if contL1.Clave = Auto then begin
      if contL1.Valor1 = 'Pendiente' then begin
        //Creo ambos punteros
        New(puntero);
        New(Puntero2);
        //Paso al primer puntero el contenido de V2
        puntero := contL1.Valor2;
        //Recupero el contenido
        contL2 := puntero^.Recuperar(Inicio);

        //En puntero2 almaceno V2 de la segunda lista, que era el importe
        puntero2 := contL2.Valor2;
        //Sumo
        sumador := sumador + puntero2^;
      end;
    end;
    //Solicito la siguiente posicion
    pos := L.Siguiente(pos);
  end;
  //Devuelvo el total
  Result := sumador;
end;



end.
