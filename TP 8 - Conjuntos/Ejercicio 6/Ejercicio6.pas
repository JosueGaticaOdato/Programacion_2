unit Ejercicio6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos,
  //Conjuntos;
  ConjuntosAVL, Vcl.StdCtrls;

const
  TipoClave = Numero;
  SizeA = 4;
  SizeB = 4;
  Min = 1;
  Max = 100;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  C1:Conjunto;
  C2:Conjunto;

implementation

{$R *.dfm}

{
Ejercicio 6
  Dados dos conjuntos de números naturales se pide determinar si son iguales sin importar la posición de sus elementos.

  Determinar la complejidad algorítmica.

  Ejemplo: si A = (3, 4, 5, 6) y B = (3, 5, 4, 6) entonces a A es igual B y viceversa.
}

//Funcion que determina si dos conjuntos son iguales
function iguales(var CA,CB: Conjunto): String;
var
S: String;
iguales1,iguales2: boolean;
begin
  S := 'No son iguales';
  //Son iguales si calculo la interseccion entre ambos y tengo los mismos elementos en izquierda y en el medio
  iguales1 := CA.Interseccion(CB).RetornarClaves = CA.RetornarClaves;
  iguales2 := CB.Interseccion(CA).RetornarClaves = CB.RetornarClaves;
  if iguales1 and iguales2 then
  begin
    S := 'A es igual B y viceversa.';
  end
  else if iguales1 then
  begin
    S := 'A es igual B';
  end
  else if iguales2 then
  begin
    S := 'B es igual A';
  end;
  Result := S;
end;

//Procedimiento que carga el ejemplo
procedure cargarEjemplo();
var
  I: Integer;
  X: TipoElemento;
begin
  C1.Crear(TipoClave,SizeA);
  C2.Crear(TipoClave,SizeB);
  for I := 3 to 6 do
  begin
    X.Clave := I;
    C1.Agregar(X);
    C2.Agregar(X);
  end;
end;

//Boton que carga los conjuntos de forma aleatoria
procedure TForm1.Button1Click(Sender: TObject);
begin
  C1.LlenarClavesRandom(SizeA,Min,Max);
  C2.LlenarClavesRandom(SizeB,Min,Max);
  memo1.Lines.Add('Se cargaron los conjuntos correctamente');
end;

//Boton que carga los conjuntos como en el ejemplo
procedure TForm1.Button2Click(Sender: TObject);
begin
  cargarEjemplo;
  memo1.Lines.Add('Se cargaron los conjuntos como en el ejemplo');
end;

//Boton que muestra el contenido de los conjuntos
procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add('Conjunto A: ');
  memo1.Lines.Add(C1.RetornarClaves);
  memo1.Lines.Add('Conjunto B: ');
  memo1.Lines.Add(C2.RetornarClaves);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add(iguales(C1,C2));
end;

end.
