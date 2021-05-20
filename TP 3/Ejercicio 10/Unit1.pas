unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

const
  cantidadFilasMax = 7;
  min = 1;
  cantidadColumnasMax = 13;

type

 Posicion = Record
   Fila : Integer;
   Columna : Integer;
 End;

 Vector = Array of Posicion;

  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Matriz = Array [1..7,1..13] of String;

var
  Form1: TForm1;
  Cadena: Matriz = (
                    ('C','.','.','.','.','.','.','.','.','.','.','.','.'),
                    ('C','C','.','C','.','.','.','.','.','.','.','.','.'),
                    ('.','C','.','C','.','.','.','.','.','C','.','.','.'),
                    ('.','C','.','C','.','.','.','.','.','C','.','.','.'),
                    ('.','C','C','C','C','C','C','C','C','C','.','.','.'),
                    ('.','C','.','.','.','.','.','.','.','.','.','.','.'),
                    ('.','C','.','.','.','.','.','.','.','.','.','.','.')
                    );

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

function Cadena_CarbonoAUX (Carbono: Matriz; Posicion_Actual, Vengo: Posicion): Vector;
var Variable, Mas_Larga: Vector;
  Cadena1, Cadena2, Cadena3: Vector;
  Posicion_Abajo,Posicion_Derecha,Posicion_Arriba, Posicion_Izquierda: Posicion;
begin

  SetLength(Variable, 1);
  if Carbono[Posicion_Actual.Fila,Posicion_Actual.Columna] = '.' then
  begin
      Result := Variable;//Vector vacio
  end
  else
  begin
  //Error que no logro solucionar
    SetLength(Variable, 1);
    Variable[0].Fila := Posicion_Actual.Fila;
    Variable[0].Columna := Posicion_Actual.Columna;
  //No me estoy cuenta cual es
    Posicion_Abajo := Posicion_Actual;
    Posicion_Derecha := Posicion_Actual;
    Posicion_Arriba := Posicion_Actual;
    Posicion_Izquierda := Posicion_Actual;
  if (Posicion_Abajo.Fila + 1 >= min) and (Posicion_Abajo.Fila + 1 < cantidadFilasMax) then
    begin
    Posicion_Abajo.Fila := Posicion_Abajo.Fila + 1;
    if (Posicion_Abajo.Fila <> Vengo.Fila) or (Posicion_Abajo.Columna <> Vengo.Columna) then
        Cadena1 := Cadena_CarbonoAUX(Carbono,Posicion_Abajo, Posicion_Actual);
    end;
  if (Posicion_Arriba.Fila - 1 >= min) and (Posicion_Arriba.Fila - 1 < cantidadFilasMax)then
    begin
    Posicion_Arriba.Fila := Posicion_Arriba.Fila - 1;
      if (Posicion_Arriba.Fila <> Vengo.Fila) or (Posicion_Arriba.Columna <> Vengo.Columna) then
        Cadena2 := Cadena_CarbonoAUX(Carbono,Posicion_Arriba, Posicion_Actual);
    end;
  if (Posicion_Derecha.Columna + 1 < cantidadColumnasMax) and (Posicion_Derecha.Columna + 1 >=  min) then
    begin
    Posicion_Derecha.Columna := Posicion_Derecha.Columna + 1;
      if (Posicion_Derecha.Fila <> Vengo.Fila) or (Posicion_Derecha.Columna <> Vengo.Columna) then
        Cadena3 := Cadena_CarbonoAUX(Carbono,Posicion_Derecha, Posicion_Actual);
    end;
  if (Posicion_Izquierda.Columna - 1 < cantidadColumnasMax) and (Posicion_Izquierda.Columna - 1 > min)  then
    begin
    Posicion_Izquierda.Columna := Posicion_Izquierda.Columna - 1;
      if (Posicion_Izquierda.Fila <> Vengo.Fila) or (Posicion_Izquierda.Columna <> Vengo.Columna) then
        Cadena3 := Cadena_CarbonoAUX(Carbono,Posicion_Izquierda, Posicion_Actual);
    end;



  //Falta cambio de posicion y indicar de donde vengo tambien
  Mas_Larga := Vector_Mas_Largo(Cadena1,Cadena2,Cadena3);
   //Result := Variable[0] + Mas_Larga;    //No existe Vector + Vector                !!!!
  Result := Variable + Mas_Larga;
 end;

end;

function Cadena_Carbono (Carbono: Matriz): Vector;
var Posicionn : Posicion;
begin
  Posicionn.Fila := 1;
  Posicionn.Columna := 1;
  Result := Cadena_CarbonoAUX(Carbono, Posicionn, Posicionn );
end;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var V: Vector;
  x: Integer;
  y: Integer;
  Mostrar: String;
begin
  V := Cadena_Carbono(Cadena);
  for x := min to cantidadFilasMax do
  begin
    for y := min to cantidadColumnasMax do
    begin
      Mostrar := V[x,y];
    end;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  x: Integer;
  y: Integer;
  Mostrar: String;
begin
for x := min to cantidadFilasMax do
  begin
    Mostrar := '';
    for y := min to cantidadColumnasMax do
    begin
      Mostrar := Mostrar + Cadena[x,y];
    end;
  memo1.Lines.Add(Mostrar);
  end;
end;

end.
