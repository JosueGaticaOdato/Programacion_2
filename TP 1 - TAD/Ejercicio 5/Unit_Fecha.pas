unit Unit_Fecha;

interface

uses
  DateUtils,SysUtils;

type
  Fecha = Object
    private
      fecha : TDate;
    public
      procedure asignar(f: TDate);
      function getFecha(): TDate;
      function sumar(dias:integer): TDate;
      function restar(dias:integer): TDate;
      function isBisiesto(): boolean;
      function diferencia(f: TDate): integer;
      function comparacion(f: TDate): String;
    End;

implementation

//Procedimiento que asigna la fecha
procedure Fecha.asignar(f: TDate);
begin
  fecha := f; //Asigno
end;

//Funcion que le realiza a una fecha la suma de dias
function Fecha.sumar(dias: Integer): TDate;
var nuevafecha: TDate;
begin
  nuevafecha := IncDay(fecha,dias); //LLamo a IncDay
  sumar := nuevafecha;
end;

//Funcion que le realiza a una fecha la resta de  dias
function Fecha.restar(dias: Integer): TDate;
var nuevafecha: TDate;
begin
  nuevafecha := IncDay(fecha,-dias); //Llamo a IncDay pero paso como negativo los dias
  restar := nuevafecha;
end;

//Funcion que me dice si un año es bisiesto
function Fecha.isBisiesto: Boolean;
var
dia,mes,año: word;
begin
  DecodeDate(fecha,año,mes,dia); //Obtengo el año
  isBisiesto := IsLeapYear(año); //Consulto si es biesto con IsLeapYear
end;

//Getter para obtener la fecha
function Fecha.getFecha: TDate;
begin
  getFecha := fecha;
end;

//Funcion que me da la diferencia en dias entre dos fechas
function Fecha.diferencia(f: TDate): Integer;
begin
  diferencia := (DateTimeToMilliseconds(fecha) - DateTimeToMilliseconds(f))
    div 86400000;//Es lo que hace el DaysBetwenn pero sin el valor absoluto
    //DaysBetwenn: Devuelve el número de días enteros entre dos valores
end;

//Funcion que realiza la comparacion entre dos fechas
function Fecha.comparacion(f: TDate): string;
var dif : integer;
texto: String;
begin
  dif := diferencia(f);
  if dif > 0 then
  begin
    texto := 'POSTERIOR';
  end
  else if dif < 0 then
  begin
    texto := 'ANTERIOR';
  end
  else
  begin
    texto := 'IGUAL';
  end;
  comparacion := texto;
end;

end.
