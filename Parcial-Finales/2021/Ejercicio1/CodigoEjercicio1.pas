unit CodigoEjercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos,
  ListArray, Vcl.StdCtrls;
  //ListCursor;
  //ListPointer;

const
  Tamaño = 4;
  Min = 1;
  Max = 10;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    N: TEdit;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    List: Lista;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

//Complejidad O(n): Lineal
//.Inicializacion del indice y creacion de la lista nueva
//.Recorrido de la lista mientras no sea 0
//.Hago un nuevo bucle con n
//.Guardo en cada iteracion la suma del anterior y el siguiente
//.Guardo el resultado de la suma de las claves en la lista
//.Retorno la lista
Function junta(L: Lista; n: integer): Lista;
var I: PosicionLista;
  X, Y: TipoElemento;
  Nulo: TipoElemento;
  Suma: TipoElemento;
  Lista_Suma: Lista;
  o: Integer;
begin
  Lista_Suma.Crear(Numero, L.SizeList);
  I := L.Comienzo;
  while (I < L.Fin) and (I <> 0) do
  begin
    X.Clave := 0;
    o := 1;
    while o <= n do
    begin
      Y := L.Recuperar(I);
      X.Clave := X.Clave + Y.Clave;
      o := o + 1;
      I := L.Siguiente(I);
    end;
    Suma.Clave := X.Clave;
    Lista_Suma.Agregar(Suma);
  end;
  Result := Lista_Suma;
end;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  List.LlenarClavesRandom(Tamaño,Min,Max);
  memo1.Lines.Add('Lista cargada!');
end;

procedure TForm1.Button2Click(Sender: TObject);
var New_List: Lista;
begin
  New_List := Junta(List,StrToInt(N.Text));
  memo1.Lines.Add('Suma realizada!');
  memo1.Lines.Add(New_List.RetornarClaves);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Clear;
  memo1.Lines.Add(List.RetornarClaves);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  List.Crear(Numero,Tamaño);
end;

end.
