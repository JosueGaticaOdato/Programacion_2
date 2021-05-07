unit estacionamientoTAD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, DateUtils, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, Vcl.WinXPickers, Math;

const
//numeros aleatorios para tarifa
//ACLARACION: Las tarifashora, mediaestadia y estadiacompleta las tomamos como
//ejemplo para llevar a cabo el ejercicio
  tarifaHora = 50;
  mediaEstadia = 350;
  estadiaCompleta = 800;
  //Minimo y maximo del estacionamiento
  min = 1;
  max = 50;
  LargoFechas = 30; //Valor de prueba
  Error = -1;
  //Largo fijo de una patente
  largoPatente = 7;
  //Cuanto es en horas la estadia completa y media
  horaEstCompleta = 6;
  horaEstMedia = 3;
  Salto_linea = #13#10;

//Defino auto de tipo record, que contendra tres campos
type
  Auto = Record
    patente: string;
    fechaEntrada: TDateTime;
    horarioEntrada: TTime;
    estacionado: boolean;
  End;


  Fechas = Record
    Fecha: TDate;
    TarifaHora: Real;
    MediaEstadia: Real;
    EstadiaCompleta: Real;
    Recaudado: Real;
    Calculado: Boolean;
  End;

  //Luego, se define el objjeto
  Estacionamiento = Object
    private
      //El objeto es un array de autos(record)
      Autos: Array[min..max] of Auto;
      Fechas_Estacionamiento: Array [min..LargoFechas] of Fechas;
    public
      function mostrarAuto(lugar: integer) : string;
      function conseguirLugar() : integer;
      procedure cargarEstacionamiento();
      function validarPatente(patente: string) : boolean;
      procedure guardarAuto(patente: string; horaEntrada: TTime; fEntrada: TDate; lugar: integer);
      procedure guardarAutoEnFile(fechaDeSalida: TDate; horarioDeSalida: TTime; tarifa: double; lugar: integer);
      function buscarPatente(patente: string) : integer;
      function buscarPatenteRepetida(patente: string) : boolean;
      procedure sacarAuto(posicion: integer);
      function calcularPago(lugar: integer; fechaSalida: TDate) : double;
      function ConseguirLugarVacioFecha(FechaSalida: TDate) : integer;
      function Mostrar_Contenido_Fecha(Fecha: TDateTime): String;
      procedure Calcular_Total_Dia();
      function Mostrar_Recaudado_En_Rango(FechaInicio, FechaFin: TDateTime): string;
      function Buscar_Fecha(Fecha: TDate): Integer;
End;

Vehiculos = File of Auto;

implementation

//muestra en pantalla los datos del auto ingresado
function Estacionamiento.mostrarAuto(lugar: integer) : string;
var mostrar: string;
begin
  //EL #13#10 es utilizado para hacer el salto de linea en delphi
  mostrar := 'Auto ingresado.' + Salto_linea + 'Patente: ' + Autos[lugar].patente + Salto_linea +
  'Hora de ingreso: ' + timeToStr(Autos[lugar].horarioEntrada) + Salto_linea +
  'Fecha de ingreso: ' + datetostr(Autos[lugar].fechaEntrada);
  //Devuelve el string
  Result := mostrar;
end;

//VALIDAR PATENTE
function Estacionamiento.validarPatente(patente: string) : boolean;
var I: integer;
    bool: boolean;
begin
  bool := True;
  I := 1;
  //Si la patente es mayor al largo permitido por la patente, devuelve false directamente
  if Length(patente) <> largoPatente then
  begin
    bool := False;
  end;
  //Si pasa la prueba de la patente, vemos su contenido
  //La patente tiene que ser del tipo:
  //AS123CD (Patente)
  //1234567 (Indice)
  while (bool) and (I < largoPatente) do
  begin
    //Si en las posiciones 1,2,6 y 7 no hay letras, devuelve falso
    if ((I >= 1) and (I <= 2)) or ((I >= 6) and (I <= 7)) then
    begin
      if ((Ord(patente[I]) < Ord('a')) and (Ord(patente[I]) > Ord('z'))) or ((Ord(patente[I]) < Ord('A')) and (Ord(patente[I]) > Ord('Z'))) then
        begin
          bool := False;
        end;
    end
    else
    begin
      //En las posiciones restantes, tiene que haber numeros
      if (Ord(patente[I]) < Ord('0')) or (Ord(patente[I]) > Ord('9')) then
      begin
        bool := False;
      end;
    end;
    I := I + 1;
  end;
  //Devuelve verdadero si la patente es correcta
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

//-------------------------------------------------

//GUARDAR AUTO

//devuelve el lugar que esté libre sino devuelve -1
function Estacionamiento.conseguirLugar() : integer;
var I: integer;
  Resultado: Integer;
begin
  I := Min;
  //Recorre los estacionamientos para averiguar si hay lugar
  while (Autos[I].estacionado = True) and (I <= max) do begin
    I := I + 1;
  end;

  if I > max then begin
    Resultado := Error;
  end
  else begin //Si hay lugar, quiere decir que Estacionado = False, por lo tanto, paso el lugar
    Resultado := I;
  end;
  Result := Resultado;
end;

//En caso de querer guardar un auto con la misma patente, chequeo
function Estacionamiento.buscarPatenteRepetida(patente: string) : boolean;
var I: integer;
    posicion: integer;
    encontrado: boolean;
begin
  I := 1;
  encontrado := False;
  posicion := Error;
  //Esta funcion hace lo mismo que el buscar auto, solamente que tiene devuelve
  //False si no hay un auto repetido en el estacionamiento
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

//guarda en el vector los datos del auto que va a estacionar en el lugar indicado
procedure Estacionamiento.guardarAuto(patente: string; horaEntrada: TTime; fEntrada: TDate; lugar: integer);
begin
  Autos[lugar].estacionado := True;
  Autos[lugar].patente := patente;
  Autos[lugar].horarioEntrada := horaEntrada;
  Autos[lugar].fechaEntrada := fEntrada;
end;

procedure Estacionamiento.guardarAutoEnFile(fechaDeSalida: TDate; horarioDeSalida: TTime; tarifa: double; lugar: integer);
var fileVehiculos: Vehiculos;
//    registro: Auto;
begin
  AssignFile(fileVehiculos,'..\Vehiculos.dat');

  if not FileExists('..\Vehiculos.dat') then
  begin
    Rewrite(fileVehiculos);
    CloseFile(fileVehiculos);
  end;

  Reset(fileVehiculos);

  Write(fileVehiculos, Autos[lugar].patente);
  Write(fileVehiculos, Autos[lugar].fechaEntrada);
  Write(fileVehiculos, Autos[lugar].horarioEntrada);
  Write(fileVehiculos, fechaDeSalida);
  Write(fileVehiculos, horarioDeSalida);
  Write(fileVehiculos, tarifa);

  CloseFile(fileVehiculos);
end;

//-------------------------------------------------

//RETIRAR AUTO

//Esta funcion me devuelve el lugar que ocupa el auto a buscar
function Estacionamiento.buscarPatente(patente: string) : integer;
var I: integer;
    posicion: integer;
    encontrado: boolean;
begin
  //Inicializo variables
  I := 1;
  encontrado := False;
  posicion := Error;
  //Mientras no se halla encontrado...
  while (not encontrado) and (I <= max) do
  begin
    if Autos[I].patente = patente then //Si lo encuentro..
    begin
      //Devuelvo true y la posicion donde esta, cortando el ciclo
      encontrado := True;
      posicion := I;
    end;
    I := I + 1;
  end;
  Result := posicion;
end;

//Esta funcion saca el auto del estacionamiento
procedure Estacionamiento.sacarAuto(posicion: integer);
begin
  //si encontró la patente del auto lo "saca" del estacionamiento
  if posicion <> Error then
  begin
    Autos[posicion].estacionado := False;
    Autos[posicion].patente := '';
  end;
end;

//Funcion que realiza el calculo de la tarifa
function Estacionamiento.calcularPago(lugar: integer; fechaSalida: TDate) : double;
var diferencia, tarifa: double;
  ResultadoFormateado: string;
    fechaEntrada: TDateTimePicker;
    horaEntrada: TTimePicker;
    entrada: string;
    Posicion: Integer;
begin
  //Paso fecha y hora de entrada como string para poder trabajarlos
  entrada := DateToStr(Autos[lugar].fechaEntrada) + ' ' + timeToStr(Autos[lugar].horarioEntrada);
  //Realizo la resta
  //HourSpan me devuelve la diferencia EN HORAS
  diferencia := hourSpan(fechaSalida,strToDateTime(entrada));
  //Formateo el resultado para calcular la tarifa
  ResultadoFormateado := formatfloat('0.##',diferencia);

  Posicion := ConseguirLugarVacioFecha(fechaSalida);

  if StrToFloat(ResultadoFormateado) > horaEstCompleta then
  begin
     //Si es mayor a horacompleta, paga estadia completa
    tarifa := estadiaCompleta;
    Fechas_Estacionamiento[Posicion].Fecha := fechaSalida;
    Fechas_Estacionamiento[Posicion].EstadiaCompleta := Fechas_Estacionamiento[Posicion].EstadiaCompleta + tarifa;
    Fechas_Estacionamiento[Posicion].Calculado := True;
  end
    //Si es mayor a horamedia y menor a horacompleta, paga media estadia
  else if (StrToFloat(ResultadoFormateado) > horaEstMedia)  and (StrToFloat(ResultadoFormateado) < horaEstCompleta) then begin
    tarifa := mediaEstadia;
    Fechas_Estacionamiento[Posicion].Fecha := fechaSalida;
    Fechas_Estacionamiento[Posicion].MediaEstadia := Fechas_Estacionamiento[Posicion].MediaEstadia + tarifa;
    Fechas_Estacionamiento[Posicion].Calculado := True;
  end
  else begin //Sino, pagara en base al tiempo que estuvo
    tarifa := StrToFloat(ResultadoFormateado) * tarifaHora;

    Fechas_Estacionamiento[Posicion].Fecha := fechaSalida;
    Fechas_Estacionamiento[Posicion].tarifaHora := Fechas_Estacionamiento[Posicion].tarifaHora + tarifa;
    Fechas_Estacionamiento[Posicion].Calculado := True;

  end;
  Result := tarifa;
end;

function Estacionamiento.ConseguirLugarVacioFecha(FechaSalida: TDate) : integer;
var I: integer;
  Resultado: Integer;
  Encontrado: Boolean;
begin
  I := 1;
  Encontrado := False;
  //Recorre las fehcas para averiguar si existe alguna identica
  while ((not Encontrado) and (i <= LargoFechas)) do
  begin
    if (DateToStr(Fechas_Estacionamiento[i].Fecha) = DateToStr(FechaSalida))then
    begin
      Resultado := I;
      Encontrado := True;
    end
    else
    begin
      I := I + 1;
    end;
  end;

  i := 1;
  while ((not Encontrado) and (i <= LargoFechas)) do
  begin
    if (Fechas_Estacionamiento[i].Calculado = False) then
    begin
      Resultado := I;
      Encontrado := True;
    end
    else
    begin
      I := I + 1;
    end;
  end;

  Result := Resultado;
end;

function Estacionamiento.Mostrar_Contenido_Fecha(Fecha: TDateTime): String;
var Posicion: Integer;
  Texto: String;
begin
  Calcular_Total_Dia();
  Posicion := ConseguirLugarVacioFecha(Fecha);
  Texto := 'En la fecha: ' + DateToStr(Fecha) + ' se percibio lo siguiente:' +
    Salto_linea + 'Estadia Completa: ' + floattostr(Fechas_Estacionamiento[Posicion].EstadiaCompleta) +
    Salto_linea + 'Media Estadia: ' + floattostr(Fechas_Estacionamiento[Posicion].MediaEstadia) +
    Salto_linea + 'Estadia por Hora: ' + floattostr(Fechas_Estacionamiento[Posicion].TarifaHora)+
    Salto_linea + 'Recaudado total: ' + floattostr(Fechas_Estacionamiento[Posicion].Recaudado);

  Result := Texto;
end;

procedure Estacionamiento.Calcular_Total_Dia();
var i: Integer;
  Completa,Media,Hora: Real;
begin
  i := 0;
  Completa := 0;
  Media := 0;
  Hora := 0;
  for i := 1 to LargoFechas do
    begin
      Completa := Fechas_Estacionamiento[i].EstadiaCompleta;
      Media := Fechas_Estacionamiento[i].MediaEstadia;
      Hora := Fechas_Estacionamiento[i].TarifaHora;
      Fechas_Estacionamiento[i].Recaudado := Completa + Media + Hora;
    end;
end;

function Estacionamiento.Mostrar_Recaudado_En_Rango(FechaInicio, FechaFin: TDateTime): string;
var Texto: String;
  Posicion: Integer;
  Diferencia_Dias: Double;
  Encontrado : Boolean;
begin
  Calcular_Total_Dia();
  Texto := '';
  if FechaInicio > FechaFin then
  begin
    Texto := 'La fecha de inicio no puede ser mas chica que la fecha fin';
  end
  else
  begin
    Diferencia_Dias := DaysBetween(FechaFin, FechaInicio);
    while Diferencia_Dias >= 0 do
    begin
      Posicion := Buscar_Fecha(FechaInicio);
      if Posicion <> Error then
      begin
        Texto := Texto + 'Lo recaudado el dia ' + datetostr(Fechas_Estacionamiento[Posicion].Fecha) + ' fue de ' + floattostr(Fechas_Estacionamiento[Posicion].Recaudado) + ' pesos.' + Salto_linea;
      end
      else if (Posicion = Error) or (Fechas_Estacionamiento[Posicion].Recaudado < 0) then
      begin
        Texto := Texto + 'El dia ' + datetostr(FechaInicio) + ' no se recaudo nada.' + Salto_linea;
      end;
    Diferencia_Dias := Diferencia_Dias - 1;
    FechaInicio := IncDay(FechaInicio,1);
    end;
  end;

  Result := Texto;
end;

function Estacionamiento.Buscar_Fecha(Fecha: TDate): Integer;
var I: integer;
  Resultado: Integer;
  Encontrado: Boolean;
begin
  I := 1;
  Resultado := Error;
  Encontrado := False;
  //Recorre las fehcas para averiguar si existe alguna identica
  while ((not Encontrado) and (i <= LargoFechas)) do
  begin
    if (DateToStr(Fechas_Estacionamiento[i].Fecha) = DateToStr(Fecha))then
    begin
      Resultado := I;
      Encontrado := True;
    end
    else
    begin
      I := I + 1;
    end;
  end;

  Result := Resultado;
end;

end.
