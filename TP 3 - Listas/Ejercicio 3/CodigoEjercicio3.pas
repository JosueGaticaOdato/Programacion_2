unit CodigoEjercicio3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, Vcl.StdCtrls,
  //ListArray;
  //ListCursor;
  ListPointer;

const
  cantElementos = 3;
  minRandom = 1;
  maxRandom = 10;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    ca: TButton;
    Memo1: TMemo;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure caClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Lista1: Lista;
  Lista2: Lista;

implementation

{$R *.dfm}

procedure Ejemplo(var L1,L2: Lista);
var X:Tipoelemento;
begin
  L1.Crear(Numero,3);
  L2.Crear(Numero,3);
  X.Clave := 1;
  L1.Agregar(X);
  X.Clave := 2;
  L1.Agregar(x);
  X.Clave := 3;
  L1.Agregar(x);
  //-----
  X.Clave := 3;
  L2.Agregar(x);
  X.Clave := 2;
  L2.Agregar(x);
  X.Clave := 1;
  L2.Agregar(x);
end;

function Son_Iguales(L1,L2: Lista): Boolean;
var Posicion1, Posicion2: PosicionLista;
  Valor1, Valor2: TipoElemento;
  Bandera1, Bandera2: Boolean;
begin
  Bandera1:= True;
  Posicion1 := L1.Comienzo;
  while (Posicion1 <> Nulo) and Bandera1 do
  begin
    Valor1 := L1.Recuperar(Posicion1);
    Posicion2 := L2.Comienzo;
    Bandera2 := True;
    while (Posicion2 <> Nulo) and Bandera2 do
    begin
      Valor2 := L2.Recuperar(Posicion2);
      if Valor1.Clave = Valor2.Clave then
      begin
        Bandera2 := False;
      end
      else
      begin
        Posicion2 := L2.Siguiente(Posicion2);
      end;
    end;
    if Posicion2 = Nulo then
    begin
      Bandera1 := False;
    end;
    Posicion1 := L1.Siguiente(Posicion1);
  end;
  Result := Bandera1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Lista1.LlenarClavesRandom(cantElementos, minRandom, maxRandom);
  Lista2.LlenarClavesRandom(cantElementos, minRandom, maxRandom);
  memo1.Lines.Add('Listas cargadas de forma aleatoria satisfactoriamente');
end;

procedure TForm1.caClick(Sender: TObject);
begin
  memo1.Lines.Add('Contenido lista 1:');
  memo1.Lines.Add(Lista1.RetornarClaves);
  memo1.Lines.Add('Contenido lista 2:');
  memo1.Lines.Add(Lista2.RetornarClaves);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Ejemplo(Lista1,Lista2);
  memo1.Lines.Add('Cargado con valores del ejemplo');
end;

procedure TForm1.Button4Click(Sender: TObject);
var Iguales: Boolean;
begin
 Iguales := Son_Iguales(Lista1,Lista2);
 if Iguales then
 begin
  memo1.Lines.Add('Son iguales!');
 end
 else
 begin
  memo1.Lines.Add('No son iguales');
 end;
end;

end.
