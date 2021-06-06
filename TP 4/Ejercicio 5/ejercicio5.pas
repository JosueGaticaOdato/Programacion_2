unit ejercicio5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos,
  ListArray;
  //ListCursor;
  //ListPointer;

const
  min = 0;
  max = 4;
  A1 : Array[min..max] of integer = (1, 2, 3, 4, 5);
  A2 : Array[min..1] of integer = (3, 2);
  cantElem = 5;
  minRand = 1;
  maxRand = 10;
  cantElemMax = 10;


type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  L1: Lista;
  L2: Lista;
  L1Cons: Lista;
  L2Cons: Lista;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  L1.Crear(Numero,cantElemMax);
  L2.Crear(Numero,cantElem);
  L1.LlenarClavesRandom(cantElemMax, minRand, maxRand);
  L2.LlenarClavesRandom(cantElem, minRand, maxRand);
  memo1.Lines.Add('Lista 1:');
  memo1.Lines.Add(L1.RetornarClaves);
  memo1.Lines.Add('--------------------');
  memo1.Lines.Add('Lista 2:');
  memo1.Lines.Add(L2.RetornarClaves);
end;

procedure TForm1.Button2Click(Sender: TObject);
var I: integer;
    X: TipoElemento;
begin
  L1Cons.Crear(Numero,cantElemMax);
  L2Cons.Crear(Numero,cantElemMax);
  for I := 0 to Length(A1) do begin
   X.Inicializar(X.TipoDatoClave(A1[I]), A1[I]);
   L1Cons.Agregar(X);
  end;
  for I := 0 to Length(A2) do begin
   X.Inicializar(X.TipoDatoClave(A2[I]), A2[I]);
   L2Cons.Agregar(X);
  end;

end;

function esSublist(Li1, Li2: Lista) : bool;
var I, J: integer;
    Elem1, Elem2: tipoElemento;
begin
  I := Li1.Comienzo;
  J := Li2.Comienzo;
  Elem1 := Li1.Recuperar(I);
  Elem2 := Li2.Recuperar(J);

  while (I <= Li1.CantidadElementos) do begin
    while (J <= Li2.CantidadElementos) do begin
      if Elem1.Clave = Elem2.Clave then begin
        I := I + 1;
        Elem1 := Li1.Recuperar(I);
      end
      else begin
        J := J + 1;
        Elem2 := Li2.Recuperar(J);
      end;
    end;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var esSublista: bool;
begin
  esSublista := esSublist(L1,L2);
  if esSublista then begin
    memo1.Lines.Add('La segunda lista es sublista de la primera');
  end
  else begin
    memo1.Lines.Add('No es sublista.');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
