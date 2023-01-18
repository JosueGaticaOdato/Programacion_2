unit TADCajaRegistradora;

interface

Uses
  SysUtils, Math;

const
  //Billetes contiene el valor de cada billete,
  //funciona como vector apareado de cantidades
  Billetes : Array [1..15] of Real = (0.01,
    0.05,0.10,0.25,0.50,1,2,5,10,20,50,100,200,500,1000);
  //Tamaño de billetes y cantidades
  Tamaño = 15;
  Error_Caja = 'La caja no cuenta con dinero suficiente';

type
  //Este vecto es utilizado para calcular el vuelto, a la hora de devolver las
  //cantidades de cada billete que se le debe dar al cliente
  Vector_Vuelto = Array [1..15] of Integer;

  CajaRegistradora = Object
    private
      //Vector donde guardo los valores de los billetes y monedas
      Cantidades : Array [1..15] of Integer;
    public
      procedure Determinar_billetes_monedas();
      function Cargar_Billetes(Valor_a_cargar: Real; Cantidad: Integer): Boolean;
      function EstadoYSaldo(): Extended;
      function Devuelve_billete(Posicion: Integer): Real;
      function Devuelve_cantidad_billete(Posicion: Integer): Integer;
      procedure Carga_Billetes_Cliente(Cantidad_001, Cantidad_005, Cantidad_010, Cantidad_025, Cantidad_050, Cantidad_1, Cantidad_2, Cantidad_5, Cantidad_10, Cantidad_20, Cantidad_50, Cantidad_100, Cantidad_200, Cantidad_500, Cantidad_1000: string);
      procedure Cargar_Plata_Cliente(Plata_Cliente:CajaRegistradora);
      function Calcular_Vuelta(Vuelto: Real): Vector_Vuelto;
      function Mostrar_Vuelto(Vector: Vector_Vuelto; Diferencia:Real): string;
  end;

implementation

//Este procedimiento inicializa la cantidad de cada billete en 0
procedure CajaRegistradora.Determinar_billetes_monedas();
var i:Integer;
begin
  for i in Cantidades do
  begin
    Cantidades[i] := 0;
  end;
end;

//Este procedure resetea el vector de vuelto para evitar valores extraños
procedure ResetVector(var Vector: Vector_Vuelto);
var i: Integer;
begin
  for i := 1 to Tamaño do
  begin
    Vector[i] := 0;
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

//-----------------------------------------------

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

//Estas 2 funciones son usadas para devolver billete, moneda y sus cantidad
//para mostrarlo en el memo
function CajaRegistradora.Devuelve_billete(Posicion: Integer): Real;
  begin
    Devuelve_billete := Billetes[Posicion];
  end;

function CajaRegistradora.Devuelve_cantidad_billete(Posicion: Integer): Integer;
  begin
    Devuelve_cantidad_billete := Cantidades[Posicion];
  end;

//-----------------------------------------------

//Este procedure realiza la carga de billetes del cliente en un TAD
// de tipo caja registradora (que no es la caja principal)
procedure CajaRegistradora.Carga_Billetes_Cliente(Cantidad_001, Cantidad_005, Cantidad_010, Cantidad_025, Cantidad_050, Cantidad_1, Cantidad_2, Cantidad_5, Cantidad_10, Cantidad_20, Cantidad_50, Cantidad_100, Cantidad_200, Cantidad_500, Cantidad_1000: string);
begin
  Cantidades[1] := strtoint(Cantidad_001);
  Cantidades[2] := strtoint(Cantidad_005);
  Cantidades[3] := strtoint(Cantidad_010);
  Cantidades[4] := strtoint(Cantidad_025);
  Cantidades[5] := strtoint(Cantidad_050);
  Cantidades[6] := strtoint(Cantidad_1);
  Cantidades[7] := strtoint(Cantidad_2);
  Cantidades[8] := strtoint(Cantidad_5);
  Cantidades[9] := strtoint(Cantidad_10);
  Cantidades[10] := strtoint(Cantidad_20);
  Cantidades[11] := strtoint(Cantidad_50);
  Cantidades[12] := strtoint(Cantidad_100);
  Cantidades[13] := strtoint(Cantidad_200);
  Cantidades[14] := strtoint(Cantidad_500);
  Cantidades[15] := strtoint(Cantidad_1000);
end;

//Este procedure realiza la carga de cantidad dentro del tad
procedure CajaRegistradora.Cargar_Plata_Cliente(Plata_Cliente:CajaRegistradora);
var i: Integer;
begin
  for I := 0 to Length(Cantidades) do
  begin
    Cantidades[i] := Cantidades[i] + Plata_Cliente.Cantidades[i];
  end;
end;

//Esta funcion realiza la carga en un vector de los billetes que se usan
//para devolverle al cliente
function CajaRegistradora.Calcular_Vuelta(Vuelto: Real): Vector_Vuelto;
var i: Integer;
  Vector_Gastos : Vector_Vuelto;
begin
  //Recorro el vector de mas grande a mas chico
  i := Tamaño;
  ResetVector(Vector_Gastos);//Reseteo el vector_gastos en caso de tener valores que no me sirvan
  //Mientras i siempre sea mayor o igual a 1, y el vuelto sea distintos de 0
  while (i >= 1) and (Vuelto <> 0) do
  begin
    //El billete es menor que el vuelto y la cantidad de ese billete es mayor a 0
    if (Billetes[i] <= Vuelto) and (Cantidades[i] > 0) then
    begin
      Vuelto := Vuelto - Billetes[i];//Al vuelto le resto el valor de ese billete
      Cantidades[i] := Cantidades[i] - 1;//Le resto a cantidades 1 porque uso ese billete como vuelto
      Vector_Gastos[i] := Vector_Gastos[i] + 1;
      //En el vector gastos, lo subo a 1
      //Eso quiere decir que, en la misma posicion del billete, tengo indicado que use a ese billete como vuelto
    end
    else
    begin
      //Resto 1 al indice
      i := i - 1;
    end;
  end;
  Result := Vector_Gastos;
end;

//Funcion es que utilizada para mostrar texto
function CajaRegistradora.Mostrar_Vuelto(Vector: Vector_Vuelto; Diferencia:Real): string;
var Texto : String;
  i: Integer;
  Hay_Plata: Boolean;
begin
  Hay_Plata := False;
  //El #13#10 es usado para hacer el salto de linea
  Texto := ('El vuelto es de: ' + floattostr(Diferencia) + ' pesos.' + #13#10);
  Texto := Texto + 'Hay que pagar de la siguiente manera:' + #13#10;
  for i := 1 to Tamaño do
    begin
      //Si el vector que contiene el vuelto es distinto de 0, quiere decir que use un billete de esos como vuelto
      if Vector[i] <> 0 then
      begin
        Hay_Plata := True;
        //Muestro el billete que use y su cantidad
        Texto := Texto + Vector[i].tostring + ' billete de '+ floattostr(Billetes[i])+ ' pesos.' + #13#10;
      end;
    end;
  if Hay_Plata = False then
  begin
    Texto := Error_Caja;
  end;
  Result := Texto;
end;
end.
