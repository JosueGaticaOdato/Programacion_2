unit ejercicio6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos,
  //ListArray;
  //ListCursor;
  ListPointer;

const
  cantElem = 3;
  min = 1;
  max = 10;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Li: Lista;

implementation

{$R *.dfm}

procedure intercambio(var L: Lista; e1,e2: tipoElemento; P, Q: PosicionLista);
begin
  L.Insertar(e1,Q);
  L.Insertar(e2,P);
end;

PROCEDURE Burbujeo(var L: Lista; P, Q: PosicionLista);
var Elem1, Elem2, aux: tipoElemento;
begin
  Elem1 := L.Recuperar(P);
  Elem2 := L.Recuperar(Q);
  if L.Comienzo = L.Fin then begin
    Exit
  end;
  if (P <= L.CantidadElementos) and (Q <= L.CantidadElementos) then
  begin
    if Elem1.Clave > Elem2.Clave then begin
      //intercambio(L,Elem1,Elem2,P,Q);
      Aux := Elem1;
      L.Insertar(Elem2,P);
      L.Insertar(Aux,Q);
    end;
    Burbujeo(L, L.Siguiente(P), L.Siguiente(Q));
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Li.Crear(Numero,cantElem);
  Li.LlenarClavesRandom(cantElem,min,max);
  memo1.Lines.Add('Lista cargada satisfactoriamente');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Burbujeo(Li,Li.Comienzo,Li.Siguiente(Li.Comienzo));
  memo1.Lines.Add(Li.RetornarClaves);
end;

procedure TForm1.Button3Click(Sender: TObject);
var X: TipoElemento;
begin
  memo1.Lines.Add(Li.RetornarClaves);
  X.Inicializar(Numero,0);
  Li.Insertar(X,2);
  memo1.Lines.Add(Li.RetornarClaves);
end;

end.
