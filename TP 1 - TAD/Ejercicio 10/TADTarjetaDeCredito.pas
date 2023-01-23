unit TADTarjetaDeCredito;

interface

uses
  System.SysUtils;

const
  digitos = 4;
  limites = 5;
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
  Tarjeta = Object
  private
    numero: Integer;
    fecha_vencimiento: TDate;
    limite_creditos: Integer;
  public
    function cargarTarjeta(tarjetaACargar: Integer; vencimiento: TDate)
      : boolean;
    function validarNro(): boolean;
    function mostrarLimite(): Integer;
    function EntidadEmisora(): String;
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
  if (suma MOD 8) = 0 then
  begin
    valida := true;
  end;
end;

//Funcion que me dice cual es la emisora de la tajeta
function Tarjeta.EntidadEmisora(): String;
var Resultado: String;
begin
    if isEmisoraVisa(numero) then
    begin
      Resultado := 'Visa';
    end
    else if isemisoraMastercard(numero) then
    begin
      Resultado := 'Mastercard';
    end
    else if isemisoraAmerican(numero) then
    begin
      Resultado := 'American Express';
    end
    else if isemisoraMaestro(numero) then
    begin
      Resultado := 'Maestro';
    end
    else
    begin
      Resultado := 'No valida';
    end;
  Result := Resultado;
end;

// Funcion que carga la tarjeta en el TAD
function Tarjeta.cargarTarjeta(tarjetaACargar: Integer;
  vencimiento: TDate): boolean;
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
    cargada := true;
  end;
  Result := cargada;
end;

// Funcion que muestra el limite de compras
function Tarjeta.mostrarLimite(): Integer;
begin
  Result := limite_creditos;
end;

end.
