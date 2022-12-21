unit UnidadEJ4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

const
  min = 1;
  max = 10;

type
  Matriz = Array [min..max,min..max] of Integer;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    M: Matriz;
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  M: Matriz;

implementation

{$R *.dfm}

{
Ejercicio 4
Generar un programa que permita armar un Cuadrado Latino,
una matriz cuadrada de n x n con números generados
aleatoriamente entre el 1 y n2 (no repetidos).

Ejemplo: Un cuadrado latino de grado 4 es una matriz donde n=4

Matrix 4 x 4

5	 7	 1	 15
12 11	 2	 14
9  16	 8	 4
3	 10	 13  6
}

{FUNCIONES Y PROCEDIMIENTOS}

//Funcion que carga el cuadrado
function Cargar_Cuadrado(var aM: Matriz; Maximo: Integer): Double;
var
i,j,x, Cuadrado: Integer;
Paso: Boolean;
begin
  //Obtengo el tamaño del cuadrado
  Cuadrado := (Maximo * Maximo);
  randomize;
  //Mientras no ocupe las posiciones de todo los cuadrados
  for x := 1 to Cuadrado do
  begin
    Paso := True;
    //Paso significa que puso el valor en la celda
    while Paso do
    begin
      Paso := False;
      //Obtengo valores raondom dentro del maximo
      i := 1 + Random(Maximo);
      j := 1 + Random(Maximo);
      //Consulto si es igual a 0, si es asi agrego el numero
      if aM[i,j] = 0 then
      begin
        aM[i,j] := x;
      end
      else
      begin
        //Sino consulto devuelta
        Paso := True;
      end;
    end;
  end;
end;

//Creacion del cuadrado latino con 0
procedure crearCuadrado(var aM: Matriz; Max: Integer);
var i,j : Integer;
begin
  for i := 1 to Max do
  begin
    for j := 1 to Max do
    begin
      M[i,j] := 0;
    end;
  end;
end;

{BOTONES}

//Boton que genera y muestra el cuadrado latino
procedure TForm1.Button1Click(Sender: TObject);
var i,j,Max : Integer;
begin
  memo1.Clear;
  Max := strtoint(Edit1.Text);
  crearCuadrado(M,Max);
  Cargar_cuadrado(M,Max);
  memo1.lines.Add('Cuadrado cargado exitosamente!');

  //muestra el cuadrado latino
  memo1.Lines.Add('El cuadrado latino es el siguiente:');
  for i := 1 to Max do
  begin
    for j := 1 to Max do
    begin
      memo1.Lines.Add('Posicion ' + i.ToString + '-' + j.ToString + ' : ' + M[i,j].ToString);
    end;
  end;
end;

end.



