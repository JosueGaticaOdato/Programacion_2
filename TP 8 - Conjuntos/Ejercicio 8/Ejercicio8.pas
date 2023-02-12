unit Ejercicio8;

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
Ejercicio 8
  Resolver por fuera del TAD la intersección del conjunto A con B.

  Determinar la complejidad algorítmica sin importar el TAD.

  Determinar la complejidad algorítmica teniendo en cuenta el TAD utilizado.
}


{Complejidad algoritmica con respecto al TAD:
.La realizacion de una funcion que realize la interseccion manual fuera del TAD es exactamente igual con respecto a el TAD, ya
que implica un ciclo de una de los conjuntos, consultando si cada elemento que tengo pertenece a su vez a mi segundo conjunto}

//Funcion que realiza la intersección de forma manuel, sin usar el TAD
function intersecciónManuel(CA,CB: Conjunto):Conjunto;
var
CU: Conjunto;
X: TipoElemento;
i: integer;
begin
  i := 1;
  //Creo un nuevo conjunto que tendra el tamaño de CA o CB(porque el tamaño de la interseccion siempre sera menor o igual a un conjunto)
  CU.Crear(CA.DatoDeLaClave,CA.CantidadElementos);
  //Recorroo los elementos de CA
  while (i <= CA.CantidadElementos) do
  begin
    X := CA.Recuperar(i);//Recupero el valor de CA
    if CB.Pertenece(X) then CU.Agregar(X); //Consulto si esta en CB, si esta lo agrego
    inc(i);
  end;
  i := 1;

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
intersección : Conjunto;
begin
  intersección  := intersecciónManuel(C1,C2);
  memo1.Lines.Add('Intersección realizada');
  memo1.Lines.Add('Contenido');
  memo1.Lines.Add(intersección.RetornarClaves);
end;

end.
