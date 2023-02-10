unit Ejercicio10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ArbolesBinariosBusqueda,ArbolesBinariosAVL, Tipos;

const
  MaxAleatorio = 100;
  CantAleatorio = 1000;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  AB: ArbolBB;
  AVL: ArbolAVL;

implementation

{$R *.dfm}

{
Ejercicio 10
Dada una serie de números generados al azar, cargar la misma serie en un árbol binario de búsqueda y en un árbol binario balanceado “AVL”.

Comparar la altura de ambos árboles. Repetir el proceso n veces. ¿Qué puede concluir al respecto?

La posibilidad que ofrece el AVL de realizar un balanceo cada vez que se inserta/elimina un dato
ofrece la posiiblidad de disminuir la altura del arbol a la mita del arbol de busqueda binaria, ademas
de que se logra encontrar un dato determinado de forma mas rapida y accesible, esto quiere
decir que me garantiza una busqueda log(n); Ejemplo log2(1000) = casi 10 acceso en el peor de los casos
}

//Cargar los arboles binario de busqueda y AVL iguales
procedure cargarArboles();
var
i: integer;
X: TipoElemento;
begin
  i := 0;
  while i < CantAleatorio do
  begin
    X.Clave := 1 + Random(MaxAleatorio);
    AB.Insertar(X);
    AVL.Insertar(X);
    inc(i);
  end;

end;

//Cargo y muestro la altura de los arboles
procedure TForm1.Button1Click(Sender: TObject);
begin
  AB.Crear(Numero,CantAleatorio);
  AVL.Crear(Numero,CantAleatorio);
  cargarArboles();
  memo1.Lines.Add('Altura Arbol Binario de Busqueda: ' + AB.Altura.ToString);
  memo1.Lines.Add('Altura Arbol Binario de Busqueda: ' + AVL.Altura.ToString);
end;

end.
