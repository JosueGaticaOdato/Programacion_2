unit ejercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, Vcl.StdCtrls,
  //TAD de Listas (usar 1 y comentar las demas)
  ListArray;
  //ListCursor;
  //ListPointer;

//Constantes del programa
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
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  List: Lista;

{Dada una lista cargada con valores al azar realizar los siguientes ejercicios:

    .Mostrar una lista desde el último elemento al primero.
    .Que calcule el mayor de los datos e indique la posición ordinal.
    .Que calcule el dato mínimo y cuente la cantidad de veces que se repita.
    .Que obtenga el promedio de los datos de una lista. El proceso debe ser recursivo.
    .Que retorne otra lista con los números múltiplos de otro número que recibe como parámetro. El proceso debe ser recursivo.
    .Generar un algoritmo que genere números al azar únicos dentro de la lista.
    .Retornar una lista reflejada o espejada. La función recibirá un
    parámetro adicional según el cual se repetirá o no el último elemento
    de la lista original. Ejemplo: Dada L1 = (A, B, C)
    ReflejarLista(L1, False) resultará igual a (A, B, C, B, A);
    mientras que ReflejarLista(L1, True)
    retornará (A, B, C, C, B, A).
}

implementation

{$R *.dfm}
(*NO ME GUSTA Y NO FUNCIONA COMO DEBE*)
//Funcion que carga de forma al azar numeros unicos en una lista,
//devuelve booleanos si se pudo cargar o no
function Cargar_Al_Azar_Unico (aL: Lista; Tamanio_Max, Num: Integer): bool;
var Posicion: PosicionLista;
    Elem, ElemAAgregar: tipoElemento;
begin
  Posicion := aL.Comienzo; //Obtengo el comienzo
  Elem := aL.Recuperar(Posicion); //Recupero el inicio
  while (Posicion < Tamanio_Max) do begin //Mientras no sobrepase el tamaño maximo de la lista
    if Num <> Elem.Clave then begin //Si el numero es distinto al de la clave
      if (aL.Siguiente(Posicion) = Nulo) then begin //Y la posicion siguiente es nula
        ElemAAgregar := aL.Recuperar(aL.Siguiente(Posicion)); //Recupero la pos siguiente
        ElemAAgregar.Clave := Num; //Gurado la clave
        aL.Agregar(ElemAAgregar); //Agrego
        Result := True;
        Exit
      end
      else begin
        Posicion := Posicion + 1; //Sino subo la posicion
        Elem := aL.Recuperar(Posicion); //Recupero el valor de la posicion
      end;
    end
    else begin
      Result := False;
      Exit
    end;
  end;
end;

//Calculo del promedio de la lista de forma recursiva
function Promedio(aL: Lista; Inicio, Fin: PosicionLista): Variant;
begin
  if Inicio = Fin then //Si llegue al fin devuelvo ese valor
  begin
    Result := aL.Recuperar(Fin).Clave;
  end
  else
  begin //Sino, devuelvo la suma del valor y la funcion de inicio + 1
    Result := aL.Recuperar(Inicio).Clave + Promedio(aL,Inicio + 1,Fin);
  end;
end;

//Procedimiento que consigue el mayor de los datos
procedure TForm1.btnMayorClick(Sender: TObject);
var Inicio, Inicio_X, Fin: PosicionLista;
    X, mayorDato: tipoElemento;
    PosicionMayor: integer;
begin
  //Obtengo el inicio y el fin de la lista
  Inicio := List.Comienzo;
  Fin := List.Fin;
  mayorDato := List.Recuperar(Inicio); //Obtengo el inicio
  PosicionMayor := Inicio; //Guardo su posicion
  while (Inicio < Fin) do begin //Mientras no recorra toda la lista
    X := List.Recuperar(List.Siguiente(Inicio)); //Recupero el valor
    Inicio_X := Inicio + 1; //Guardo la posicion
    if mayorDato.Clave > X.Clave then begin //Si mi mayor es menor
      mayorDato := X; //Camnio el valor
      PosicionMayor := Inicio_X; //Cambio la posicion
    end;
    Inicio := List.Siguiente(Inicio); //Pido el siguiente
  end;
  //Muestro el mayor, su valor y la posicion
  memo1.Lines.Add('Valor:' + mayorDato.ArmarString);
  memo1.Lines.Add('Posicion:' + PosicionMayor.ToString);
end;

//Mostrar los elementos de la lista al revez
procedure TForm1.btnMostrarClick(Sender: TObject);
var
    X: PosicionLista;
    XA: tipoElemento;
    S: string;
begin
  memo1.Lines.Add('Mostrando elementos de la lista empezando desde el último: ');
  X := List.Fin; //Obtengo el fin de la lista
  while X <> Nulo do begin //Hasta que no llegue al final
    XA := List.Recuperar(X); //Recupero el valor
    S := XA.ArmarString; //Lo guardo
    memo1.Lines.Add(S); //Lo muestro
    X := List.Anterior(X) //Pido el anterior (porque estoy en el final)
  end;
end;

//Boton que carga la lista de forma aleatoria
procedure TForm1.Button1Click(Sender: TObject);
begin
  List.Crear(Numero, cantElementosMax);  //Creo la lista
  List.LlenarClavesRandom(cantElementos, minRandom, maxRandom); //Lleno la lista con valores random
  memo1.Lines.Add('Lista cargada satisfactoriamente'); //Muestro que se cargo
end;

//Boton que me dice cual es el menor valor y la cantidad de veces que se repite
procedure TForm1.Button2Click(Sender: TObject);
var Inicio, Fin: PosicionLista;
    X, menorDato: tipoElemento;
    Repeticiones: Integer;
begin
  //Obtengo inicio, fin, menor dato (ahora es el inicio)
  //y la cant de repeticiones (ahora es 1)
  Inicio := List.Comienzo;
  Fin := List.Fin;
  menorDato := List.Recuperar(Inicio);
  Repeticiones := 1;
  while (Inicio < Fin) do begin //Mientras no llegue al fina
    X := List.Recuperar(List.Siguiente(Inicio)); //Recupero el siguiente
    if menorDato.Clave = X.Clave then //Si es igual, aumento las repeticiones
    begin
      Repeticiones := Repeticiones + 1;
    end;
    if menorDato.Clave < X.Clave then //Si es menor, es el nuevo menor y reseteo las repeticiones
    begin
      menorDato := X;
      Repeticiones := 1;
    end;
    Inicio := List.Siguiente(Inicio); //Pido el siguiente
  end;
  //Muestro en pantalla
  memo1.Lines.Add('Valor maximo:' + menorDato.ArmarString);
  memo1.Lines.Add('Se repite:' + Repeticiones.ToString + ' veces.');
end;

//Boton que obtiene el promedio
procedure TForm1.Button3Click(Sender: TObject);
var Valor: Variant;
  Inicio, Fin: PosicionLista;
begin
  Inicio := List.Comienzo;
  Fin := List.Fin;
  Valor := Promedio(List,Inicio,Fin); //LLamo a la funcion promedio
  Valor :=Valor / ((Fin - Inicio) + 1); //Divido el valor
  Valor := FormatFloat ('0.0', Valor); //Formateo
  //Muestro
  memo1.Lines.Add('El promedio de los valores de la lista es ' + vartostr(Valor));
end;

//Boton que genera numeros unicos no repetidos
procedure TForm1.Button4Click(Sender: TObject);
var seCargo: bool;
begin
  Randomize;
  seCargo := Cargar_Al_Azar_Unico(List,CantElementosMax, Random(maxRandom));
  if seCargo then begin //Muestro si se cargo correctamente
    memo1.Lines.Add('Número cargado correctamente');
  end
  else begin
    memo1.Lines.Add('Ese número ya se encuentra en la lista por lo que no pudo ser cargado.');
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear
end;


end.
