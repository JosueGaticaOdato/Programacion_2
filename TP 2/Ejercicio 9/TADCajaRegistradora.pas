unit TADCajaRegistradora;

interface

Uses
  SysUtils, Math;

const
  Billetes : Array [1..15] of Real = (0.01,0.05,0.10,0.25,0.50,1,2,5,10,20,50,100,200,500,1000);

type
  CajaRegistradora = Object
  //Defini los datos
    private
      //Este dato es un vector donde guardo los valores de los billetes y monedas
      Cantidades : Array [1..15] of Integer;
    public
      procedure Determinar_billetes_monedas();
      function Cargar_Billetes(Valor_a_cargar, Cantidad: Integer): Boolean;
      function Devuelve_billete(Posicion: Integer): Integer;
      function Devuelve_cantidad_billete(Posicion: Integer): Integer;
      function EstadoYSaldo(): Extended;
  end;

implementation

//Procedimiento que declara los valores de las monedas y billetes
//vigentes en la republica argentina
procedure CajaRegistradora.Determinar_billetes_monedas();
var i:Integer;
begin
  for i in Cantidades do
  begin
    Cantidades[i] := 0;
  end;
end;

{//Funcion que realizar la carga de billetes
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
}
end.
