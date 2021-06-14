unit TADMultas;

interface

uses
  ListArray,
  //ListPointer, //con este tiene errores
  //ListCursor,
  Tipos;

const
  numError = -1;
  autoYaGuardado = -2;

type


  puntMulta = ^TMulta;

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
    function Sin_Deuda(): String;
    function Mayor_Deuda(): tipoElemento;
    function Mayor_Cant_Infracciones(): tipoElemento;
    function multaReciente ( Auto: String): tipoElemento;
    function multaAntigua (Auto: String): tipoElemento;
    function totalMultas (patente: String): tipoElemento;
    function buscarAuto(patent: string) : integer;
    function guardarAutoYMulta(fecha: TDate;posAuto: posicionLista;
     monto:integer;estado,patente:string;autoGuardado:boolean) : boolean;
    function Devolver_Lista(): Lista;
    procedure Inicializar(Tamanio: Integer);
    function mostrarLista() : string;
    function recorrerListaAutos(patente: string) : posicionLista;
    function listaVacia() : boolean;
    function recuperarListaMultas(elemAuto:tipoElemento) : Lista;
    function recuperarDatosMulta(elemMulta: tipoElemento) : TMulta;
  End;

//var
 // LM: Lista;

implementation

function recuperarDatosMulta(elemMulta: tipoElemento) : TMulta;
var pointDatosMulta: puntMulta;
    datosMulta: TMulta;
begin
  New(pointDatosMulta);
  pointDatosMulta := elemMulta.Valor2;
  datosMulta := pointDatosMulta^;
  Dispose(pointDatosMulta);
  Result := datosMulta;
end;

function Vehiculo.recuperarListaMultas(elemAuto:tipoElemento) : Lista;
var lisMultas: ^Lista;
    listaMultas: Lista;
begin
    New(lisMultas);
    lisMultas := elemAuto.Valor2;
    listaMultas.Crear(Numero,L.SizeList);
    listaMultas := lisMultas^;
    Dispose(lisMultas);
    Result := listaMultas;
end;

function Vehiculo.recorrerListaAutos(patente: string) : posicionLista;
var posAVer: integer;
    elemAuto: tipoElemento;
    posAuto: posicionLista;
    Encontrado: boolean;
begin
  posAVer := numError;
  Encontrado := False;
  posAuto := L.Comienzo;
  elemAuto := L.Recuperar(posAuto);

  while (posAuto < L.SizeList) and (not Encontrado) do begin
    if elemAuto.Clave = patente then begin
      Encontrado := True;
      posAVer := posAuto;
    end
    else begin
      posAuto := L.Siguiente(posAuto);
      elemAuto := L.Recuperar(posAuto);
    end;
  end;
  Result := posAVer;
end;

function Vehiculo.mostrarLista() : string;
var mostrar: string;
begin
  mostrar := L.RetornarClaves;
  Result := mostrar;
end;

//busca si el auto parametro esta guardado, devuelve pos o error
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
  while (posElem < L.Fin) and (not Encontrado) and
  (not Elem.EsTEVacio) do begin
    if patent = Elem.Clave then begin
      Encontrado := True;
      posAuto := autoYaGuardado;
    end
    else begin
      posElem := L.Siguiente(posElem);
      Elem := L.Recuperar(posElem);
    end;
  end;
  if Elem.EsTEVacio then begin
    posAuto := L.Siguiente(posElem);
  end
  else if not Encontrado then begin
    posAuto := numError;
  end;
  Result := posAuto;
end;

function Vehiculo.guardarAutoYMulta(fecha: TDate;posAuto: posicionLista;
 monto:integer;estado,patente:string;autoGuardado:boolean) : boolean;
var
    posGuardarMulta: posicionLista;
    seGuardo: boolean;
    elemAuto,elemMulta: tipoElemento;
    pLM: ^Lista;
    punteroMulta: puntMulta;
begin
  if not autoGuardado then begin
    elemAuto := L.Recuperar(posAuto);
    elemAuto.Clave := patente;
  end;
  seGuardo := True;
  New(pLM);
  New(punteroMulta);

  punteroMulta.Fecha := fecha;
  punteroMulta.Importe := monto;
  punteroMulta.Estado := estado;
  elemMulta.Valor2 := punteroMulta;

  LM.Crear(Numero,L.SizeList);
  if LM.EsVacia then begin
    posGuardarMulta := 1;
  end
  else begin
    posGuardarMulta := LM.Buscar(elemMulta);
  end;
  if LM.EsLLena then begin
    seGuardo := False;
  end;

  elemMulta.Clave := posGuardarMulta;  //nro acta
  LM.Agregar(elemMulta);
  pLM^ := LM;
  elemAuto.Valor2 := pLM;

  L.Agregar(elemAuto);
  Dispose(pLM);
  Dispose(punteroMulta);
  Result := seGuardo;
end;

//Funcion que calcula el total de multas de un vehiculo
function Vehiculo.totalMultas (patente: String): tipoElemento;
var Valor2: Pointer;
    sumador, posAuto: integer;
    elemAuto, elemMulta, elemDevolver: tipoElemento;
    posMulta: posicionLista;

    datosMulta: puntMulta;
    listaMultas: Lista;
begin
  if L.EsVacia then begin
    posAuto := 1;
  end
  else begin
    posAuto := recorrerListaAutos(patente);
  end;
  elemDevolver.Inicializar(Cadena,0);
  if posAuto <> numError then begin
    elemAuto := L.Recuperar(posAuto);
    listaMultas := recuperarListaMultas(elemAuto);

    if not listaMultas.EsVacia then begin

      posMulta := listaMultas.Comienzo;
    end
    else begin
      posMulta := 1;
    end;
      elemMulta := listaMultas.Recuperar(posMulta);
    while not elemMulta.EsTEVacio do begin
      sumador := sumador + 1;
      posMulta := listaMultas.Siguiente(posMulta);
      elemMulta := listaMultas.Recuperar(posMulta);
    end;

    elemDevolver.Clave := elemAuto.Clave;
    elemDevolver.Valor1 := sumador;

  end;
  Result := elemDevolver;
end;

//Funcion que me devuelve aquel auto que no tenga deudas
function Vehiculo.Sin_Deuda(): String;
var posAuto, posMulta: PosicionLista;
    Auto,Multa: TipoElemento;
    lisMultas: ^Lista;
    datosMulta: puntMulta;
    menorDeudor: string;
    menosDeudas, Contador: integer;
begin
  posAuto := L.Comienzo;
  Auto := L.Recuperar(posAuto);
  menorDeudor := '';
  menosDeudas := 0;
  Contador := 0;
  New(lisMultas);
  New(datosMulta);
  //recorro para ver cual es el que mas deudas no pendiente tiene, y lo guardo en valor1
  //cuando termina con un auto pregunta si tiene mas deudas no pendiente que la var
  //'menosDeudas'
  while (posAuto <= L.Fin) do begin
    lisMultas := Auto.Valor2;
    posMulta := lisMultas.Comienzo();
    while (posMulta <= lisMultas.Fin) do begin
      Multa := lisMultas.Recuperar(posMulta);
      datosMulta := Multa.Valor2;
      Contador := 0;
      if datosMulta^.Estado <> 'Pendiente' then begin
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
  Dispose(lisMultas);
  Dispose(datosMulta);
  Result := menorDeudor;
end;

//Funcion que devuelve el auto con la mayor deuda
function Vehiculo.Mayor_Deuda(): tipoElemento;
var impTotal, mayorDeuda: integer;
    mayorDeudor: string;
    P, M: PosicionLista;
    X1,X2, elemDevolver: TipoElemento;
    Puntero1: ^Lista;
    Puntero2: puntMulta;
begin
  //Inicializo para recorrer
  P := L.Comienzo;
  X1 := L.Recuperar(P);
  impTotal := 0;
  mayorDeuda := -1;
  New(Puntero1);
  New(Puntero2);
  //sumo las deudas si son 'pendiente' y comparo con mayorDeuda, me quedo con la patente
  while (P <= L.Fin) do begin
    Puntero1 := X1.Valor2;
    M := Puntero1.Comienzo;
    X2 := Puntero1.Recuperar(M);
    Puntero2 := X2.Valor2;
    impTotal := 0;
    while M <= Puntero1.Fin do begin
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
    P := L.Siguiente(P);
    X1 := L.Recuperar(P);
  end;

  elemDevolver.Clave := mayorDeudor;
  elemDevolver.Valor1 := mayorDeuda;
  Dispose(Puntero1);
  Dispose(Puntero2);
  Result := elemDevolver;
end;

//Funcion que devuelve el auto con mayor cantidad de infracciones
function Vehiculo.Mayor_Cant_Infracciones(): tipoElemento;
var elemDevolver:TipoElemento;
  cantMultas,mayorCantMultas: integer;
  autoInfractor: string;
  P,M: PosicionLista;
  X1,X2: TipoElemento;
  Bandera: Boolean;
  Puntero1: ^Lista;
  Puntero2: puntMulta;
begin
  cantMultas := 0;
  mayorCantMultas := 0;
  P := L.Comienzo;
  X1 := L.Recuperar(P);
  New(Puntero1);
  New(Puntero2);
  while P <= L.Fin do begin
    Puntero1 := X1.Valor2;
    M := Puntero1.Comienzo;
    X2 := Puntero1.Recuperar(M);
    Puntero2 := X2.Valor2;
    cantMultas := 0;
    while M <= Puntero1.Fin do begin
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

  Dispose(Puntero1);
  Dispose(Puntero2);
  Result := elemDevolver;
end;



//Funcion que calcula la multa mas reciente para un vehiculo
function Vehiculo.multaReciente (Auto: String): tipoElemento;
var elemAuto, elemMulta, elemGuardar: tipoElemento;
    posAuto,posMulta: posicionLista;
    posAGuardar, multaMasReciente, nroMasReciente: integer;
    Fecha: double;
    listaMultas: Lista;
    datosMulta: puntMulta;
    Encontrado: Boolean;

begin
  Encontrado := False;
  Fecha := -1;
  posAuto := recorrerListaAutos(Auto);
  elemAuto := L.Recuperar(posAuto);

  listaMultas := recuperarListaMultas(elemAuto);
  posMulta := listaMultas.Comienzo;

  while (posMulta <= listaMultas.Fin) do begin
    elemMulta := listaMultas.Recuperar(posMulta);
    datosMulta := recuperarDatosMulta(elemMulta);
    if datosMulta.Fecha > Fecha then begin
      Fecha := datosMulta.Fecha;
      nroMasReciente := elemMulta.Clave;
      multaMasReciente := Fecha;
    end;
    posMulta := listaMultas.Siguiente(posMulta);
  end;

  elemGuardar.Clave := nroMasReciente;
  elemGuardar.Valor1 := multaMasReciente;
  Result := elemGuardar;
end;


//Funcion que calcula la multa mas antigua de un vehiculo, devolviendo el importe y la fecha
function Vehiculo.multaAntigua (Auto: String): tipoElemento;
var elemAuto, elemMulta, elemDevolver: tipoElemento;
    posAuto,posMulta: posicionLista;
    posAGuardar,  multaMasAntigua,nroMasAntigua: integer;
    Fecha: double;
    listaMultas: Lista;
    datosMulta: TMulta;
    Encontrado: Boolean;

begin
  Encontrado := False;
  Fecha := 999999;
  posAGuardar := recorrerListaAutos(Auto);

  elemAuto := L.Recuperar(posAGuardar);
  listaMultas := recuperarListaMultas(elemAuto);
  posMulta := listaMultas.Comienzo;

  while (posMulta <= listaMultas.Fin) do begin
    elemMulta := listaMultas.Recuperar(posMulta);
    datosMulta := recuperarDatosMulta(elemMulta);
    if datosMulta.Fecha < Fecha then begin
      Fecha := datosMulta.Fecha;
      nroMasAntigua := elemMulta.Clave;
      multaMasAntigua := Fecha;
    end;
    posMulta := listaMultas.Siguiente(posMulta);
  end;

  elemDevolver.Clave := nroMasAntigua;
  elemDevolver.Valor1 := multaMasAntigua;
  Result := elemDevolver;
end;

function Vehiculo.Devolver_Lista(): Lista;
begin
  Result := L;
end;

procedure Vehiculo.Inicializar(Tamanio: Integer);
begin
  L.Crear(Cadena,Tamanio);

end;

function Vehiculo.listaVacia() : boolean;
begin
  Result := L.EsVacia;
end;

end.
