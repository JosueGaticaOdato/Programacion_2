unit Unit_Ejercicio8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

const
  meses = 12;
  total = meses + 1;
  separador = ';';
  codigo = 0;
  fecha = 1;
  importe = 2;
  FacturasEjemplo = '.\Facturas.txt'; //Factura del ejercicio
  //FacturasEjemplo = '.\Facturas2.txt'; //Factura de practica inventada

  type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    procedure calcularTotal();
    procedure cargarEnGrilla(mes: Word; posicion: integer; valor: extended);
    function buscarPosicionAño(año: word): Integer;
    procedure cargarDeTitulos();
    procedure cargarDatos();
    procedure FormCreate(Sender: TObject);
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

  Ejercicio 8
  Dado un archivo de texto que contiene datos de facturas,
  se pide obtener los totales por año/mes en forma de grilla como se muestra debajo.

  El archivo contiene los siguientes datos:
  NroFactura;Fecha;Importe. El separador de campos es un ;.
  Debajo se muestra un pequeño ejemplo.

  1000;10/01/2019;500.25
  1000;11/01/2019;50.10
  1001;11/01/2020;1200.50
  1002;01/02/2021;950.75
  1003;03/03/2021;480.90

  Año / mes	1	      2	        3	...	    Total
  2019	    550.35				              550.35
  2020	    1200.50				              1200.50
  2021		          970.75	  480.90	  1451.65
}

// Procedimiento que carga en la grilla los titulos
procedure TForm1.cargarDeTitulos();
var
  i: Integer;
begin
  StringGrid1.Cells[0, 0] := 'Año / mes'; //En 0,0: El año/Mes
  for i := 1 to meses do
  begin
    StringGrid1.Cells[i, 0] := i.ToString; //En las demas columnas, los meses
  end;
  StringGrid1.Cells[total, 0] := 'Total'; //Al final, el total
end;

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

//Boton que carga todos los datos en la grilla
procedure TForm1.Button1Click(Sender: TObject);
begin
  cargarDatos();
end;

//Procedimiento que se encarga de realizar la carga de datos
procedure TForm1.cargarDatos();
var
  dato: String;
  V: TextFile;
  posicion: Integer;
  Valores: Vector;
  wAnyo, wMes, wDia: word;
  valor: extended;
begin
  AssignFile(V, FacturasEjemplo); //Asigno el archivo
  Reset(V); // Abro el archivo en modo lectura
  while not EOF(V) do //Mientras no lea todas las lineas
  begin
    ReadLn(V, dato); // Leo la linea)
    Valores := Parsing(dato, separador); // Realizo el parsing y obtengo los datos
    // 1 DATO: CODIGO - 2 DATO: FECHA - 3 DATO: IMPORTE
    // Obtengo la fecha y el año
    DecodeDate(StrToDate(Valores[fecha]), wAnyo, wMes, wDia); //Obtengo la fecha y la separo
    posicion := buscarPosicionAño(wAnyo); //Busco la posicion donde esta esa fecha
    valor := strtofloat(Valores[importe]); //Obtengo el valor de la facturaa
    cargarEnGrilla(wMes,posicion,valor); //Llamo a la funcion para cargarlo en la grilla
  end;
  calcularTotal(); //Una vez cargadas todas las grillas, calculo el total
end;

//Procedimiento que calcula el total de todos los meses de cada año
procedure TForm1.calcularTotal();
var i,j: integer;
  totalFactura: extended;
begin
  i := 1;
  //Mientras no haya una grilla de año vacia
  while not (StringGrid1.Cells[0,i] = '') do
  begin
    totalFactura := 0;
    for j := 1 to meses do //Recorro todas las facturas de cada mes
      begin
        if StringGrid1.Cells[j,i] <> '' then //Si es distinto a vacio
        begin
          totalFactura := totalFactura + strtofloat(StringGrid1.Cells[j,i]); //Lo sumo al total
        end;
      end;
    StringGrid1.Cells[total,i] := floattostr(totalFactura); //Cargo el total en su grilla
    inc(i); //Incremento i
  end;
end;

//Procedure que carga en la grilla el valor
procedure TForm1.cargarEnGrilla(mes: Word; posicion: integer; valor: extended);
begin
  if StringGrid1.Cells[strtoint(mes.ToString),posicion] = '' then //Si esta vacio
  begin
    //Cargo ese valor
    StringGrid1.Cells[strtoint(mes.ToString),posicion] := floattostr(valor);
  end
  else //Si no esta vacio y hay un valor antes
  begin
    //A esa grilla, le realizo la suma del nuevo importe y el anterior
    StringGrid1.Cells[strtoint(mes.ToString),posicion] :=
      (strtofloat(StringGrid1.Cells[strtoint(mes.ToString),posicion]) + valor).ToString;
  end;
end;

//Funcion que me dice la posicion donde esta el año
function TForm1.buscarPosicionAño(año: word): Integer;
var
  ubicado: boolean;
  i: Integer;
begin
  i := 1;
  ubicado := false;
  while (i < StringGrid1.RowCount) and (not ubicado) do //Mientras no recorra todas las grillas
  begin
    if StringGrid1.Cells[0, i] = año.ToString then //Consulto si es ese año
    begin
      ubicado := true; //Cambio bandera
    end
    else if StringGrid1.Cells[0, i] = '' then //Si esta vacio
    begin
      ubicado := true; //Cambio bandera
      StringGrid1.Cells[0, i] := año.ToString; //Paso el año
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
  cargarDeTitulos();
end;

end.
