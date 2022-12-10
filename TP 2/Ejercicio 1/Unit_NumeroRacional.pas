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
      function potencia(numero2: NumeroRacional): double;
      function comparar(numero2: NumeroRacional): String;
  end;

implementation

procedure NumeroRacional.setNumero(nro: Double);
begin
  numero := nro;
end;

function NumeroRacional.getNumero: Double;
begin
  getNumero := numero;
end;

function NumeroRacional.sumar(numero2: NumeroRacional): Double;
begin
   sumar := numero + numero2.getNumero;
end;

function NumeroRacional.restar(numero2: NumeroRacional): Double;
begin
   restar := numero - numero2.getNumero;
end;

function NumeroRacional.multiplicar(numero2: NumeroRacional): Double;
begin
  multiplicar := numero * numero2.getNumero;
end;

function NumeroRacional.dividir(numero2: NumeroRacional): Double;
begin
  if numero2.getNumero <> 0 then
  begin
    dividir := numero / numero2.getNumero;
  end;
end;

function NumeroRacional.potencia(numero2: NumeroRacional): Double;
begin
  potencia := Power(numero,numero2.getNumero);
end;

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
