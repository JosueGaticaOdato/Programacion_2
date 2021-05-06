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
      function Cargar_Billetes(Valor_a_cargar: Real; Cantidad: Integer): Boolean;
      function EstadoYSaldo(): Extended;
      function Devuelve_billete(Posicion: Integer): Real;
      function Devuelve_cantidad_billete(Posicion: Integer): Integer;
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

//Funcion que realizar la carga de billetes
function CajaRegistradora.Cargar_Billetes(Valor_a_cargar: Real; Cantidad: Integer): Boolean;
var i: Integer;
  Cargado: Boolean;
begin
  i := 1;
  Cargado := True;
  //Mientras no se halla cargado el valor y no se halla recorrido todo el vector
  while (Cargado) and (i <= Length(Cantidades))do
  begin
    //Si el billete en el vector es el mismo del que se desea agregar
    if Billetes[i] = Valor_a_cargar then
    begin
      //Cargo en el vector cantidad cuantos billetes de ese tipo se van a cargar
      Cantidades[i] := Cantidades[i] + Cantidad;
      //Pongo la bandera en falso para que termine el ciclo
      Cargado := False;
    end;
  i := i + 1
  end;
  //Retorno la bandera
  Cargar_Billetes := Cargado;
end;


//Funcion que realiza la suma de billetes y monedas
function CajaRegistradora.EstadoYSaldo(): Extended;
var  i: Integer;
  Sumador: Extended;
begin
  Sumador := 0;
  //Realizo la suma
  for i := 1 to Length(Cantidades) do
  begin
    //Multiplico el billete por la cantidad que hay
    Sumador := Sumador + (Billetes[i] * Cantidades[i]);
  end;
  //Devuelvo el total
  EstadoYSaldo := Sumador;
end;

//Estan 4 funciones son usadas para devolver billete, moneda y sus cantidad
//para mostrarlo en el memo
function CajaRegistradora.Devuelve_billete(Posicion: Integer): Real;
  begin
    Devuelve_billete := Billetes[Posicion];
  end;

function CajaRegistradora.Devuelve_cantidad_billete(Posicion: Integer): Integer;
  begin
    Devuelve_cantidad_billete := Cantidades[Posicion];
  end;

end.
