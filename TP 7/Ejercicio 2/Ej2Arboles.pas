unit Ej2Arboles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Ej2ArbolesTAD, Vcl.StdCtrls;

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
    procedure FormCreate(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btnPadreClick(Sender: TObject);
  private
    { Private declarations }
    AB:Ej2;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCargarClick(Sender: TObject);
begin
  AB.crearArbol(tipoClave,cantElemArbol);
  AB.cargarArbol;
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

procedure TForm1.btnPadreClick(Sender: TObject);
begin
  AB.indicarPadre()
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
