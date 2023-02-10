unit Ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,TADEjercicio9,ArbolesBinariosAVL;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  A: Ej9;

implementation

{$R *.dfm}

{
Ejercicio 9
  Generar un algoritmo, recursivo o no, que permita construir un árbol binario de búsqueda balanceado
  (AVL) a partir de un árbol binario sin un orden determinado.

  Comparar las alturas de ambos árboles.

  Determinar la complejidad algorítmica.
}

//Boton que crea el arbol binario
procedure TForm1.Button1Click(Sender: TObject);
begin
  A.cargarArbol;
end;

//Boton que muestra el contenido del arbol binario
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Recorrido en profundidad: ');
  memo1.Lines.Add('Pre orden: ');
  memo1.Lines.Add(A.mostrarPreOrden);
  memo1.Lines.Add('In orden: ');
  memo1.Lines.Add(A.mostrarInOrden);
  memo1.Lines.Add('Post orden: ');
  memo1.Lines.Add(A.mostrarPostOrden);
  memo1.Lines.Add('Recorrido en anchura: ');
  memo1.Lines.Add(A.mostrarAnchura);
end;

//Boton que crea el arbol avl y muestra su contenido
procedure TForm1.Button3Click(Sender: TObject);
var AVL: ArbolAVL;
begin
  AVL := A.crearArbolAVL;
  memo1.Lines.Add('Arbol AVL creado');
  memo1.Lines.Add(A.mostrarArbolAVL(AVL));
  memo1.Lines.Add('Altura Binario: ' + A.Altura);
  memo1.Lines.Add('Altura AVL: ' +  A.mostrarAlturaArbolAVL(AVL));

end;


end.
