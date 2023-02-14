unit TADEjercicio3;

interface

uses
  Tipos,SysUtils,
  TadHash;
  //TadHashZO;

const
  longitudCodigo = 7;
  cantClaves = 100;
  tipoClave = Numero;
  tipoFuncionHash = Modulo;
  separador = ',';
  archivo = '.\datos.txt';
  salto = #13#10;


type

  Ej3 = Object
  private
    T: TablaHash;
  public
    procedure crearArchivo();
    function cargarProducto(aCodigo,aPrecio:longInt;aStock:integer;aDetalle:string): boolean;
    function modificarProducto(aCodigo,aPrecio:longInt;aStock:integer;aDetalle:string): boolean;
    function mostrarArchivo() : string;
    function mostrarTablaHash(): String;
    function Porcentaje_Ocupacion(): Extended;
    function Claves_Cargadas_VS_ZO(): Extended;
  End;

  //Vector donde tendre los datos del parsing
  Vector = Array of String;

  //Record con el contenido de los datos del cliente
  recProducto = Record
    Codigo: LongInt; //El codigo lo tendra la clave
    //Mientras que los demas datos estaran en el valor1 o valor2
    Detalle: string[15];
    Precio: LongInt;
    stock: integer;
  End;

  //Archivo donde tengo los productos
  aProducto = TextFile;


implementation

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

//Procedimiento que carga un registro en la tabla hash
procedure cargarEnHash(var t: tablahash; R:recProducto);
var
  Pointer: ^recProducto;
  X: TipoElemento;
begin
    New(Pointer);
    Pointer^ := R;
    X.Clave := R.Codigo;
    X.Valor2 := Pointer;
    T.Insertar(X);
end;

//Procedimiento que se encarga de crear el archivo (si existe no hace nada)
procedure Ej3.crearArchivo();
var
  S: String;
  RP: recProducto;
  AP: aProducto;
  VRP: Vector;
  X: TipoElemento;
  Pointer: ^recProducto;
begin
  AssignFile(AP, archivo);
  if not FileExists(archivo) then begin //Si no existe el archivo
    //Creo
    Rewrite(AP);
    CloseFile(AP);
  end;

 //Cada vez que se crea el archivo, tengo que cargar mis datos en la tabla hash
  T.Crear(Numero,Modulo,cantClaves,primoMasCercano(cantClaves));
  Reset(AP); //Abro en modo lectoescritura
  while not EOF(AP) do begin
    Readln(AP,S);
    VRP := Parsing(S,separador);
    RP.Codigo := strtoint(VRP[0]);
    RP.Precio := strtoint(VRP[1]);
    RP.Stock := strtoint(VRP[2]);
    RP.Detalle := VRP[3];

    cargarEnHash(T,RP);
  end;
  CloseFile(AP);
end;

//Funcion que carga el cliente en el archivo
function Ej3.cargarProducto(aCodigo: Integer; aPrecio: Integer; aStock: Integer; aDetalle: string): Boolean;
var
  AP: aProducto;
  S: String;
  RP: recProducto;
begin
  AssignFile(AP,archivo); //Asigno el archivo a mi variable
  Append(AP); //Abro en el final

  S := aCodigo.ToString + ',' + aPrecio.toString + ',' + aStock.ToString + ',' + aDetalle;

  WriteLN(AP,S);
  CloseFile(AP);

  //Cargo en HASH
  RP.Codigo := aCodigo;
  RP.Precio := aPrecio;
  RP.Stock := aStock;
  RP.Detalle := aDetalle;

  cargarEnHash(T,RP);
end;

//FALTA BAJA Y MODIFICACION
function Ej3.modificarProducto(aCodigo: Integer; aPrecio: Integer; aStock: Integer; aDetalle: string): Boolean;
begin
end;

//Funcion que muestra el contenido del archivo
function Ej3.mostrarArchivo() : string;
var
  RP: String;
  AP: aProducto;
  S: string;
  V: Vector;
begin
  S:='';
  AssignFile(AP,archivo); //Asigno el archivo a mi variable
  Reset(AP);
  while not EOF(AP) do begin
    Readln(AP,RP);
    V := Parsing(RP,separador);
    S := S + 'Codigo: ' + V[0] +
              ' | Precio: ' + V[1] +
              ' | Stock: ' + V[2] +
              ' | Detalle: ' + V[3]
    + salto;
  end;
  CloseFile(AP);
  Result := S;
end;

//Funcion que muestra el contenido de la tabla hash
function EJ3.mostrarTablaHash: string;
begin
  Result := T.RetornarClaves;
end;

//Funcion que me devuelve el porcentaje de ocupacion
function Ej3.Porcentaje_Ocupacion():Extended;
begin
  Porcentaje_Ocupacion := (T.CantidadClaves DIV T.CantidadOcupados);
end;

//Funcion que calcula la diferencia que hay entre claves ocuapadas y claves en ZO
function Ej3.Claves_Cargadas_VS_ZO;
begin
  Claves_Cargadas_VS_ZO := T.CantidadOcupados DIV T.CantidadClavesZO;
end;


end.
