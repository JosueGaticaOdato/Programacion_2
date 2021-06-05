unit ejercicio6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos,
  ListArray;
  //ListCursor;
  //ListPointer;

const
  cantElem = 10;
  min = 1;
  max = 10;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button2Click(Sender: TObject);
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

procedure intercambio(e1,e2: tipoElemento);
var aux: tipoElemento;
begin
  aux := e2;
  e2 := e1;
  e1 := aux;
end;

PROCEDURE Burbujeo(var L: Lista; P, Q: PosicionLista);
var I: integer;
    Elem1, Elem2: tipoElemento;
begin
  Elem1 := L.Recuperar(P);
  Elem2 := L.Recuperar(Q);
  if L.Comienzo = L.Fin then begin
    Exit
  end;

  while (P <= L.CantidadElementos) and (Q <= L.CantidadElementos) do begin
    if Elem1.Clave > Elem2.Clave then begin
      intercambio(Elem1,Elem2);
      Burbujeo(L, P+1, Q+1);
//      P := P + 1;
//      Q := Q + 1;
//      Elem1 := L.Recuperar(P);
//      Elem2 := L.Recuperar(Q);
    end
    else begin
      Burbujeo(L, P+1, Q+1);
    end;

  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Li.Crear(Numero,cantElem);
  Li.LlenarClavesRandom(cantElem,min,max);
  memo1.Lines.Add('Lista cargada satisfactoriamente');
  Burbujeo(Li,1,2);
  memo1.Lines.Add(Li.RetornarClaves);
end;

end.
