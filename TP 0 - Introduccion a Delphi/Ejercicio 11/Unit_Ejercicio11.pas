unit Unit_Ejercicio11;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

const
  Espacio = ' ';
  Cliente = 0;
  Año = 1;
  Dato = 3;
  TAB = #9;
  //MinutosTrabajados = '.\MinutosTrabajados.txt'; //Para el ejemplo
  MinutosTrabajados = '.\practica-0-ejercicio-11.txt'; //400000 DATOS

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cargarDatos();
    procedure cargarDatoEnGrilla(columna,fila: integer; dato: extended);
    function buscarPosicionCliente(Cliente: String): Integer;
    function buscarPosicionAño(año: String): Integer;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
    Vector = Array of String;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{

Ejercicio 11
Dado un archivo de texto que contiene datos de minutos trabajos
por personal de una consultora de sistemas informáticos a
diferentes clientes, se pide obtener los totales por cliente/año
en forma de grilla como se muestra debajo.

El archivo contiene los siguientes datos:
“Cliente Año Mes Minutos_Trabajados”.
El separador de campos es un “Tabulador”.

A continuación se muestra un pequeño ejemplo.
Si el tuviera el siguiente contenido:

Cliente Anio    Mes Minutos_Trabajados
2019    1000    50  1001
1000    2019    01  50
1001    2020    02  120
1001    2021    03  96
1001    2022    01  48
La tabla a producir por el programa debería ser:

Clientes / Años	2019	2020	2021	2022
1000	          50
1001	 	              120	  95	  48
Se adjunta un TXT con estos datos según lo
especificado a procesar con el nombre practica-0-ejercicio-11.txt
que contiene aprox. unas 400.000 filas a procesar.

}

// Funcion Parsing, Interna a la implementacion
Function ParsingEspecial(aSS: String; aSep: String): Vector;
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
  ParsingEspecial := V;
End;

procedure TForm1.Button1Click(Sender: TObject);
begin
  cargarDatos();
end;

procedure TForm1.cargarDatos();
var
  V: TextFile;
  datos: String;
  VectorDatos: Vector;
  PosCliente, PosAño: Integer;
begin
  AssignFile(V,MinutosTrabajados); //Asigno el archivo
  Reset(V); //Abro en el modo lectura
  ReadLn(V,datos); //Dejo pasar el primer dato, que es de metadatos
  while not EOF(V) do //Mientras no llegue al final del archivo
  begin
    ReadLn(V,datos); //Leo el dato y lo guardo
    //VectorDatos := ParsingEspecial2(datos,Espacio); //Obtengo en un vector los datos (ejemplo)
    VectorDatos := ParsingEspecial(datos,TAB); //Obtengo en un vector los datos (archivo 400000 filas)
    PosCliente := buscarPosicionCliente(VectorDatos[Cliente]); //Saco la posicion del cliente
    PosAño := buscarPosicionAño(VectorDatos[Año]);//Saco el año
    cargarDatoEnGrilla(PosAño,PosCliente,strtofloat(VectorDatos[Dato])); //Cargo en la grilla
  end;
end;

procedure TForm1.cargarDatoEnGrilla(columna,fila: integer; dato: extended);
begin
  if StringGrid1.Cells[columna,fila] = '' then //Si esta vacio
  begin
    //Cargo ese valor
    StringGrid1.Cells[columna,fila] := floattostr(dato);
  end
  else //Si no esta vacio y hay un valor antes
  begin
    //A esa grilla, le realizo la suma del nuevo importe y el anterior
    StringGrid1.Cells[columna,fila] :=
      (strtofloat(StringGrid1.Cells[columna,fila]) + dato).ToString;
  end;
end;

//Funcion que me dice la posicion donde esta el año
function TForm1.buscarPosicionCliente(cliente: String): Integer;
var
  ubicado: boolean;
  i: Integer;
begin
  i := 1;
  ubicado := false;
  while (i < StringGrid1.RowCount) and (not ubicado) do //Mientras no recorra todas las grillas
  begin
    if StringGrid1.Cells[0, i] = cliente then //Consulto si es ese año
    begin
      ubicado := true; //Cambio bandera
    end
    else if StringGrid1.Cells[0, i] = '' then //Si esta vacio
    begin
      ubicado := true; //Cambio bandera
      StringGrid1.Cells[0, i] := cliente; //Paso el año
    end
    else
    begin
      Inc(i); //Incremento la variable
    end;
  end;
  result := i; //Devuelvo la posicion donde termino el año
end;

//Funcion que me dice la posicion donde esta el año
function TForm1.buscarPosicionAño(año: String): Integer;
var
  ubicado: boolean;
  i: Integer;
begin
  i := 1;
  ubicado := false;
  while (i < StringGrid1.ColCount) and (not ubicado) do //Mientras no recorra todas las grillas
  begin
    if StringGrid1.Cells[i, 0] = año then //Consulto si es ese año
    begin
      ubicado := true; //Cambio bandera
    end
    else if StringGrid1.Cells[i, 0] = '' then //Si esta vacio
    begin
      ubicado := true; //Cambio bandera
      StringGrid1.Cells[i, 0] := año; //Paso el año
    end
    else
    begin
      Inc(i); //Incremento la variable
    end;
  end;
  result := i; //Devuelvo la posicion donde termino el año
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0] := 'Clientes/Año';
end;

{function calcularClientes(): integer;
var
  contador: integer;
  V: TextFile;
  datos: String;
  VectorDatos: Vector;
  PosCliente, PosAño: Integer;
begin
  AssignFile(V,MinutosTrabajados);
  Reset(V);
  ReadLn(V,datos);
  while not EOF(V) do
  begin
    ReadLn(V,datos);
  end;
end;}

{//Funcio de Parsing que se encarga de devolve en un vector con los datos del cliente
Function ParsingEspecial2(Texto: String; aSep: String): Vector;
Var I, Distancia: Integer;
    P: Integer;
    V: Vector;
Begin
  I := 0;
  // Controlo que el ultimo caracter sea el separador, sino lo agrega
  if Texto.Substring(Texto.Length,1) <> aSep then Texto := Texto + aSep;

  // Hacemos el split
  P := Pos(aSep, Texto); //Busco la primera aparacion
  while ((P > 0) and (Texto <> ' ')) do
  Begin
    Inc(I); //Incremento la variables
    SetLength(V, I);  // Se redimensiona el array y no se pierden los datos
    V[I-1] := Copy(Texto, 1, P-1); //Realizo el corte y lo pongo en el vector
    //aSS := Copy(aSS, P+4, Length(aSS)); //Actualizo el nuevo string
    Distancia := espacios(Texto, aSep, P); //Obtengo la distancia que hay entre los palabras
    Texto := Copy(Texto, P+Distancia, Length(Texto)); //Actualizo el nuevo string
    P := Pos(aSep, Texto); //Muevo la posicion nueva a cortar
  end;

  // Retorno el array
  ParsingEspecial2 := V;
End;}

{//Funcion que me dice el espacio que existe entre las palabras
function espacios(Texto: String; aSep: String; posInicial: integer): integer;
Var I, lugares: Integer;
  bandera: boolean;
begin
  lugares := 0; //Lugares de distancia
  I := posInicial; //Posicion de inicio en el arreglo
  bandera := false; //Bandera
  while (not bandera and (i < length(Texto))) do
  begin
    if Texto[I] <> aSep then //Si la letra es distancia al separador, quiere decir
    //que ahi esta el siguiente dato
    begin
      bandera := true; //Cambio la banderae
    end
    else
    begin //Sino, sigo buscando, aumenta la posicion en el texto y el lugar
      Inc(I);
      Inc(lugares);
    end;
  end;
  Result := lugares; //Devuelva la cantidad de lugares
end;}

end.
