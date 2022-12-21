unit Unidad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FuncionesMatematicas;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure mostrarVector();
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    V: Vector;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 1
Dado un vector de números enteros generados
en forma automática (al azar) obtener las siguientes medidas estadísticas:

Media (Promedio)
Mediana (Elemento de la mitad)
Moda (Elemento que más se repite)
Mínimo valor del vector
Máximo valor del vector
Ejemplo:

2	4	4	4	5	6	8	9	10
Media: 5,77
Mediana: 5
Moda: 4
Mínimo: 2
Máximo: 10
}

procedure TForm1.mostrarVector();
var i: integer;
begin
  for i := Min to Max do begin
    memo1.Lines.Add('V[' + i.ToString + '] : ' + V[i].ToString);
  end;
end;

//Carga del vector de forma aleatoria
procedure TForm1.Button1Click(Sender: TObject);
var i: Integer;
begin
  cargarVector(V); //Llamo al procedure
  memo1.Lines.Add('El vector fue cargado de forma aleatoria con exito');
end;

//Carga del vector con los valores del ejemplo
procedure TForm1.Button6Click(Sender: TObject);
var i: Integer;
begin
  cargarVectorEjemplo(V); //Llamo al procedure
  memo1.Lines.Add('El vector del ejemplo fue cargado con exito');
end;

//Boton que muestra el valor minimo
procedure TForm1.Button7Click(Sender: TObject);
begin
  memo1.Lines.Add('Minimo: ' + Minimo(V).ToString);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  memo1.Lines.Add('Maximo: ' + Maximo(V).ToString);
end;

//Boton que muestra el vector
procedure TForm1.Button2Click(Sender: TObject);
var i: Integer;
begin
  memo1.Lines.Add('El vector es el siguiente:');
  mostrarVector();
end;

//Boton que muestra la media
procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add('');
  memo1.Lines.Add('La media es ' + Media(V).ToString);
end;

//Boton que muestra la mediana
procedure TForm1.Button4Click(Sender: TObject);
var i: Integer;
begin
  memo1.Lines.Add('');
  memo1.Lines.Add('Ordeno el vector para sacar la Mediana:');
  Ordenar(V); //Primero ordeno y muestro
  mostrarVector();
  memo1.Lines.Add('La mediana es: ' + Mediana(V).tostring); //Devuelvo la mediana
end;

//Boton que muestra la moda
procedure TForm1.Button5Click(Sender: TObject);
begin
  memo1.Lines.Add('');
  memo1.Lines.Add('La moda es ' + Moda(V).ToString);
  memo1.Lines.Add('La cantidad de veces que se repite es ' + Verifica(V,Moda(V)).ToString);
end;

end.
