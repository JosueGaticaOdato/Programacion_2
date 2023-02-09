unit Ej2Arboles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Ej2ArbolesTAD, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnCargar: TButton;
    Memo1: TMemo;
    btnMostrar: TButton;
    btnPadre: TButton;
    btnHijos: TButton;
    btnHermanos: TButton;
    btnNivel: TButton;
    btnAltura: TButton;
    btnNodosNivel: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btnPadreClick(Sender: TObject);
    procedure btnHijosClick(Sender: TObject);
    procedure btnHermanosClick(Sender: TObject);
    procedure btnNivelClick(Sender: TObject);
    procedure btnAlturaClick(Sender: TObject);
    procedure btnNodosNivelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    AB:Ej2;
    AB2:Ej2;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 2
Para un nodo del árbol binario determinado:

  Indicar el nombre del nodo padre.
  Listar los hijos.
  Listar los hermanos.
  Calcular el nivel en el que se encuentra.
  Calcular la altura de su rama (Altura del Subárbol).
  Listar todos los nodos que están en el mismo nivel.
  Determinar si es equivalente con otro arbol binario dado.
}

//Boton que muestra la altura de un subarbol tuvieron un nodo como raiz
procedure TForm1.btnAlturaClick(Sender: TObject);
var S: String;
begin
    S := AB.Altura(InputBox('Ingrese la clave',
  'del elemento por el cual quiere consultar', '.'));
  memo1.Lines.Add('Altura subarbol: ' + S);
end;

//Boton que carga el arbol
procedure TForm1.btnCargarClick(Sender: TObject);
begin
  AB.crearArbol(tipoClave,cantElemArbol);
  AB.cargarArbol;
end;

//Boton que muestra los hermanos de un nodo
procedure TForm1.btnHermanosClick(Sender: TObject);
var S: String;
begin
    S := AB.listarHermanos(InputBox('Ingrese la clave',
  'del elemento por el cual quiere consultar', '.'));
  memo1.Lines.Add('Hermanos: ' + S);
end;

//Boton que muestra los hijos dado un nodo
procedure TForm1.btnHijosClick(Sender: TObject);
var
S: String;
begin
  S := AB.listarHijos(InputBox('Ingrese la clave',
  'del elemento por el cual quiere consultar', '.'));
  memo1.Lines.Add('Los hijos son:  ' + S);
end;

//Boton que muestra todos los datos del arbol
procedure TForm1.btnMostrarClick(Sender: TObject);
begin
  memo1.Lines.Add('Recorrido en profundidad: ');
  memo1.Lines.Add('Pre orden: ');
  memo1.Lines.Add(AB.mostrarPreOrden);
  memo1.Lines.Add('In orden: ');
  memo1.Lines.Add(AB.mostrarInOrden);
  memo1.Lines.Add('Post orden: ');
  memo1.Lines.Add(AB.mostrarPostOrden);
  memo1.Lines.Add('Recorrido en anchura: ');
  memo1.Lines.Add(AB.mostrarAnchura);
  memo1.Lines.Add('Altura');
  memo1.Lines.Add(AB.alturaArbol);
end;

//Boton que muestra el nivel de un nodo
procedure TForm1.btnNivelClick(Sender: TObject);
var
S: String;
begin
  S := AB.Nivel(InputBox('Ingrese la clave',
  'del elemento por el cual quiere consultar', '.'));
  memo1.Lines.Add('Nivel:  ' + S);
end;

//Boton que, dado un nivel, muestra los nodos que se encuentra en el mismo nivel
procedure TForm1.btnNodosNivelClick(Sender: TObject);
var
S: String;
begin
  S := AB.mismoNivel(InputBox('Ingrese la clave',
    'del nivel por el cual quiere consultar', '.'));
  memo1.Lines.Add('Nodos del mismo nivel ');
  memo1.Lines.Add(S);
end;

//Boton que muestra el nombre del padre de un nodo
procedure TForm1.btnPadreClick(Sender: TObject);
var
S: String;
begin
  S := AB.nombrePadre(InputBox('Ingrese la clave',
    'del elemento por el cual quiere consultar', '.'));
  memo1.Lines.Add('El nombre del padre es ' + S);
end;

//Boton que crea el arbol 2 de fomra manual
procedure TForm1.Button1Click(Sender: TObject);
begin
  AB2.crearArbol(tipoClave,cantElemArbol);
  AB2.cargarArbol;
end;

//Boton que carga el arbol 2 igual al 1
procedure TForm1.Button2Click(Sender: TObject);
begin
  AB2 := AB;
  memo1.Lines.Add('Arbol cargado igual');
end;

//Boton que compara si ambos arboles son equivalentes
procedure TForm1.Button3Click(Sender: TObject);
begin
  if AB.sonEquivalentes(AB2) then
  begin
    memo1.Lines.Add('Son equivalentes');
  end
  else
  begin
    memo1.Lines.Add('No son equivalentes');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;


end.
