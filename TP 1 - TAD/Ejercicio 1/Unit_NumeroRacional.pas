unit Unit_NumeroRacional;

interface

uses
  System.Math;

type
  //Objeto NumeroRacioanl
  NumeroRacional = object
  //Atributo
    private
      numero: double;
  //Comportamieento
    public
      procedure setNumero(nro: double);
      function getNumero(): double;
      function sumar(numero2: NumeroRacional): double;
      function restar(numero2: NumeroRacional): double;
      function multiplicar(numero2: NumeroRacional): double;
      function dividir(numero2: NumeroRacional): double;
      function potencia(numero2: NumeroRacional): integer;
      function comparar(numero2: NumeroRacional): String;
  end;

implementation

//Set que me coloca el numero
procedure NumeroRacional.setNumero(nro: Double);
begin
  numero := nro;
end;

//Get que me devuelve el valor del numero
function NumeroRacional.getNumero: Double;
begin
  getNumero := numero;
end;

//Funcion que suma dos numeros racionales y me devuelve un racional
function NumeroRacional.sumar(numero2: NumeroRacional): Double;
begin
   sumar := numero + numero2.getNumero;
end;

//Funcion que resta dos numeros racionales y me devuelve un racional
function NumeroRacional.restar(numero2: NumeroRacional): Double;
begin
   restar := numero - numero2.getNumero;
end;

//Funcion que multiplica dos numeros racionales y me devuelve un racional
function NumeroRacional.multiplicar(numero2: NumeroRacional): Double;
begin
  multiplicar := numero * numero2.getNumero;
end;

//Funcion que divide dos numeros racionales y me devuelve un racional
function NumeroRacional.dividir(numero2: NumeroRacional): Double;
begin
  if numero2.getNumero <> 0 then
  begin
    dividir := numero / numero2.getNumero;
  end;
end;

//Funcion que realiza la potencia dos numeros racionales y me devuelve un racional
function NumeroRacional.potencia(numero2: NumeroRacional): Integer;
begin
  potencia := Trunc(Power(Trunc(numero),Trunc(numero2.getNumero)));
end;

//Funcion que compara dos numeros racionales y me devuelve si es mayor, menor o igual
function NumeroRacional.comparar(numero2: NumeroRacional): String;
var resultado: String;
begin
  if numero > numero2.getNumero then
  begin
    resultado := 'Mayor';
  end
  else if numero < numero2.getNumero then
  begin
    resultado := 'Menor';
  end
  else
  begin
    resultado := 'Igual';
  end;
  comparar := resultado;
end;

end.
