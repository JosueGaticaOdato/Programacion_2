unit TADTarjetaDeCredito;

interface

uses
  System.SysUtils, System.DateUtils;

const
  digitos = 4;
  limites = 500;
  limitesCuotas = 300;
  RangoMin1MasterCard = 2021;
  RangoMax1MasterCard = 2720;
  RangoMin2MasterCard = 51;
  RangoMax2MasterCard = 55;
  RangoMinAmerican = 34;
  RangoMaxAmerican = 37;
  RangoMinMaestro = 56;
  RangoMaxMaestro = 58;
  RangoMaestro = 50;
  RangoVisa = 4;


type
  Entidades = (Visa,Mastercard, American_Express, Maestro, INVALIDA);

  Tarjeta = Object
  private
    numero: Integer;
    fecha_vencimiento: TDate;
    limite_creditos: extended;
    limite_creditos_cuotas: extended;
    emisora: Entidades;
  public
    function cargarTarjeta(tarjetaACargar: Integer; vencimiento: TDate): boolean;
    function validarNro(): boolean;
    function getEntidadEmisora(): String;
    function MostrarLimites(): String;
    procedure EntidadEmisora();
    function Comprar(valorCompra, cantCuotas: integer; cuotas: boolean): boolean;
    procedure pagoEnUnaCuota(valorCompra: integer);
    procedure pagarEnCuotas(valorCompra,cantCuotas: Integer);
  End;

  Vector = Array [1 .. digitos] of Integer;

implementation

//---------------------------------------------
// Funciones y procedimientos propios de los comportamientos
//---------------------------------------------

// Procedimiento interno a la funcion validar para cargar digitos de la
// tarjeta en el vector
procedure cargarDigitosEnVector(var V: Vector; numeroTarjeta: Integer);
var
  i: Integer;
begin
  for i := 1 to digitos do
  begin
    V[i] := strtoint(numeroTarjeta.ToString[i]);
  end;
end;

// Procedimiento interno a la funcion validar para duplicar
// aquellos digitos que ocupen una posicio impar
procedure DuplicarPares(var V: Vector);
var
  i: Integer;
begin
  for i := 1 to digitos do
  begin
    if (i MOD 2) <> 0 then
    begin
      V[i] := V[i] * 2;
    end;
  end;
end;

// Funcion interno a la funcion validar para separar
// los numeros con mas de dos digitos
function separar(numero: Integer): Integer;
var
  i, Sumador: Integer;
begin
  Sumador := 0;
  for i := 1 to length(numero.ToString) do
  begin
    Sumador := Sumador + strtoint(numero.ToString[i]);
  end;
  separar := Sumador;
end;

// Funcion interno a la funcion validar que suma los digitos de la tarjeta
function sumarDigitos(V: Vector): Integer;
var
  total, i: Integer;
begin
  total := 0;
  for i := 1 to digitos do
  begin
    if length(V[i].ToString) <> 1 then
    begin
      total := total + separar(V[i])
    end
    else
    begin
      total := total + V[i];
    end;
  end;
  Result := total;
end;

//funciones para obtener de que emisora es la tarjeta
//-------------------------

function isemisoraVisa(numero: integer):boolean;
var
isVisa: boolean;
begin
  isVisa :=false;
  if numero.ToString[1] = RangoVisa.ToString then //Si el primer numero
  //Coincide con el rango de la visa
  begin
    isVisa := true; //La tarjeta es Visa
  end;
  Result := isVisa;
end;

function isemisoraMastercard(numero: integer):boolean;
var
isMastercard: boolean;
primerRango,segundoRango: String;
  I: Integer;
begin
  isMastercard :=false;
  primerRango := '';
  segundoRango := '';
  for I := 1 to 4 do //Obtengo los primeros 2 y 4 numeros de la tarjeta
  begin
    primerRango := primerRango + numero.ToString[i];
    if (I > 0) AND (I < 3) then
    begin
      segundoRango := segundoRango + numero.ToString[i];
    end;
  end;
  //Consulto si esta dentro de los rangos disponibles de MasterCard
  if ((primerRango >= RangoMin1MasterCard.ToString) and (primerRango <= RangoMax1MasterCard.ToString))
    OR ((segundoRango >= RangoMin2MasterCard.ToString) and (segundoRango <= RangoMax2MasterCard.ToString))  then
  begin
    isMastercard := true;
  end;
  Result := isMastercard;
end;

function isemisoraAmerican(numero: integer): boolean;
var
isAmerican: boolean;
Rango: String;
  I: Integer;
begin
  isAmerican :=false;
  //Obtengo los dos primeros numeros de la tarjeta
  Rango := numero.ToString[1] + numero.ToString[2];
  //Consulto si esta dentro del rango American
  if ((Rango >= RangoMinAmerican.ToString) and (Rango <= RangoMaxAmerican.ToString)) then
  begin
    isAmerican := true;
  end;
  Result := isAmerican;
end;

function isemisoraMaestro(numero: integer): boolean;
var
isMaestro: boolean;
Rango: String;
  I: Integer;
begin
  isMaestro :=false;
  //Obtengo los dos primeros numeros de la tarjeta
  Rango := numero.ToString[1] + numero.ToString[2];
  //Consulto si esta dentro del rango maestro
  if ((Rango >= RangoMinMaestro.ToString) and (Rango <= RangoMaxMaestro.ToString)) OR
      (Rango = RangoMaestro.ToString) then
  begin
    isMaestro := true;
  end;
  Result := isMaestro;
end;

//-----------------

//---------------------------------------------
// Funciones y procedimientos propios del objeto
//---------------------------------------------

// Funcion validar numero de tarjeta
function Tarjeta.validarNro: boolean;
var
  digitos: Vector;
  suma: Integer;
  valida: boolean;
begin
  valida := false;
  cargarDigitosEnVector(digitos, numero);
  DuplicarPares(digitos);
  suma := sumarDigitos(digitos);
  if (suma MOD 10) = 0 then
  begin
    valida := true;
  end;
end;

//Funcion que me dice cual es la emisora de la tajeta
procedure Tarjeta.EntidadEmisora();
var Resultado: String;
begin
    if isEmisoraVisa(numero) then
    begin
      emisora:= Entidades.Visa;
    end
    else if isemisoraMastercard(numero) then
    begin
      emisora:= Entidades.Mastercard;
    end
    else if isemisoraAmerican(numero) then
    begin
      emisora := Entidades.American_Express;
    end
    else if isemisoraMaestro(numero) then
    begin
      emisora := Entidades.Maestro;
    end
    else
    begin
      emisora := Entidades.INVALIDA;
    end;
end;

// Funcion que carga la tarjeta en el TAD
function Tarjeta.cargarTarjeta(tarjetaACargar: Integer; vencimiento: TDate): boolean;
var
  cargada: boolean;
begin
  cargada := false;
  // Si tiene la cantidad de digitos permitidos, la cargo
  if ((length(tarjetaACargar.ToString)) = digitos) then
  begin
    numero := tarjetaACargar;
    fecha_vencimiento := vencimiento;
    limite_creditos := limites;
    limite_creditos_cuotas := limitesCuotas;
    cargada := true;
    entidadEmisora();
  end;
  Result := cargada;
end;

//Getter para obtener la entidad emisora de la tarjeta
function Tarjeta.getEntidadEmisora(): String;
var entidad: String;
begin
  case emisora of //Estuve leyendo y es la unica manejar de transformar el enumerado a String en Delphi
    Entidades.Visa: entidad := 'Visa';
    Entidades.Mastercard: entidad := 'MasterCard';
    Entidades.American_Express: entidad := 'American Express';
    Entidades.Maestro: entidad := 'Maestro';
    Entidades.INVALIDA: entidad := 'Invalida';
  end;
  Result := entidad;
end;

//Obtener los limites de compra de la tarjeta
function Tarjeta.MostrarLimites(): String;
begin
  Result := 'Una cuota: ' + limite_creditos.ToString + #13#10 + 'En cuotas: ' + limite_creditos_cuotas.ToString;
end;

//Procedimiento si la persona paga en una sola cuota
procedure Tarjeta.pagoEnUnaCuota(valorCompra: integer);
begin
    {
  Una vez aceptado el movimiento,
  se debe reducir el límite de crédito
  en una cuota teniendo en cuenta que si la
  tarjeta es una Visa o una American Express
  se descuenta el 80% del monto, en el resto de
  las tarjetas se descuenta el monto completo}
  if isemisoraVisa(numero) or isemisoraAmerican(numero)  then
  begin
    limite_creditos := limite_creditos - (valorCompra*80/100); //Se trunca el valor (CAMBIAR)
  end
  else
  begin
    limite_creditos := limite_creditos - valorCompra;
  end;
end;

//Procedimiento si la persona paga en cuotas
procedure Tarjeta.pagarEnCuotas(valorCompra,cantCuotas: Integer);
var
i,descuento: integer;
valorEnCuotas: extended;
begin
  {
  En cambio si se trata de una compra en cuotas, todas las tarjetas descuentan,
  en compras hasta 6 cuotas, el 90% del monto adeudado (cuotas de la 2da en adelante)
  al limite de compras en cuotas, y descuentan del límite de compras en una cuota el monto
  de la primera cuota. En compras de más de 6 cuotas es igual, salvo que descuentan sólo el 70%
  de las cuotas adeudas del limite de compra en cuotas.}
  if cantCuotas <= 6 then
  begin
    descuento := 90;
  end
  else
  begin
    descuento := 70;
  end;
  valorEnCuotas := valorCompra/cantCuotas;
  limite_creditos := limite_creditos - (valorEnCuotas);
  limite_creditos_cuotas := limite_creditos_cuotas - (valorEnCuotas); //Primera cuota
  limite_creditos_cuotas := limite_creditos_cuotas - (((valorEnCuotas)*descuento/100) * (CantCuotas - 1)); //A partir de la segunda cuota

end;

//Funcion que realiza la compra
function Tarjeta.Comprar(valorCompra,cantCuotas: Integer; cuotas: boolean): Boolean;
var compra: boolean;
isVencida: integer;
begin
  {Valio si se puede hacer la compra:
  .Que el numero sea valido
  .Que no este vencida
  .Que el valor de compra no supere el limite estipulado}
  isVencida := CompareDate(fecha_vencimiento, now());
  if ValidarNro() and ((isVencida = 1) or (isVencida = 0)) and
    ((valorCompra < limite_creditos) or (valorCompra < limite_creditos_cuotas))  then
  begin
    //Movimiento aceptado
    if cuotas then //PAGA EN CUOTAS
    begin
      pagarEnCuotas(valorCompra,cantCuotas);
    end
    else //PAGO EN UNA SOLA CUOTA
    begin
      pagoEnUnaCuota(valorCompra);
    end;
    compra:= true;
  end
  else
  begin
    //Movimiento cancelado
    compra:= false;
  end;
  Result:= compra;
end;

end.
