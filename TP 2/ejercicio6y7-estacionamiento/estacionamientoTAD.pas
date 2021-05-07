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
  Error = -1;
  //Largo fijo de una patente
  largoPatente = 7;
  //Cuanto es en horas la estadia completa y media
  horaEstCompleta = 6;
  horaEstMedia = 3;

//Defino auto de tipo record, que contendra tres campos
type
  Auto = Record
    patente: string;
    fechaEntrada: TDateTime;
    horarioEntrada: TTime;
    estacionado: boolean;
  End;

  //Luego, se define el objjeto
  Estacionamiento = Object
    private
      //El objeto es un array de autos(record)
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
  //EL #13#10 es utilizado para hacer el salto de linea en delphi
  mostrar := 'Auto ingresado.' + #13#10 + 'Patente: ' + Autos[lugar].patente + #13#10 +
  'Hora de ingreso: ' + timeToStr(Autos[lugar].horarioEntrada) + #13#10 +
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
function Estacionamiento.calcularPago(lugar: integer; fechaSalida: TDateTime) : double;
var diferencia, tarifa: double;
  ResultadoFormateado: string;
    fechaEntrada: TDateTimePicker;
    horaEntrada: TTimePicker;
    entrada: string;
begin
  //Paso fecha y hora de entrada como string para poder trabajarlos
  entrada := DateToStr(Autos[lugar].fechaEntrada) + ' ' + timeToStr(Autos[lugar].horarioEntrada);
  //Realizo la resta
  //HourSpan me devuelve la diferencia EN HORAS
  diferencia := hourSpan(fechaSalida,strToDateTime(entrada));
  //Formateo el resultado para calcular la tarifa
  ResultadoFormateado := formatfloat('0.##',diferencia);

  if StrToFloat(ResultadoFormateado) > horaEstCompleta then
  begin
     //Si es mayor a horacompleta, paga estadia completa
    tarifa := estadiaCompleta;
  end
    //Si es mayor a horamedia y menor a horacompleta, paga media estadia
  else if (StrToFloat(ResultadoFormateado) > horaEstMedia)  and (StrToFloat(ResultadoFormateado) < horaEstCompleta) then begin
    tarifa := mediaEstadia;
  end
  else begin //Sino, pagara en base al tiempo que estuvo
    tarifa := StrToFloat(ResultadoFormateado) * tarifaHora;

  end;
  Result := tarifa;
end;

end.
