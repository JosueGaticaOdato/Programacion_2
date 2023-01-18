unit Unit_Ejercicio2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Unit_Vector;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit3: TEdit;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  V: Vector; //Declaro la variable

implementation

{$R *.dfm}

{
Ejercicio 2
Crear un TAD Vector que represente un vector de n elementos enteros.
El TAD debe disponer de las siguientes operaciones:

.Cargar Aleatorio dentro de un rango [Desde, Hasta] especificado como parámetro.
 Agregar un tercer parámetro para indicar si permite o no repeticiones.
.Sumatoria de los elementos del vector.
.Promedio del vector.
.Máximo valor del vector (debe además retornar la posición donde se ubica).
.Mínimo valor del vector (debe además retornar la posición donde se ubica).
.Devolución de un string con los elementos intercalados con un separador pasado como parámetro.
.Multiplicar el valor de cada posición por un escalar.
 Por ejemplo n * []. Si es n=2, el valor de cada posición será multiplicado por 2.
.Permitir sumar este vector con otro igual que sea recibido por parámetro.
 La suma se realizar posición a posición.
}

//BOTON CARGA
procedure TForm1.Button1Click(Sender: TObject);
begin
  V.carga(Strtoint(Edit1.Text),Strtoint(Edit2.Text),Checkbox1.Checked);
  memo1.Lines.Add('Vector cargado!');
end;

//BOTON SUMATORIA
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Sumatoria: ' + inttostr(V.sumatoria));
end;

//BOTON PROMEDIO
procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add('Promedio: ' + floattostr(V.promedio));
end;

//BOTON MAXIMO
procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('Maximo');
  memo1.Lines.Add('Numero: ' + inttostr(V.maximoValor));
  memo1.Lines.Add('Posicion: ' + inttostr(V.maximoValorPosicion));
end;

//BOTON MINIMO
procedure TForm1.Button5Click(Sender: TObject);
begin
  memo1.Lines.Add('Minimo');
  memo1.Lines.Add('Numero: ' + inttostr(V.minimoValor));
  memo1.Lines.Add('Posicion: ' + inttostr(V.minimoValorPosicion));
end;

//BOTON INTERCALADO
procedure TForm1.Button6Click(Sender: TObject);
begin
  memo1.Lines.Add('Intercalado con ' + '"' + Edit3.Text + '"');
  memo1.Lines.Add(V.intercalado(Edit3.Text));
end;

//BOTON PRODUCTO ESCALAR
procedure TForm1.Button7Click(Sender: TObject);
var
  VprodEscalar: Vector;
begin
  VprodEscalar := V.prodescalar(StrToInt(Edit3.Text));
  memo1.Lines.Add('Escalar multiplicado!');
  memo1.Lines.Add('Vector resultante:');
  memo1.Lines.Add(VprodEscalar.mostrar);
end;

//BOTON MOSTRAR VECTOR
procedure TForm1.Button8Click(Sender: TObject);
begin
  memo1.Lines.Add(V.mostrar);
end;

//BOTON SUMA DE VECTORES
procedure TForm1.Button9Click(Sender: TObject);
var newVector: Vector;
begin
  newVector.vaciar;
  newVector.carga(Strtoint(Edit1.Text),Strtoint(Edit2.Text), Checkbox1.Checked);
  memo1.Lines.Add('Nuevo vector');
  memo1.Lines.Add(newVector.mostrar);
  newVector.sumaVectores(V);
  memo1.Lines.Add('Suma realizada');
  memo1.Lines.Add('Vector resultante:');
  memo1.Lines.Add(newVector.mostrar);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  V.vaciar;
end;

end.
