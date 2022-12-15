unit CodigoEjercicio7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADEjercicio7, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    Arbol : Ej7;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Arbol.crearArbol(tipoClave,cantElemArbol);
  Arbol.cargarArbol;
  memo1.Lines.Add('Arbol cargado');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Altura del arbol: ' + Arbol.Altura.ToString);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add('Recorrido en anchura:');
  memo1.Lines.Add(Arbol.mostrarAnchura)
end;

procedure TForm1.Button4Click(Sender: TObject);
var x: TipoElemento;
  Cont: Integer;
begin
  X.Clave := Edit1.Text;
  Cont := Arbol.Nivel(X);
  memo1.Lines.Add('Nivel del nodo: ' + Cont.ToString);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  memo1.Lines.Add('Nodos internos');
  memo1.Lines.Add(Arbol.Nodos_Internos);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if Arbol.Hojas_Mismo_Nivel then begin
    memo1.Lines.Add('Todas las hojas tienen el mismo nivel');
  end
  else memo1.Lines.Add('No todas las hojas tienen el mismo nivel');
end;

end.
