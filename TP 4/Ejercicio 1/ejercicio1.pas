unit ejercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, Vcl.StdCtrls,
  ListArray;
  //ListCursor;
  //ListPointer;

const
  cantElementos = 3;
  cantElementosMax = 10;
  minRandom = 1;
  maxRandom = 10;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnMostrar: TButton;
    btnMayor: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure btnMostrarClick(Sender: TObject);
    procedure btnMayorClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  List: Lista;

{Dada una lista cargada con valores al azar realizar los siguientes ejercicios:

    Mostrar una lista desde el último elemento al primero.
    Que calcule el mayor de los datos e indique la posición ordinal.
    Que calcule el dato mínimo y cuente la cantidad de veces que se repita.
    Que obtenga el promedio de los datos de una lista. El proceso debe ser recursivo.
    Que retorne otra lista con los números múltiplos de otro número que recibe como parámetro. El proceso debe ser recursivo.
    Generar un algoritmo que genere números al azar únicos dentro de la lista.
}

implementation

{$R *.dfm}

function Cargar_Al_Azar_Unico (aL: Lista; Tamaño_Maximo, Numero: Integer): Lista;
var Inicio, Posicion, Fin: PosicionLista;
begin
  Posicion := aL.Comienzo;
  Fin := aL.Fin;
end;

function Promedio(aL: Lista; Inicio, Fin: PosicionLista): Variant;
var Suma: TipoElemento;
begin
  if Inicio = Fin then
  begin
    Result := aL.Recuperar(Fin).Clave;
  end
  else
  begin
    Result := aL.Recuperar(Inicio).Clave + Promedio(aL,Inicio + 1,Fin);
  end;
end;

procedure TForm1.btnMayorClick(Sender: TObject);
var Inicio, Inicio_X, Fin: PosicionLista;
    X, mayorDato: tipoElemento;
    PosicionMayor: integer;
begin
  Inicio := List.Comienzo;
  Fin := List.Fin;
  mayorDato := List.Recuperar(Inicio);
  PosicionMayor := Inicio;
  while (Inicio < Fin) do begin
    X := List.Recuperar(List.Siguiente(Inicio));
    Inicio_X := Inicio + 1;
    if mayorDato.Clave < X.Clave then begin
      mayorDato := X;
      PosicionMayor := Inicio_X;
    end;
    Inicio := List.Siguiente(Inicio);
  end;
  memo1.Lines.Add('Valor:' + mayorDato.ArmarString);
  memo1.Lines.Add('Posicion:' + PosicionMayor.ToString);
end;

procedure TForm1.btnMostrarClick(Sender: TObject);
var
    X: PosicionLista;
    XA: tipoElemento;
    S: string;
begin
  memo1.Lines.Add('Mostrando elementos de la lista empezando desde el último: ');
  X := List.Fin;
  while X <> Nulo do begin
    XA := List.Recuperar(X);
    S := XA.ArmarString;
    memo1.Lines.Add(S);
    X := List.Anterior(X)
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  List.LlenarClavesRandom(cantElementos, minRandom, maxRandom);
  memo1.Lines.Add('Lista cargada satisfactoriamente');
end;

procedure TForm1.Button2Click(Sender: TObject);
var Inicio, Fin: PosicionLista;
    X, menorDato: tipoElemento;
    Repeticiones: Integer;
begin
  Inicio := List.Comienzo;
  Fin := List.Fin;
  menorDato := List.Recuperar(Inicio);
  Repeticiones := 1;
  while (Inicio < Fin) do begin
    X := List.Recuperar(List.Siguiente(Inicio));
    if menorDato.Clave = X.Clave then
    begin
      Repeticiones := Repeticiones + 1;
    end;
    if menorDato.Clave > X.Clave then
    begin
      menorDato := X;
      Repeticiones := 1;
    end;
    Inicio := List.Siguiente(Inicio);
  end;
  memo1.Lines.Add('Valor:' + menorDato.ArmarString);
  memo1.Lines.Add('Repeticiones:' + Repeticiones.ToString);
end;

procedure TForm1.Button3Click(Sender: TObject);
var Valor: Variant;
  Inicio, Fin: PosicionLista;
begin
  Inicio := List.Comienzo;
  Fin := List.Fin;
  Valor := Promedio(List,Inicio,Fin);
  Valor :=Valor / ((Fin - Inicio) + 1);
  Valor := FormatFloat ('0.0', Valor);
  memo1.Lines.Add('El promedio de todos los valores es ' + vartostr(Valor));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear
end;


end.
