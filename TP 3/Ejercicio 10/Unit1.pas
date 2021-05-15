unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type

 Posicion = Record
   Fila : Integer;
   Columna : Integer;
 End;

 Vector = Array of Posicion;

  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Matriz = Array [1..10,1..10] of String;

var
  Form1: TForm1;

implementation

function Vector_Mas_Largo (C1,C2,C3: Vector): Vector;
begin
  if (Length(C1) > Length (C2)) and (Length(C1) > Length (C3)) then
  begin
    Result := C1;
  end
  else if (Length(C2) > Length (C3)) then
  begin
    Result := C2;
  end
  else
  begin
    Result := C3;
  end;
end;

function Cadena_CarbonoAUX (Carbono: Matriz; Posicion_Actual: Posicion): Vector;
var Variable, Mas_Larga: Vector;
  Cadena1, Cadena2, Cadena3: Vector;
begin
  //Chequear fila y columna existan (dentro del rango valido) (Otro caso caso base) (Devuleve lo mismo)
 if Carbono[Posicion_Actual.Fila,Posicion_Actual.Columna] = '.' then
 begin
  Result := Variable;//Vector vacio
 end
 else
 begin
    Variable[0] := Posicion_Actual; //Falta pasaje de argumentos
  //Falta cambio de posicion y indicar de donde vengo tambien
   Cadena1 := Cadena_CarbonoAUX(Carbono,Posicion_Actual);
   Cadena2 := Cadena_CarbonoAUX(Carbono,Posicion_Actual);
   Cadena3 := Cadena_CarbonoAUX(Carbono,Posicion_Actual);
   Mas_Larga := Vector_Mas_Largo(Cadena1,Cadena2,Cadena3);
   //Result := Variable[0] + Mas_Larga;    //No existe Vector + Vector
   Result := Variable + Mas_Larga;
 end;

end;

function Cadena_Carbono (Carbono: Matriz): Vector;
var Posicionn : Posicion;
begin
  Posicionn.Fila := 1;
  Posicionn.Columna := 1;
  Result := Cadena_CarbonoAUX(Carbono, Posicionn);
end;
{$R *.dfm}

end.
