unit Unit_Ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

const
  tamMin = 1;
  tamMax = 5;
  valorMin = 1;
  valorMax = 10;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Vector = Array [tamMin .. tamMax] of Integer;

var
  Form1: TForm1;
  VectorBurbuja: Vector;
  VectorQSort: Vector;
  VectorSeleccion: Vector;

implementation

{$R *.dfm}
{

  Ejercicio 9

  Dado un vector de 1000 elementos números generados en forma
  aleatoria entre 1 y 10000. Se pide realizar 3 procesos de
  ordenamiento diferente y comparar las diferencias de tiempos
  de procesamiento (sugeridos, burbuja, burbuja mejorado, Qsort o selección).

}

procedure cargarVectores();
var
  I: Integer;
begin
  for I := tamMin to tamMax do
  begin
    Randomize();
    VectorBurbuja[I] := Random(valorMax);
    VectorQSort[I] := Random(valorMax);
    VectorSeleccion[I] := Random(valorMax);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  cargarVectores();
  Memo1.Lines.Add('Vectores cargados!');
end;

procedure seleccion(var aV: Vector);
var i,j,swap, mas_chico: integer;
begin
  for i := TamMIN to tamMax do
  begin
    mas_chico := i;
    for j := i+1 to tamMax do
    begin
      if aV[j] < aV[mas_chico] then
      begin
        mas_chico := j;
      end;
    end;
    if mas_chico <> i then
    begin
      swap := aV[i];
      aV[i] := aV[mas_chico];
      aV[mas_chico] := swap;
    end;
  end;
end;

PROCEDURE quick_sort (var vector : Vector;  izquierda, derecho : integer );
Var
  pared,actual : integer;
  tmp, pivote : integer;
BEGIN
  (* separación entre los elementos más pequeños y más grandes como pivote *)
  pared := izquierda;
  actual := izquierda;
  (* el elemento pivote es el más a la derecha *)
  pivote := vector[derecho];
  REPEAT
    IF (vector[actual] <= pivote) then
    BEGIN
        IF pared <> actual THEN
        BEGIN
            tmp:=vector[actual];
            vector[actual]:=vector[pared];
            vector[pared]:=tmp;
        END;
        pared := pared + 1;
    END;
    actual := actual + 1;
  UNTIL actual>derecho;
  (* Se continúa con la recursividad *)
  IF (izquierda<pared-1) THEN quick_sort(vector,izquierda,pared-1);
  IF (pared+1<derecho) THEN quick_sort(vector,pared,derecho);
END;

procedure Burbuja(var aV: Vector); { Ordena segÃºn burbuja }
var
  I, swap: Integer;
  cambiado: boolean;
begin
  repeat
    cambiado := false; { No cambia nada aÃºn }
    for I := tamMax downto 2 do { De final a principio }
      if aV[I] < aV[I - 1] then { Si estÃ¡ colocado al revÃ©s }
      begin
        swap := aV[I];
        aV[I] := aV[I - 1];
        aV[I - 1] := swap;
        cambiado := true; { Y habrÃ¡ que seguir mirando }
      end;
  until not cambiado; { Hasta q nada haya cambiado }
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   T0: Cardinal;
begin
   T0 := GetTickCount;
   Burbuja(VectorBurbuja);
   memo1.Lines.Add('Burbuja tarda' + TimeToStr(Now - T0));
   T0 := GetTickCount;
   quick_sort(VectorQSort);
   memo1.Lines.Add('QSort tarda' + TimeToStr(Now - T0));
   T0 := GetTickCount;
   seleccion(Vectorseleccion);
   memo1.Lines.Add('Burbuja tarda' + TimeToStr(Now - T0));
end;

end.
