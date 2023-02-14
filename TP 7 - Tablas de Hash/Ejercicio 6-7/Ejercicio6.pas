unit Ejercicio6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos,
  //TABLA HASH
  TadHash,
  //TadHashZO,

  //ARBOL AVL
  ArbolesBinariosAVL,

  //ARBOL B
  BTree;

const
  TClave = Numero;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
    //Las 3 estrucutras del ejercicio
  TA: TablaHash;
  AVL: ArbolAVL;
  B: ArbolB;


implementation

{$R *.dfm}

{
Ejercicio 6
  Realizar una comparación de los tiempos de accesos a las claves entre un árbol AVL y una tabla hash.

  El operador debe poder indicarle cuántas claves se deben generar (entre 1 y 5000), cuántas repeticiones se realizarán y cuál es el rango de las claves a generar. Luego se tomarán claves al azar dentro del mismo rango y se buscarán en ambas estructuras.

  El proceso se repetirá n veces (repeticiones a ingresar por el operador).

  Documentar la conclusión final respecto a los tiempos de accesos de ambas estructuras.

Ejercicio 7
  Ídem al punto anterior (ejercicio 6) pero comparando un árbol “B” contra la tabla Hash.

  Comparar los tiempos de accesos a las claves en ambas estructuras.

  Documentar la conclusión final respecto a los tiempos de accesos de ambas estructuras.
}

//Funcion que me dice si ese numero es primo
function es_primo(numero: Integer): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 2 to trunc(sqrt(numero)) do
  begin
    if (numero mod i = 0) then
    begin
      Result := False;
      Break;
    end;
  end;
end;

//Funcion que busca al primo mas cercanos
function primoMascercano(N: Integer): Integer;
begin
  if es_primo(n) then
  begin
    Result := N;
  end
  else
  begin
    Result := primoMascercano(N-1);
  end;
end;

//Boton que realiza la carga random de los elementos
procedure TForm1.Button1Click(Sender: TObject);
var
primo,tamaño,desde,hasta: integer;
begin
  primo := primoMasCercano(Strtoint(Edit1.Text));
  tamaño := Strtoint(Edit1.Text);
  desde := Strtoint(Edit2.Text);
  hasta := Strtoint(Edit3.Text);

  TA.Crear(TClave,Modulo,tamaño,primo);
  TA.LLenarClavesRandom(tamaño,primo,desde,hasta);

  AVL.Crear(TClave,tamaño);
  AVL.LlenarClavesRandom(tamaño,desde,hasta);

  B.Crear(TClave,tamaño);
  B.LLenarClavesRandom(tamaño,desde,hasta);

  memo1.Lines.Add('Estructuras cargadas.');
  memo1.Lines.Add('Tamaño: ' + tamaño.ToString);
  memo1.Lines.Add('Primo mas cercano: ' + primo.ToString);
  memo1.Lines.Add('Rango: [' + desde.ToString + ',' + hasta.ToString + ']' );

end;

//Boton que realiza la busqueda
procedure TForm1.Button2Click(Sender: TObject);
var
tiempo_inicio,tiempo_fin: TDateTime;
X: TipoElemento;
Posicion: Variant;
i: Indice;
begin
  Posicion := '';
  X.Clave := 1 + Random(Strtoint(Edit3.Text));
  memo1.Lines.Add('Clave a buscar: ' + Vartostr(X.Clave));
  tiempo_inicio := Now;
  if TA.Buscar(X,Posicion) <> PosNula then
  begin
    tiempo_fin := Now;
    memo1.Lines.Add('Tabla hash tarda ' + FloatToStr((tiempo_fin - tiempo_inicio) * 24 * 60 * 60) + ' segundos');
  end
  else
  begin
    memo1.Lines.Add('No se encontro el elemento en Tabla hash');
  end;

  tiempo_inicio := Now;
  if AVL.BusquedaBinaria(X) <> Nulo then
  begin
    tiempo_fin := Now;
   memo1.Lines.Add('Arbol ABL tarda ' + FloatToStr((tiempo_fin - tiempo_inicio) * 24 * 60 * 60) + ' segundos');
  end
  else
  begin
    memo1.Lines.Add('No se encontro el elemento en arbol AVL');
  end;

  tiempo_inicio := Now;
  if B.BuscarClave(X,i) <> Nulo then
  begin
    tiempo_fin := Now;
    memo1.Lines.Add('Arbol B tarda ' + FloatToStr((tiempo_fin - tiempo_inicio) * 24 * 60 * 60) + ' segundos');
  end
  else
  begin
    memo1.Lines.Add('No se encontro el elemento en arbol B');
  end;

  {
  No es posible obtener una conclusion es base a la busqueda en los 3 casos, debido a que delphi no ofrece
  una forma de saber la cantidad de accesos que se realiza a una estrucutra y buscarlo en tiempo, pero en cuanto a
  busqueda de un elemento determinado, el que mas rapido logra hacerlo es la tabla hash, ya que solamente
  necesito calcular la posicion mediante la funcion hash, encontrar el valor dentro de esta (en el mejor de los casos,
  estara en el lugar que la busque dentro del arreglo) y luego revisar si esta en la zona de colisiones.
  }

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Clear
end;

end.
