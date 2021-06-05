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
  max = 5;
  A1 : Array[min..max] of integer = (1, 2, 3, 4, 5);
  A2 : Array[min..2] of integer = (3, 2);
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
    procedure Memo1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  L1.LlenarClavesRandom(cantElem, minRand, maxRand);
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
  L1Cons.Crear(Desconocido,cantElemMax);
  L2Cons.Crear(Desconocido,cantElemMax);
  for I := 0 to Length(A1) do begin
   X.Inicializar(X.TipoDatoClave(A1[I]), A1[I]);
   L1Cons.Agregar(X);
  end;
  for I := 0 to Length(A2) do begin
   X.Inicializar(X.TipoDatoClave(A2[I]), A2[I]);
   L2Cons.Agregar(X);
  end;

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  memo1.Clear;
end;

end.
