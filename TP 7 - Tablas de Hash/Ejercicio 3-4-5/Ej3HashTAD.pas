unit Ej3HashTAD;

interface

uses
  Tipos,SysUtils,
  TadHash;
  //TadHashZO;

const
  Min = 1;
  Max = 7;
  tipoClave = Numero;
  tipoFuncionHash = Modulo;
  cantElemTabla = 7;
  nroPrimo = 10;
  Esp = Char(32);

type
  Ej3 = Object
  private
    T: TablaHash;
  public
    procedure crearArchivo(archivo: String);
    procedure cargarProducto(aCodigo,aPrecio:longInt;aStock:integer;archivo,aDetalle:string);
    function mostrarArchivo(aFile:string) : string;
    {function eliminarProducto(aCodigo:longInt;aFile:string) : boolean;
    function modificarProducto(aCodigo, aPrecio:longint; aStock: Integer; aFile,aDetalle: string) : boolean;

    procedure crearTabla(aTClave: tipoDatosClave; aTHash: tipoFuncionesHash;
      aCantElem, aNPrimo: integer);
    procedure cargarTabla();
    function mostrarTabla(): string;
    function Porcentaje_Ocupacion(): Extended;
    function Claves_Cargadas_VS_ZO(): Extended;}

  End;

  recProducto = Record
    Codigo: LongInt;
    Detalle: string[15];
    Precio: LongInt;
    stock: integer;
    Borrado: boolean;
  End;

  //Archivo donde tengo los productos
  aProducto = File of recProducto;

implementation

//Procedimineto que crea el archivo
procedure Ej3.crearArchivo(archivo: String);
var
  RP: recProducto;
  AP: aProducto;
begin
  AssignFile(AP, archivo);
  if not FileExists(archivo) then begin //Si no existe el archivo
    //Creo y cierro
    Rewrite(AP);
    CloseFile(AP);
  end;
end;

//Funcion que carga el producto
procedure Ej3.cargarProducto(aCodigo,aPrecio:longInt;aStock:integer;archivo,aDetalle:string);
var
  RP: recProducto;
  AP: aProducto;
begin
  AssignFile(AP,archivo); //Asigno el archivo a mi variable
  Reset(AP);
  while not EOF(AP) do
  begin
    Read(AP,RP);
  end;
  //Abro en el final
  RP.Codigo := aCodigo;
  RP.Detalle := aDetalle;
  RP.Precio := aPrecio;
  RP.stock := aStock;
  RP.Borrado := True;
  Write(AP,RP);
  CloseFile(AP);
end;

//Funcion que muestra el contenido del archivo
function Ej3.mostrarArchivo(aFile:string) : string;
var
  RP: recProducto;
  AP: aProducto;
  S: string;
begin
  S:='';
  if FileExists(aFile) then begin
    Reset(AP);
    while not EOF(AP) do begin
      Read(AP,RP);
      S := S + RP.Codigo.ToString + Esp + RP.Detalle + Esp +
      RP.Precio.ToString + Esp + RP.stock.ToString + Esp +
      RP.Borrado.ToString + cCRLF;
    end;
    CloseFile(AP);
    Result := S;
  end;
end;

{

//Funcion que busca el codigo del producto y lo modifica
function Ej3.modificarProducto(aCodigo, aPrecio:longint; aStock: Integer; aFile,aDetalle: string) : boolean;
begin
  if fileExists(aFile) then begin
    Reset(AP);
    while not EOF(AP) do begin
      Read(AP,RP);
      if RP.Codigo = aCodigo then begin
        RP.Detalle := aDetalle;
        RP.Precio := aPrecio;
        RP.stock := aStock;
      end;
    end;
    CloseFile(AP);
  end;

end;

//Funcion que muestra el contenido del archivo
function Ej3.mostrarArchivo(aFile:string) : string;
var S: string;
begin
  S:='';
  if FileExists(aFile) then begin
    Reset(AP);
    while not EOF(AP) do begin
      Read(AP,RP);
      S := S + RP.Codigo.ToString + Esp + RP.Detalle + Esp +
      RP.Precio.ToString + Esp + RP.stock.ToString + Esp +
      RP.Borrado.ToString + cCRLF;
    end;
    CloseFile(AP);
    Result := S;
  end;
end;

//Funcion que elimina el producto
function Ej3.eliminarProducto(aCodigo:longInt;aFile:string) : boolean;
var Borrado:boolean;
begin
  if FileExists(aFile) then begin
    Reset(AP);
    while (not EOF(AP)) and (RP.Codigo <> aCodigo) do begin
      Read(AP,RP);
      if RP.Codigo = aCodigo then begin
        RP.Borrado := False;
        Borrado := True;
      end;
    end;
    if (RP.Codigo <> aCodigo) then Borrado := False;
    CloseFile(AP);
  end
  else Borrado := False;
  Result := Borrado;
end;



//Funcion que muestra el contenido de mi tabla hash
function Ej3.mostrarTabla: string;
begin
  Result := T.RetornarClaves;
end;

//Procedimiento que carga la tabla hash
procedure Ej3.cargarTabla();
var
  I: integer;
  X: tipoElemento;
begin
  for I := Min to Max do
  begin
    X.Clave := I;
    T.Insertar(X);
  end;
end;

//Procedimiento que crea la tabla hash
procedure Ej3.crearTabla(aTClave: tipoDatosClave; aTHash: tipoFuncionesHash;
  aCantElem, aNPrimo: integer);
begin
  T.Crear(aTClave, aTHash, aCantElem, aNPrimo);
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
end;   }

end.
