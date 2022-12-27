unit Unit_Ejercicio10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

const
  min = 0;
  max = 10;
  valoresRandomMax = 20;

type
  Matriz = Array [min..max,min..max] of Integer;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Button2: TButton;
    procedure cargarEnGrilla(aM: Matriz; Max: integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    //M: Matriz;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  M: Matriz;

implementation

{$R *.dfm}

{

Ejercicio 10
Dada una matriz de N x N (cuadrada) se pide realizar
un proceso que muestre las ambas diagonales en el mismo recorrido.

}

//Carga del cuadrado aleatoriamente
procedure cargarCuadrado(var aM: Matriz; Max: Integer);
var i,j : Integer;
begin
  Randomize;
  for i := min to Max - 1 do //Recorro las columnas
  begin
    for j := min to Max - 1 do //Recorro las filas
    begin
      aM[i,j] := 1 + Random(valoresRandomMax); //Cargo valores random
    end;
  end;
end;

//Funcion que muestra las diagonales de la matriz
function mostrarDiagonal(aM: Matriz; Max: integer): String;
var
i,j : Integer;
texto: String;
begin
  texto := '';
  //Diagonal principal
  for i := min to Max - 1 do
  begin
    texto := texto + aM[i,i].ToString + '-';//Mismo valor para columna y fila
  end;
  //Diagonal inversa
  for j := min to Max - 1 do
  begin
    texto := texto + aM[j,Max - 1 - j].ToString + '-';//La fila se calcula restando al maximo el valor de la columna
  end;
  result := texto; //Devuelvo el texto
end;

//Muestro la diagonal
procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit2.Text := mostrarDiagonal(M,StringGrid1.RowCount);
end;

//Procedimiento que carga en la grilla la matriz
procedure TForm1.cargarEnGrilla(aM: Matriz; Max: integer);
var i,j : Integer;
begin
  StringGrid1.ColCount := Max;
  StringGrid1.RowCount := Max;
    for i := min to Max do
  begin
    for j := min to Max do
    begin
      StringGrid1.Cells[i,j] := inttostr(aM[i,j]);
    end;
  end;
end;

//Boton que carga la matriz y la grilla
procedure TForm1.Button1Click(Sender: TObject);
begin
  cargarCuadrado(M,strtoint(Edit1.Text));
  cargarEnGrilla(M,strtoint(Edit1.Text));
end;

end.
