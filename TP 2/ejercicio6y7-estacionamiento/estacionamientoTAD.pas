unit estacionamientoTAD;

interface

const
  tarifaHora = 50;
  mediaEstadia = 350;
  estadiaCompleta = 800;
  min = 1;
  max = 50;
  Error = -1;
  largoPatente = 9;

type
  Auto = Record
    patente: string;
    //horarioEntrada: integer;
    //horarioSalida: integer;
    horarioEntrada: String;
    horarioSalida: String;
    estacionado: boolean;
  End;

  Estacionamiento = Object
    private
      Autos: Array[min..max] of Auto;
      function conseguirLugar() : integer;
    public
      procedure cargarEstacionamiento();
      function validarPatente(patente: string) : boolean;
      function guardarAuto(patente, entrada, salida: string; lugar: integer) : Auto;

      //      function calcularPago() : String;
End;

implementation

//Function Parsing(aSS: String; aSep: String): Vector;
//Var I: Integer;
//    P: Integer;
//    V: Vector;
//Begin
//  I := 0;
//  // Controlo que el ultimo caracter sea el separador, sino lo agrega
//  if aSS.Substring(aSS.Length,1) <> aSep then aSS := aSS + aSep;
//
//  // Hacemos el split
//  P := Pos(aSep, aSS);
//  while P > 0 do Begin
//    Inc(I);
//    SetLength(V, I);  // Se redimensiona el array y no se pierden los datos
//    V[I-1] := Copy(aSS, 1, P-1);
//    aSS := Copy(aSS, P+1, Length(aSS));
//    P := Pos(aSep, aSS);
//  End;
//
//  // Retorno el array
//  Parsing := V;
//End;

function Estacionamiento.validarPatente(patente: string) : boolean;
var I: integer;
    bool: boolean;
begin
  //V := Parsing(patente,' ');
//  patente.Split
  bool := True;
  I := 1;
  while (bool) and (I < largoPatente) do
  begin
    if ((I >= 1) and (I <= 2)) or ((I >= 8) and (I <= 9)) then
    begin
      if ((Ord(patente[I]) < Ord('a')) and (Ord(patente[I]) > Ord('z'))) or ((Ord(patente[I]) < Ord('A')) and (Ord(patente[I]) > Ord('Z'))) then
        begin
          bool := False;
        end;
    end
    else if (I = 3) or (I = 7) then
    begin
      if (Ord(patente[I]) <> Ord(' ')) then
      begin
        bool := False;
      end;
    end
    else
    begin
      if (Ord(patente[I]) < Ord('0')) or (Ord(patente[I]) > Ord('9')) then
      begin
        bool := False;
      end;
    end;
    I := I + 1;
  end;
  Result := bool;

end;

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
  I := Min;

  while (Autos[I].estacionado = True) and (I <= max) do begin
    I := I + 1;
  end;

  if I > max then begin
    Result := Error;
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
