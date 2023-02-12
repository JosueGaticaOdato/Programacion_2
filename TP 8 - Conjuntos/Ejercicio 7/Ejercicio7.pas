unit Ejercicio7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos,
  //Conjuntos;
  ConjuntosAVL;

const
  TipoClave = Numero;
  SizeA = 4;
  SizeB = 4;
  Min = 1;
  Max = 100;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button4: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
Ejercicio 7
  Resolver por fuera del TAD la unión del conjunto A con B.

  Determinar la complejidad algorítmica sin importar el TAD.

  Determinar la complejidad algorítmica teniendo en cuenta el TAD utilizado.
}

{Complejidad algoritmica con respecto a el uso del TAD:
.La creacion manual de una funcion de union requiere un recorrido primero de todos los elementos del primero conjunto y
luego, un recorrido del segundo conjunto, siempre recuperando el valor en la posicion donde estoy parado y agregando
a mi conjunto de union(esto lo hace dos veces, para el conjunto 1 y 2).
.En el TAD tengo que hacer exactamente lo mismo, depende la implementacion que se aplique (listas o avl) pero el proceso
es exactamente el mismo: busco, recupero, agrego en otro conjunto
.La mayor diferencia que existe es en la forma que tengo que acceder tanto en el TAD como sin el TAD}

//Funcion que realiza la union de forma manuel, sin usar el TAD
function unionManuel(CA,CB: Conjunto):Conjunto;
var
CU: Conjunto;
X: TipoElemento;
i: integer;
begin
  i := 1;
  //Creo un nuevo conjunto que tendra el tamaño de CA Y CB
  CU.Crear(CA.DatoDeLaClave,CA.CantidadElementos + CB.CantidadElementos);
  //Primero agrego los elementos de CA a mi conjunto
  while (i <= CA.CantidadElementos) do
  begin
    X := CA.Recuperar(i);
    CU.Agregar(X);
    inc(i);
  end;
  i := 1;
  //Luego agrego los elementos de CB a mi conjunto
  while (i <= CB.CantidadElementos) do
  begin
    X := CB.Recuperar(i);
    CU.Agregar(X);
    inc(i);
  end;

  Result := CU; //Devuelvo mi nuevo conjunto resultado
end;

//Boton que carga los conjuntos de forma aleatoria
procedure TForm1.Button1Click(Sender: TObject);
begin
  C1.LlenarClavesRandom(SizeA,Min,Max);
  C2.LlenarClavesRandom(SizeB,Min,Max);
  memo1.Lines.Add('Se cargaron los conjuntos correctamente');
end;

//Boton que muestra el contenido de los conjuntos
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Conjunto A: ');
  memo1.Lines.Add(C1.RetornarClaves);
  memo1.Lines.Add('Conjunto B: ');
  memo1.Lines.Add(C2.RetornarClaves);
end;

//Boton que realiza la union de forma manual
procedure TForm1.Button4Click(Sender: TObject);
var
Union: Conjunto;
begin
  Union := unionManuel(C1,C2);
  memo1.Lines.Add('Union realizada');
  memo1.Lines.Add('Contenido');
  memo1.Lines.Add(Union.RetornarClaves);
end;

end.
