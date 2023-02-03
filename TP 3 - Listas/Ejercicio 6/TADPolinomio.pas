unit TADPolinomio;

interface

uses
  SysUtils,System.Variants,Tipos,
  //ListArray;
  //ListCursor;
  ListPointer;

type
  Polinomio = Object
    Coeficiente: Lista;
    procedure definirTamaño(Tamaño: Integer);
    procedure cargarCoeficiente(Valor: TipoElemento;Grado: integer);
    function mostrarPolinomio(): String;
    function mostrarLista(): String;
  End;

implementation

procedure Polinomio.definirTamaño(Tamaño: Integer);
begin
  Coeficiente.Crear(Numero,Tamaño);
  Coeficiente.LlenarClavesRandom(Tamaño,0,0);
end;

procedure Polinomio.cargarCoeficiente(Valor: TipoElemento; Grado: Integer);
begin
  Coeficiente.Actualizar(Valor,Coeficiente.Ordinal(Grado - 1));
end;

function Polinomio.mostrarPolinomio: string;
var
texto: String;
P: PosicionLista;
X: TipoElemento;
Grado: PosicionLista;
begin
  P := Coeficiente.Fin;
  texto := 'P(x) = ';
  while P <> Nulo do
  begin
    X := Coeficiente.Recuperar(P);
    if X.Clave <> 0 then
    begin
      Grado := Coeficiente.Buscar(X);
       texto := texto + ' + ' + VarToStr(X.Clave) + 'X^';
    end;
    P := Coeficiente.Anterior(P);
  end;
  result := texto;
end;

function Polinomio.mostrarLista(): String;
var
texto: String;
P: PosicionLista;
X: TipoElemento;
muestra0: boolean;
begin
  P := Coeficiente.Fin;
  texto := '(';
  muestra0 := false;
  while P <> Nulo do
  begin
    X := Coeficiente.Recuperar(P);
    if (X.Clave <> 0) or (muestra0) then
    begin
       texto := texto + VarToStr(X.Clave) + ' , ' ;
      muestra0 := true;
    end;
    P := Coeficiente.Anterior(P);
  end;
  texto := texto + ')';
  result := texto;
end;

end.
