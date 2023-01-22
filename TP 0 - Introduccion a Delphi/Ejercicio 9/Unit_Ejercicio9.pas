unit Unit_Ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

const
  tamMin = 1;
  tamMax = 100000; //Era 1000 ero no se nota la diferencia entre los 3
  valorMin = 1;
  valorMax = 10000;

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
  I, Valor: Integer;
begin
  for I := tamMin to tamMax do
  begin
    Randomize();
    Valor := valorMin + Random(valorMax);
    VectorBurbuja[I] := Valor;
    VectorQSort[I] := Valor;
    VectorSeleccion[I] := Valor;
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

//---------------------------------------------------------------------
// Ordenamiento RAPIDO, uno de los mas eficientes
//---------------------------------------------------------------------
Procedure QSort(var Items : Vector;aAsc: Boolean);
  // Proceso que resuelve el orden Ascendente
  Procedure IntAsc(al_Firts, al_Last: LongInt);
  Var ll_i, ll_j: LongInt;
      ll_centro: LongInt;
      ll_temp: LongInt;
  Begin
    ll_i := al_Firts;
    ll_j := al_Last;
    ll_centro := Items[(al_Firts + al_Last) div 2];
    Repeat
        While Items[ll_i] < ll_centro Do Begin
            ll_i := ll_i + 1;
        End;
        While Items[ll_j] > ll_centro Do Begin
            ll_j := ll_j - 1;
        End;
        If ll_i <= ll_j Then Begin
            ll_temp := Items[ll_i];
            Items[ll_i] := Items[ll_j];
            Items[ll_j] := ll_temp;
            ll_i := ll_i + 1;
            ll_j := ll_j - 1;
        End;
    Until ll_i > ll_j;
      If al_Firts < ll_j Then Begin
        IntAsc(al_Firts, ll_j);
    End;
    If ll_i < al_Last Then Begin
        IntAsc(ll_i, al_Last);
    End;
  End;
  // Proceso que resuelve el orden Descendente
  Procedure IntDesc(al_Firts, al_Last: LongInt);
  Var ll_i, ll_j: LongInt;
      ll_centro: LongInt;
      ll_temp: LongInt;
  Begin
    ll_i := al_Firts;
    ll_j := al_Last;
    ll_centro := Items[(al_Firts + al_Last) div 2];
    Repeat
        While Items[ll_i] > ll_centro Do Begin
            ll_i := ll_i + 1;
        End;
        While Items[ll_j] < ll_centro Do Begin
            ll_j := ll_j - 1;
        End;
        If ll_i <= ll_j Then Begin
            ll_temp := Items[ll_i];
            Items[ll_i] := Items[ll_j];
            Items[ll_j] := ll_temp;
            ll_i := ll_i + 1;
            ll_j := ll_j - 1;
        End;
    Until ll_i > ll_j;
      If al_Firts < ll_j Then Begin
        IntDesc(al_Firts, ll_j);
    End;
    If ll_i < al_Last Then Begin
        IntDesc(ll_i, al_Last);
    End;
  End;

  // Llama al Proceso interno
Begin
  if length(items) > tamMin then Begin
    if aASC then IntAsc(tamMin,length(items))
    Else IntDesc(tamMin,length(items));
  End;
End;

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
   inicio : String;
begin
   inicio := datetimetostr(now);
   Burbuja(VectorBurbuja);
   memo1.Lines.Add('Inicio Burbuja: ' + inicio);
   memo1.Lines.Add('Burbuja tarda' + datetimetostr(now));
   inicio := datetimetostr(now);
   QSort(VectorQSort,true);
   memo1.Lines.Add('Inicio quicksort: ' + inicio);
   memo1.Lines.Add('QSort tarda' + datetimetostr(now));
   inicio := datetimetostr(now);
   seleccion(Vectorseleccion);
   memo1.Lines.Add('Inicio seleccion: ' + inicio);
   memo1.Lines.Add('Seleccion tarda' + datetimetostr(now));
end;

{
Resultados
Inicio Burbuja: 22/1/2023 04:32:47
Burbuja tarda22/1/2023 04:34:22
Inicio quicksort: 22/1/2023 04:34:22
QSort tarda22/1/2023 04:34:22
Inicio seleccion: 22/1/2023 04:34:22
Seleccion tarda22/1/2023 04:34:45

}

end.
