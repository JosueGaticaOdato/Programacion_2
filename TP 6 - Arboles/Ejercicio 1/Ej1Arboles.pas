unit Ej1Arboles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Ej1ArbolesTAD;

type
  TForm1 = class(TForm)
    btnCargar: TButton;
    btnMostrar: TButton;
    Memo1: TMemo;
    btnHojas: TButton;
    btnInteriores: TButton;
    btnNivel: TButton;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btnHojasClick(Sender: TObject);
    procedure btnInterioresClick(Sender: TObject);
    procedure btnNivelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    AB : Ej1;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 1
Dado un árbol binario no vacío determinar:

  Los nodos terminales u hojas.
  Todos los nodos interiores (los que no son ni hojas ni raíz)
  Determinar si todas las hojas están en el mismo nivel.
  Todas las posiciones de las ocurrencias de una clave dentro del arbol.
  Determinar la complejidad algorítmica de las soluciónes.
}

//Boton que carga el arbol binario
procedure TForm1.btnCargarClick(Sender: TObject);
begin
  AB.crearArbol(tipoClave,cantElemArbol);
  AB.cargarArbol;
end;

//Boton que muestra los nodos terminales o hojas del arbol
procedure TForm1.btnHojasClick(Sender: TObject);
begin
  memo1.Lines.Add('Hojas: ');
  memo1.Lines.Add(AB.obtenerHojas);
  //memo1.Lines.Add(AB.determinarHojas(AB));
end;

procedure TForm1.btnInterioresClick(Sender: TObject);
begin
  memo1.Lines.Add('Nodos interiores');
  //memo1.Lines.Add(AB.nodosInteriores(AB));
  memo1.Lines.Add(AB.obtenerNodosInternos);
end;

//Boton que muestra en arbol, como todos sus recorridos
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
end;

//Boton que me dice si todas las hojas estan al mismo nivel
procedure TForm1.btnNivelClick(Sender: TObject);
begin
  if AB.hojasMismoNivel then begin
    memo1.Lines.Add('Todas las hojas tienen el mismo nivel');
  end
  else memo1.Lines.Add('No todas las hojas tienen el mismo nivel');
end;

//Boton que busca las ocurrencias dado determinado valor
procedure TForm1.Button1Click(Sender: TObject);
var S: String;
begin
  S := AB.buscarOcurrencias(Edit1.Text);
  memo1.Lines.Add(S);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
