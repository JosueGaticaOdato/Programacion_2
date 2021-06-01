unit CodigoEjercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos,
  ListArray;
  //ListCursor;
  //ListPointer;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Vector = Array of String;

var
  Form1: TForm1;
  L: Lista;

implementation

{$R *.dfm}

Function Parsing(aSS: String; aSep: String): Vector;
Var I: Integer;
    P: Integer;
    V: Vector;
Begin
  I := 0;
  // Controlo que el ultimo caracter sea el separador, sino lo agrega
  if aSS.Substring(aSS.Length,1) <> aSep then aSS := aSS + aSep;

  // Hacemos el split
  P := Pos(aSep, aSS);
  while P > 0 do Begin
    Inc(I);
    SetLength(V, I);  // Se redimensiona el array y no se pierden los datos
    V[I-1] := Copy(aSS, 1, P-1);
    aSS := Copy(aSS, P+1, Length(aSS));
    P := Pos(aSep, aSS);
  End;

  // Retorno el array
  Parsing := V;
End;

procedure TForm1.Button1Click(Sender: TObject);
var X: TipoElemento;
  i: Integer;
begin
  //Inicializo el tipo de elemento y creo la lista
  X.Inicializar(Numero,0);
  L.Crear(Numero,10);

  //Importo la liberia randomize
  Randomize;
  for i := 1 to 10 do
  begin
    //Cargo Clave (Que sera la posicion) y el valor 1 que sera el valor
    X.Clave := i;
    X.Valor1 := Random(100);
    //Lo agrego a la lista
    L.Agregar(X);
  end;

  memo1.Lines.Add('Cargada con exito');
end;

procedure TForm1.Button2Click(Sender: TObject);
var S: String;
  V: Vector;
  I: Integer;
begin
  S := L.RetornarClaves;
  V := Parsing(S,cCRLF);
  for I := Length(V) - 1 downto 0 do
  begin
    memo1.Lines.Add(V[I]);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var ListaOrdenada: Lista;
  X: TipoElemento;
begin
  memo1.Lines.Add('');
  ListaOrdenada := L;
  ListaOrdenada.Sort(False);
  memo1.Lines.Add(ListaOrdenada.RetornarClaves);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
