unit estacionamientoTAD;

interface

const
  tarifaHora = 50;
  mediaEstadia = 350;
  estadiaCompleta = 800;
  min = 0;
  max = 50;

type
  Auto = Record
    patente: string;
    //horarioEntrada: integer;
    //horarioSalida: integer;
    horarioEntrada: String;
    horarioSalida: String;
    estacionado: boolean;
  End;


type
  Estacionamiento = Object
    private
      Autos: Array[min..max] of Auto;
    public
      procedure cargarEstacionamiento();
      function conseguirLugar() : integer;
      function guardarAuto(patente, entrada, salida: string; lugar: integer) : Auto;

      //      function calcularPago() : String;
End;

implementation

//cargo el campo "estacionado" de todos los elementos del vector con False (para indicar que están libres para estacionar)
procedure Estacionamiento.cargarEstacionamiento();
var I: integer;
begin
  for I := min to max do begin
    Autos[I].estacionado := False;
  end;
end;

//devuelve el lugar que esté libre sino devuelve -1
function Estacionamiento.conseguirLugar() : integer;
var I: integer;
begin
  I := 0;

  while (Autos[I].estacionado = True) and (I <= max) do begin
    I := I + 1;
  end;

  if I > 50 then begin
    Result := -1;
  end
  else begin
    Result := I;
  end;

end;

//guarda en el vector los datos del auto que va a estacionar en el lugar indicado
function Estacionamiento.guardarAuto(patente, entrada, salida: string; lugar: integer) : Auto;
begin
  Autos[lugar].estacionado := True;
  Autos[lugar].patente := patente;
  Autos[lugar].horarioEntrada := entrada;
  Autos[lugar].horarioSalida := salida;
  Result := Autos[lugar];
end;


//function Estacionamiento.calcularPago() : String;
//var horas: integer;
//begin
//  if (Auto.horarioSalida - Auto.horarioEntrada) > 600 then begin
//    Result := estadiaCompleta;
//  end
//  else if ((Auto.horarioSalida - Auto.horarioEntrada) > 300)  and ((Auto.horarioSalida - Auto.horarioEntrada) < 600) then begin
//    Result := mediaEstadia;
//  end
//  else begin
//    horas := (Auto.horarioSalida - Auto.horarioEntrada);
//
//  end;
//
//
//end;

end.
