unit TADCajaRegistradora;

interface

Uses
  SysUtils, Math;

Const
  //Definio las constantes Max para la definicion del vector billete y moneda
  Min = 1;
  Max_Billete = 7;
  Max_Moneda = 9;

type
  CajaRegistradora = Object
  //Defini los datos
    private
      //Este dato es un vector donde guardo los valores de los billetes
      Billetes : Array [Min..Max_Billete] of Integer;
      //En este vector guardo la cantidad de cada billete
      Cantidad_Billetes : Array [Min..Max_Billete] of Integer;
      //En este vector estan los valores de las monedas vigentes
      Monedas : Array [Min..Max_Moneda] of Double;
      //Aca estan las cantidad presentes de cada moneda
      Cantidad_Monedas : Array [Min..Max_Moneda] of Integer;
      //Tanto los vectores de cantidad y los valores, tanto de billetes y monedas,
      //funcionan como vectores apareados
    public
      procedure Determinar_billetes_monedas();
      function Cargar_Billetes(Valor_a_cargar, Cantidad: Integer): Boolean;
      function Cargar_Monedas(Valor_a_cargar : Double; Cantidad: Integer): Boolean;
      function Devuelve_billete(Posicion: Integer): Integer;
      function Devuelve_cantidad_billete(Posicion: Integer): Integer;
      function Devuelve_moneda(Posicion: Integer): Double;
      function Devuelve_cantidad_moneda(Posicion: Integer): Integer;
      function EstadoYSaldo(): Extended;
  end;

implementation

//Procedimiento que declara los valores de las monedas y billetes
//vigentes en la republica argentina
procedure CajaRegistradora.Determinar_billetes_monedas();
var i:Integer;
begin
  i := 1;
  //Billete de 10 pesos y moneda de 1 centavo
  Billetes[i] :=  10;
  Monedas[i] := 0.01;
  i := i + 1;
  //Billete de 20 y moneda de 5 centavos
  Billetes[i] :=  20;
  Monedas[i] := 0.5;
  i := i + 1;
  //Billete de 50 pesos y moneda de 10 centavos
  Billetes[i] :=  50;
  Monedas[i] := 0.10;
  i := i + 1;
  //Billete de 100 pesos y moneda de 25 centavos
  Billetes[i] :=  100;
  Monedas[i] := 0.25;
  i := i + 1;
  //Billete de 200 pesos y moneda de 50 centavos
  Billetes[i] :=  200;
  Monedas[i] := 0.50;
  i := i + 1;
  //Billete de 500 pesos y moneda de 1 peso
  Billetes[i] :=  500;
  Monedas[i] := 1;
  i := i + 1;
  //Billete de 1000 pesos y moneda de 2 peso
  Billetes[i] :=  1000;
  Monedas[i] := 2;
  i := i + 1;
  //Moneda 5 pesos
  Monedas[i] := 5;
  i := i + 1;
  //Moneda 10 pesos
  Monedas[i] := 10;
end;

//Funcion que realizar la carga de billetes
function CajaRegistradora.Cargar_Billetes(Valor_a_cargar, Cantidad: Integer): Boolean;
var i: Integer;
  Cargado: Boolean;
begin
  i := 1;
  Cargado := True;
  //Mientras no se halla cargado el valor y no se halla recorrido todo el vector
  while (Cargado) and (i <= Length(Billetes))do
  begin
    //Si el billete en el vector es el mismo del que se desea agregar
    if Billetes[i] = Valor_a_cargar then
    begin
      //Cargo en el vector cantidad cuantos billetes de ese tipo se van a cargar
      Cantidad_Billetes[i] := Cantidad_Billetes[i] + Cantidad;
      //Pongo la bandera en falso para que termine el ciclo
      Cargado := False;
    end;
  i := i + 1
  end;
  //Retorno la bandera
  Cargar_Billetes := Cargado;
end;

//Funcion que realizar la carga de monedas
function CajaRegistradora.Cargar_Monedas(Valor_a_cargar : Double; Cantidad: Integer): Boolean;
var i: Integer;
  Cargado: Boolean;
begin
  //Funciona de la misma forma que los billetes, solamente que es con monedas
  i := 1;
  Cargado := True;
  while (Cargado) and (i <= Length(Monedas))do
  begin
    if Monedas[i] = Valor_a_cargar then
    begin
      Cantidad_Monedas[i] := Cantidad_Monedas[i] + Cantidad;
      Cargado := False;
    end;
  i := i + 1
  end;
  Cargar_Monedas := Cargado;
end;

//Funcion que realiza la suma de billetes y monedas
function CajaRegistradora.EstadoYSaldo(): Extended;
var Sumador_Billetes, i: Integer;
  Sumador_Monedas, Total: Extended;
begin
  Sumador_Monedas := 0;
  Sumador_Billetes := 0;
  //Realizo la suma de billetes
  for i := Min to Max_Billete do
  begin
    //Multiplico el billete por la cantidad que hay
    Sumador_Billetes := Sumador_Billetes + (Billetes[i] * Cantidad_Billetes[i]);
  end;
  //Realizo la suma de monedas
  for i := Min to Max_Moneda do
  begin
    //Multiplico la moneda por la cantidad que hay
    Sumador_Monedas := Sumador_Monedas + (Monedas[i] * Cantidad_Monedas[i]);
  end;
  //Sumo el total de billetes y monedas
  Total := Sumador_Billetes + Sumador_Monedas;
  //Devuelvo el total
  EstadoYSaldo := Total;
end;

//Estan 4 funciones son usadas para devolver billete, moneda y sus cantidad
//para mostrarlo en el memo
function CajaRegistradora.Devuelve_billete(Posicion: Integer): Integer;
  begin
    Devuelve_billete := Billetes[Posicion];
  end;

function CajaRegistradora.Devuelve_cantidad_billete(Posicion: Integer): Integer;
  begin
    Devuelve_cantidad_billete := Cantidad_Billetes[Posicion];
  end;

function CajaRegistradora.Devuelve_moneda(Posicion: Integer): Double;
  begin
    Devuelve_moneda := Monedas[Posicion];
  end;

function CajaRegistradora.Devuelve_cantidad_moneda(Posicion: Integer): Integer;
  begin
    Devuelve_cantidad_moneda := Cantidad_Monedas[Posicion];
  end;

end.
