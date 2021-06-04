unit ejercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ListArray, ListCursor, ListPointer,
  Vcl.StdCtrls;

const
  cantElementos = 25;
  minRandom = 1;
  maxRandom = 150;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnMostrar: TButton;
    btnMayor: TButton;
    procedure btnMostrarClick(Sender: TObject);
    procedure btnMayorClick(Sender: TObject);
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

//MOSTRAR LISTA DESDE EL ÚLTIMO ELEMENTO
procedure TForm1.btnMostrarClick(Sender: TObject);
var
    X: PosicionLista;
    XA: tipoElemento;
    S: string;
begin
  memo1.Clear;
  List.LlenarClavesRandom(cantElementos, minRandom, maxRandom);
  memo1.Lines.Add('Mostrando elementos de la lista empezando desde el primero: ');
  memo1.Lines.Add(List.RetornarClaves);
  memo1.Lines.Add('Mostrando elementos de la lista empezando desde el último: ');
  X := List.Fin;
  while X <> Nulo do begin
    XA := List.Recuperar(X);
    S := XA.ArmarString;
    memo1.Lines.Add(S + cCRLF);
    X := List.Anterior(X)
  end;
end;

procedure TForm1.btnMayorClick(Sender: TObject);
var N: PosicionLista;
    X, mayorDato: tipoElemento;
    I, posMayorDato: integer;
begin
  N := List.Comienzo;
  I := 1;
  while (N <> Nulo) and (I <= cantElementos) do begin
    mayorDato := List.Recuperar(N);
    X := List.Recuperar(List.Siguiente(N));
    if mayorDato.Clave < X.Clave then begin
      mayorDato := X;
      I := I + 1;
      posMayorDato := I;
    end;
    N := List.Siguiente(N);
  end;
end;

end.
