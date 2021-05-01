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
      function conseguirLugar() : integer;
      procedure guardarAuto(patente, entrada, salida: string; lugar: integer);
//      function calcularPago() : String;
      procedure cargarEstacionamiento();      
End;

implementation


procedure Estacionamiento.cargarEstacionamiento();
var I: integer;
begin 
  for I := min to max do begin
    Autos[I].estacionado := False;
  end;
end;

function Estacionamiento.conseguirLugar() : integer;
var I: integer;
begin
  Result := -1;
  for I := min to max do begin
    if Autos[I].estacionado = False then begin
      Result := I;
      exit;
    end;
  end;
end;

procedure Estacionamiento.guardarAuto(patente, entrada, salida: string; lugar: integer);
begin
  Autos[lugar].estacionado := True;
  Autos[lugar].patente := patente;
  Autos[lugar].horarioEntrada := entrada;
  Autos[lugar].horarioSalida := salida;  
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
