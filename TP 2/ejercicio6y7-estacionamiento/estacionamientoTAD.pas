unit estacionamientoTAD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, DateUtils, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, Vcl.WinXPickers, Math;

const
//numeros aleatorios para tarifa
  tarifaHora = 50;
  mediaEstadia = 350;
  estadiaCompleta = 800;
  min = 1;
  max = 50;
  Error = -1;
  largoPatente = 7;
  horaEstCompleta = 6;
  horaEstMedia = 3;


type
  Auto = Record
    patente: string;
    fechaEntrada: TDateTime;
    horarioEntrada: TTime;
    estacionado: boolean;
  End;

  Estacionamiento = Object
    private
      Autos: Array[min..max] of Auto;

    public
      function mostrarAuto(lugar: integer) : string;
      function conseguirLugar() : integer;
      procedure cargarEstacionamiento();
      function validarPatente(patente: string) : boolean;
      procedure guardarAuto(patente: string; horaEntrada: TTime; fEntrada: TDate; lugar: integer);
      function buscarPatente(patente: string) : integer;
      function buscarPatenteRepetida(patente: string) : boolean;
      procedure sacarAuto(posicion: integer);
      function calcularPago(lugar: integer; fechaSalida: TDateTime) : double;
End;

implementation

//muestra en pantalla los datos del auto ingresado
function Estacionamiento.mostrarAuto(lugar: integer) : string;
var mostrar: string;
begin
  mostrar := 'Auto ingresado.' + #13#10 + 'Patente: ' + Autos[lugar].patente + #13#10 +
  'Hora de ingreso: ' + timeToStr(Autos[lugar].horarioEntrada) + #13#10 +
  'Fecha de ingreso: ' + datetostr(Autos[lugar].fechaEntrada);

  Result := mostrar;
end;

//VALIDAR
function Estacionamiento.validarPatente(patente: string) : boolean;
var I: integer;
    bool: boolean;
begin
  //V := Parsing(patente,' ');
//  patente.Split
  bool := True;
  I := 1;
  if Length(patente) <> largoPatente then
  begin
    bool := False;
  end;
  while (bool) and (I < largoPatente) do
  begin
    if ((I >= 1) and (I <= 2)) or ((I >= 6) and (I <= 7)) then
    begin
      if ((Ord(patente[I]) < Ord('a')) and (Ord(patente[I]) > Ord('z'))) or ((Ord(patente[I]) < Ord('A')) and (Ord(patente[I]) > Ord('Z'))) then
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

//-------------------------------------------------

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

//GUARDAR

//guarda en el vector los datos del auto que va a estacionar en el lugar indicado
procedure Estacionamiento.guardarAuto(patente: string; horaEntrada: TTime; fEntrada: TDate; lugar: integer);
begin
  Autos[lugar].estacionado := True;
  Autos[lugar].patente := patente;
  Autos[lugar].horarioEntrada := horaEntrada;
  Autos[lugar].fechaEntrada := fEntrada;
end;

//RETIRAR

function Estacionamiento.buscarPatente(patente: string) : integer;
var I: integer;
    posicion: integer;
    encontrado: boolean;
begin
  I := 1;
  encontrado := False;
  posicion := Error;

  while (not encontrado) and (I <= max) do
  begin
    if Autos[I].patente = patente then
    begin
      encontrado := True;
      posicion := I;
    end;
    I := I + 1;
  end;

  Result := posicion;
end;

procedure Estacionamiento.sacarAuto(posicion: integer);
begin
    //si encontró la patente del auto lo "saca" del estacionamiento
  if posicion <> Error then
  begin
    Autos[posicion].estacionado := False;
    Autos[posicion].patente := '';
  end;
end;

function Estacionamiento.buscarPatenteRepetida(patente: string) : boolean;
var I: integer;
    posicion: integer;
    encontrado: boolean;
begin
  I := 1;
  encontrado := False;
  posicion := Error;

  while (not encontrado) and (I <= max) do
  begin
    if Autos[I].patente = patente then
    begin
      encontrado := True;
      posicion := I;
    end;
    I := I + 1;
  end;

  Result := encontrado;
end;

function Estacionamiento.calcularPago(lugar: integer; fechaSalida: TDateTime) : double;
var diferencia, tarifa: double;
    fechaEntrada: TDateTimePicker;
    horaEntrada: TTimePicker;
    entrada: string;
begin
  entrada := DateToStr(Autos[lugar].fechaEntrada) + ' ' + timeToStr(Autos[lugar].horarioEntrada);
  diferencia := hourSpan(fechaSalida,strToDateTime(entrada));
  diferencia := Round(diferencia);
  if diferencia > horaEstCompleta then
  begin
    tarifa := estadiaCompleta;
  end
  else if (diferencia > horaEstMedia)  and (diferencia < horaEstCompleta) then begin
    tarifa := mediaEstadia;
  end
  else begin
    tarifa := diferencia * tarifaHora;

  end;

  Result := tarifa;
end;

end.
