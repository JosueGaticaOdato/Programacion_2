unit CodigoEjercicio87;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Tipos,
  //ListArray;
  //ListCursor;
  ListPointer;

const
  Maximo = 100;
  Puntito = 1;
  Frutilla = 10;
  Banana = 30;
  Cereza = 50;
  Fantasma = 100;
  Perdiste = -1;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Resultado: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  L: Lista;

implementation

{$R *.dfm}

function Sumatoria (L1:Lista): String;
var P: PosicionLista;
  Sumador: Integer;
  Contador_de_Bonus: Integer;
  Bandera: Boolean;
begin
  P := L1.Comienzo;
  Sumador := 0;
  Bandera := True;
  while (P <> Nulo) and (Bandera) do
  begin
    if L1.Recuperar(P).Clave = 'Bonus' then
    begin
        Contador_de_Bonus := 1;
    end
    else if (Contador_de_Bonus >= 1) and (Contador_de_Bonus <= 10) then
    begin
      Sumador := Sumador + (L1.Recuperar(P).Valor1 * 2);
    end
    else if (L1.Recuperar(P).Clave = 'Fantasma') and (Contador_de_Bonus <= 10) then
    begin
      Bandera := False;
      Sumador := Perdiste;
    end
    else
    begin
      Sumador := Sumador + L1.Recuperar(P).Valor1;
    end;
    P := L1.Siguiente(P);
  end;
  Result := Sumador.ToString;
end;

procedure Cargar_Objeto(var L1:Lista; Objeto: TipoElemento);
var P: PosicionLista;
begin
  L1.Agregar(Objeto);
end;

procedure TForm1.Button1Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button1.Caption;
  X.Valor1 := Puntito;
  Cargar_Objeto(L,X);
end;

procedure TForm1.Button2Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button2.Caption;
  X.Valor1 := Frutilla;
  Cargar_Objeto(L,X);
end;

procedure TForm1.Button3Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button3.Caption;
  X.Valor1 := Banana;
  Cargar_Objeto(L,X);
end;

procedure TForm1.Button4Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button4.Caption;
  X.Valor1 := 0;
  Cargar_Objeto(L,X);
end;

procedure TForm1.Button5Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button5.Caption;
  X.Valor1 := Cereza;
  Cargar_Objeto(L,X);
end;

procedure TForm1.Button6Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button6.Caption;
  X.Valor1 := Fantasma;
  Cargar_Objeto(L,X);
end;

procedure TForm1.Button7Click(Sender: TObject);
var Total: String;
begin
  Total := Sumatoria(L);
  if Total.ToInteger = -1 then
  begin
    Resultado.Text := 'Perdiste';
  end
  else
  begin
    Resultado.Text := Total;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  L.Crear(Cadena,Maximo);
end;

end.
