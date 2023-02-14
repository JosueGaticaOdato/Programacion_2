unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.TypInfo,
  Tipos, StackPointer,
  ListArray,
  //ListPointer,
  //ListCursor,
  //ArbolesBinarios,
  ArbolesBinariosAVL;

const
  Desde = 1;
  Hasta = 10;
  Maximo = 5;
  ach = 'datos.txt';

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Vector = Array of string;

  trabajador = record
    actividad: string;
    vto: TDate;
    dias: string;
  end;

  archivo = TextFile;

var
  Form1: TForm1;
  L: Lista;
  //A: Arbol;
  AVL: ArbolAVL;

implementation

{$R *.dfm}

// Funcion Parsing, Interna a la implementacion
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
    Inc(I); //Incremento la variables
    SetLength(V, I);  // Se redimensiona el array y no se pierden los datos
    V[I-1] := Copy(aSS, 1, P-1); //Realizo el corte y lo pongo en el vector
    aSS := Copy(aSS, P+1, Length(aSS)); //Actualizo el nuevo string
    P := Pos(aSep, aSS); //Muevo la posicion nueva a cortar
  End;

  // Retorno el array
  Parsing := V;
End;

//Ahora puedo cargar desde el archivos los dato
procedure cargarArchivo(var AVL: ArbolAVL);
var
X: TipoElemento;
t: trabajador;
p: ^trabajador;
v: vector;
aA: archivo;
text: string;
a: Errores;
begin
  AssignFile(aA,ach);
  Reset(aA); // Abro el archivo en modo lectura
  new(p);
  while not eof(aA) do
  begin
    readLn(aA,text);
    v := parsing(text,';');
    X.Clave := strtoint(v[0]);

    t.actividad := v[1];
    t.vto := strtodate(v[2]);
    t.dias := v[3];
    p^  := t;
    X.Valor2 := p;
    a := AVL.Insertar(X);

  end;
  dispose(p);
  closeFile(aA);
end;

procedure cargarPermiso(var AVL: ArbolAVL);
var
X: TipoElemento;
t: trabajador;
p: ^trabajador;
a: Errores;
begin
  new(p);
  X.Clave := strtoint(InputBox('Ingresar DNI', 'Ingresar Datos', '.'));
  t.actividad := InputBox('Ingresar actividad que desarrolla', 'Ingresar Datos', '.');
  t.vto := Now;
  t.dias := '';
  p^ := t;
  X.Valor2 := p;
  a := AVL.Insertar(X);
  dispose(p);
end;

//_-----------------------

//Ejercicio Pila
function sumaAscendinte(var P: Pila): integer;
var
sumador,anterior,mayorSuma: integer;
x: TipoElemento;
begin
  mayorSuma := 0;
  sumador := 0;
  anterior := 0;
  while not P.EsVacia do
  begin
    x := p.Recuperar;
    if anterior < x.Clave then
    begin
      anterior := x.Clave;
      sumador := sumador + x.Clave;
      P.DesApilar;
    end
    else
    begin
      if sumador > mayorSuma then
      begin
        mayorSuma := sumador;
      end;
      sumador := 0;
      anterior := 0;
    end;

  end;
  Result := mayorSuma;
end;

procedure cargarPilaManual(var P: Pila);
var
x: TipoElemento;
begin
  x.Clave := 27;
  P.Apilar(x);
  x.Clave := 4;
  P.Apilar(x);
  x.Clave := 2;
  P.Apilar(x);
  x.Clave := 3;
  P.Apilar(x);
  x.Clave := 9;
  P.Apilar(x);
  x.Clave := 8;
  P.Apilar(x);
  x.Clave := 6;
  P.Apilar(x);
  x.Clave := 2;
  P.Apilar(x);
  x.Clave := 36;
  P.Apilar(x);
  x.Clave := 5;
  P.Apilar(x);
   x.Clave := 3;
  P.Apilar(x);
  x.Clave := 4;
  P.Apilar(x);
  x.Clave := 1;
  P.Apilar(x);
end;
//_-----------------------

//Verificar si una lista esta en orden ascendente O(N)
Function isOrdenAsc(var L: Lista): Boolean;
var
i: integer;
x1,x2: tipoElemento;
orden: Boolean;
begin
  i := L.Comienzo;
  orden := true;
  while (i < L.SizeList) and (orden) do
  begin
    x1 := L.Recuperar(I);
    x2 := L.Recuperar(L.Siguiente(I));
    if (x1.Clave > x2.Clave) then
    BEGIN
      orden := false;
    END;
    I := L.Siguiente(I);
  end;
  Result := orden;
end;

//_-----------------------

{//Recorrido del arbol en HD,HI,R
function invertir(var L: Lista): Lista;
var L2: Lista;
  I: Integer;
  X: TipoElemento;
begin
  L2.Crear(L.DatoDeLaClave,L.SizeList);
  I := L.Fin;
  while not (I = L.Comienzo) do
  begin
    X := L.Recuperar(I);
    L2.Agregar(X);
    I := L.Anterior(I);
  end;
  X := L.Recuperar(I);
  L2.Agregar(X);

  Result := L2;
end;
function recorridoArbolIterativo(Var A: Arbol; P: PosicionArbol): Lista;
var
LA: Lista;
Stack: Pila;
X: TipoElemento;
i: integer;
begin
  LA.Crear(A.DatoDeLaClave,A.CantidadNodos);
  Stack.Crear(A.DatoDeLaClave,A.SizeTree);
  X := A.Recuperar(P);
  Stack.Apilar(X);
  while not Stack.EsVacia do
  begin
    X := Stack.Recuperar;
    Stack.DesApilar;
    P := A.BuscarPreOrden(X);
    if not A.RamaNula(P) then
    begin
      Stack.Apilar(A.Recuperar(A.HijoDerecho(P)));
      Stack.Apilar(A.Recuperar(A.HijoIzquierdo(P)));
      X := A.Recuperar(P);
      LA.Agregar(X);
    end;
  end;

  Result := invertir(LA);

end;
function recorridoArbol(var A: Arbol): Lista;
var
LA: Lista;
  procedure ra(P:PosicionArbol);
  var x: tipoElemento;
  begin
    if not A.RamaNula(P) then
    begin
      ra(A.HijoDerecho(P));
      ra(A.HijoIzquierdo(P));
      X := A.Recuperar(P);
      LA.Agregar(X);
    end;
  end;

begin
  LA.Crear(A.DatoDeLaClave,A.CantidadNodos);
  ra(A.Root);
  Result:= LA;
end;
//_----------------------- }

procedure TForm1.Button1Click(Sender: TObject);
var L2: Lista;
  I: Integer;
  X: TipoElemento;
begin
  L.Crear(Numero,Maximo);
  L.LlenarClavesRandom(Maximo,Desde,Hasta);
  memo1.lines.add(L.RetornarClaves);
 memo1.Lines.Add(BoolToStr(isOrdenAsc(L),true));
  L2.Crear(Numero,Maximo);
  for I := 1 to 5 do
  begin
    X.Clave := I;
    L2.Agregar(X);
  end;
  memo1.lines.add(L2.RetornarClaves);
  memo1.Lines.Add(BoolToStr(isOrdenAsc(L2),true));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
aLA,aLA2: Lista;
begin
  {A.Crear(Numero,100);
  A.CargarArbol;
  aLA := recorridoArbol(A);
  memo1.Lines.Add(aLa.RetornarClaves);

  aLA2 := recorridoArbolIterativo(A,A.Root);
  memo1.Lines.Add(aLa2.RetornarClaves);}
end;

procedure TForm1.Button3Click(Sender: TObject);
var P: Pila;
begin
  p.Crear(Numero,100);
  cargarPilaManual(P);
  memo1.Lines.Add(sumaAscendinte(P).ToString);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  AVL.Crear(Numero,50);
  cargarArchivo(AVL);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  memo1.Lines.Add(AVL.PreOrden);
end;

procedure TForm1.Button6Click(Sender: TObject);
var
p: PosicionArbol;
x: TipoElemento;
a: ^trabajador;
begin
  X.Clave := strtoint(InputBox('Ingresar DNI', 'Ingresar Datos', '.'));
  p := AVL.BusquedaBinaria(X);
  X := AVL.Recuperar(P);
  a := X.Valor2;
  if (p <> nulo) and (a.vto < now) then
  begin
    memo1.Lines.Add('Encontrado' + vartostr(AVL.Recuperar(P).Clave));
    memo1.Lines.Add('No esta vencido');
    memo1.Lines.Add('Trabajo: ' + a.actividad);
    memo1.Lines.Add('Fecha vencimiento: ' + datetostr(a.vto));
    memo1.Lines.Add('Dias: ' + a.dias);
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  cargarPermiso(AVL);
end;

end.
