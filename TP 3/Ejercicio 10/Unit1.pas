unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
  Posicion_Abajo,Posicion_Adelante,Posicion_Arriba: Posicion;
begin
  //Chequear fila y columna existan (dentro del rango valido) (Otro caso caso base) (Devuelve lo mismo)
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
    Posicion_Adelante := Posicion_Actual;
    Posicion_Arriba := Posicion_Actual;
  if (Posicion_Abajo.Fila + 1 <= 7) then
    begin
    Posicion_Abajo.Fila := Posicion_Abajo.Fila + 1;
    if (Posicion_Abajo.Fila <> Vengo.Fila) or (Posicion_Abajo.Columna <> Vengo.Columna) then
        Cadena1 := Cadena_CarbonoAUX(Carbono,Posicion_Abajo, Posicion_Actual);
    end;
  if (Posicion_Arriba.Fila - 1 > 0) then
    begin
    Posicion_Arriba.Fila := Posicion_Arriba.Fila - 1;
      if (Posicion_Arriba.Fila <> Vengo.Fila) or (Posicion_Arriba.Columna <> Vengo.Columna) then
        Cadena2 := Cadena_CarbonoAUX(Carbono,Posicion_Arriba, Posicion_Actual);
    end;
  if (Posicion_Adelante.Columna + 1 < 14) then
    begin
    Posicion_Adelante.Columna := Posicion_Adelante.Columna + 1;
      if (Posicion_Adelante.Fila <> Vengo.Fila) or (Posicion_Adelante.Columna <> Vengo.Columna) then
        Cadena3 := Cadena_CarbonoAUX(Carbono,Posicion_Adelante, Posicion_Actual);
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
begin
 V := Cadena_Carbono(Cadena);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  x: Integer;
  y: Integer;
  Mostrar: String;
begin
for x := 1 to 7 do
  begin
    Mostrar := '';
    for y := 1 to 13 do
    begin
      Mostrar := Mostrar + Cadena[x,y];
    end;
  memo1.Lines.Add(Mostrar);
  end;
end;

end.
