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
    procedure FormCreate(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btnHojasClick(Sender: TObject);
    procedure btnInterioresClick(Sender: TObject);
    procedure btnNivelClick(Sender: TObject);
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

//Dado un árbol binario no vacío determinar:
//
//Los nodos terminales u hojas.
//Todos los nodos interiores (los que no son ni hojas ni raíz)
//Determinar si todas las hojas están en el mismo nivel.
//Determinar la complejidad algorítmica de los puntos a, b, c.


procedure TForm1.btnCargarClick(Sender: TObject);
begin
  AB.crearArbol(tipoClave,cantElemArbol);
  AB.cargarArbol;
end;

procedure TForm1.btnHojasClick(Sender: TObject);
begin
  memo1.Lines.Add('Hojas: ');
  memo1.Lines.Add(AB.determinarHojas(AB));
end;

procedure TForm1.btnInterioresClick(Sender: TObject);
begin
  memo1.Lines.Add('Nodos interiores');
  memo1.Lines.Add(AB.nodosInteriores(AB));
end;

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

procedure TForm1.btnNivelClick(Sender: TObject);
begin
  if AB.mismoNivelHojas(AB) then begin
    memo1.Lines.Add('Todas las hojas tienen el mismo nivel');
  end
  else memo1.Lines.Add('No todas las hojas tienen el mismo nivel');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
