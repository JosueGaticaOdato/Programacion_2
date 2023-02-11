unit Ej5Conjuntos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Tipos,
  //Conjuntos;
  ConjuntosAVL;

const
  TipoClave = Numero;
  SizeA = 3;
  SizeB = 9;
  SizeC = 5;
  Min = 1;
  Max = 100;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CA:Conjunto;
  CB:Conjunto;
  CC:Conjunto;

implementation

{$R *.dfm}

//Funcionj que realiza la comprobacion de subconjuntos
function Ejercicio5Subconjunto(var C1,C2: Conjunto): String;
var
Inter: Conjunto;
Opcion: String;
begin
  Opcion := 'No es subconjunto';
  Inter := C1.Interseccion(C2); //Obtengo la interseccion entre C1 Y C2
  //Si coincide las claves de C y Inter (osea, que son iguales sus conjuntos), entonces es subconjunto totales
  if (C1.RetornarClaves = Inter.RetornarClaves) and (C1.RetornarClaves <> C2.RetornarClaves) then
  begin
    Opcion := 'Subconjunto total';
  end
  //Si la cantidad de elementos de la interseccion es mayor a la mitad de mi elemento izquierdo, entonces es subconjunto parcial
  else if Inter.CantidadElementos > (C1.CantidadElementos DIV 2) then
  begin
    Opcion := 'Subconjunto parcial';
  end;
  Result := Opcion;
end;

//Procedimiento que carga el ejemplo
procedure cargarEjemplo();
var
  I: Integer;
  X: TipoElemento;
begin
  CA.Crear(TipoClave,SizeA);
  CB.Crear(TipoClave,SizeB);
  CC.Crear(TipoClave,SizeC);
  for I := 1 to 9 do
  begin
    X.Clave := I;
    CB.Agregar(X);
    if (I >= 3) and (I <= 5) then CA.Agregar(X);
    if (I MOD 2 = 0) or (I = 7) then CC.Agregar(X);
  end;
end;

//Boton que carga los conjuntos de forma aleatoria
procedure TForm1.Button1Click(Sender: TObject);
begin
  CA.LlenarClavesRandom(SizeA,Min,Max);
  CB.LlenarClavesRandom(SizeB,Min,Max);
  CC.LlenarClavesRandom(SizeC,Min,Max);
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
  memo1.Lines.Add(CA.RetornarClaves);
  memo1.Lines.Add('Conjunto B: ');
  memo1.Lines.Add(CB.RetornarClaves);
  memo1.Lines.Add('Conjunto C: ');
  memo1.Lines.Add(CC.RetornarClaves);
end;

//Boton que muestra los subconjuntos
procedure TForm1.Button4Click(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0: memo1.Lines.Add(ComboBox1.Text + ': ' +Ejercicio5Subconjunto(CA,CB));
    1: memo1.Lines.Add(ComboBox1.Text + ': ' + Ejercicio5Subconjunto(CB,CA));
    2: memo1.Lines.Add(ComboBox1.Text + ': ' + Ejercicio5Subconjunto(CA,CC));
    3: memo1.Lines.Add(ComboBox1.Text + ': ' + Ejercicio5Subconjunto(CC,CA));
    4: memo1.Lines.Add(ComboBox1.Text + ': ' + Ejercicio5Subconjunto(CB,CC));
    5: memo1.Lines.Add(ComboBox1.Text + ': ' + Ejercicio5Subconjunto(CC,CB));
    {
    A ⊆  B
    B ⊆  A
    A ⊆  C
    C ⊆  A
    B ⊆  C
    C ⊆  B}
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CA.Crear(TipoClave,SizeA);
  CB.Crear(TipoClave,SizeB);
  CC.Crear(TipoClave,SizeC);
end;

end.
