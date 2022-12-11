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

procedure Fecha.asignar(f: TDate);
begin
  fecha := f;
end;

function Fecha.sumar(dias: Integer): TDate;
var nuevafecha: TDate;
begin
  nuevafecha := IncDay(fecha,dias);
  sumar := nuevafecha;
end;

function Fecha.restar(dias: Integer): TDate;
var nuevafecha: TDate;
begin
  nuevafecha := IncDay(fecha,-dias);
  restar := nuevafecha;
end;

function Fecha.isBisiesto: Boolean;
var
dia,mes,año: word;
begin
  DecodeDate(fecha,año,mes,dia);
  isBisiesto := IsLeapYear(año);
end;

function Fecha.getFecha: TDate;
begin
  getFecha := fecha;
end;

function Fecha.diferencia(f: TDate): Integer;
begin
  diferencia := (DateTimeToMilliseconds(fecha) - DateTimeToMilliseconds(f))
    div 86400000;//Es lo que hace el DaysBetwenn pero sin el valor absoluto
end;

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
