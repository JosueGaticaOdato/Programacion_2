unit Ej3HashTAD;

interface

uses
  TadHash, TadHashZO, Tipos,SysUtils;

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
    procedure crearArchivo();
    procedure cargarProducto(aCodigo,aPrecio:longInt;aStock:integer;aDetalle:string);
    function eliminarProducto(aCodigo:longInt) : boolean;
    function modificarProducto(aCodigo,aPrecio:longint;aStock:integer;aDetalle:string) : boolean;
    function mostrarArchivo() : string;
    procedure crearTabla(aTClave: tipoDatosClave; aTHash: tipoFuncionesHash;
      aCantElem, aNPrimo: integer);
    procedure cargarTabla();
    function mostrarTabla(): string;

  End;

  recProducto = Record
    Codigo: LongInt;
    Detalle: string[15];
    Precio: LongInt;
    stock: integer;
    Borrado: boolean;
  End;
  aProducto = File of recProducto;

var
  RP: recProducto;
  AP: aProducto;

implementation

// Desarrollar un algoritmo que dado un archivo que contendrá los datos de un
// producto (código, detalle, precio, stock) genere una tabla hash donde la
// clave será el código y se guardará como dato la posición física del registro
// para poder realizar accesos directos.
//
// Hacer un ABM para poder para cargar manualmente el archivo. El código es un
// valor de 7 dígitos.

function Ej3.modificarProducto(aCodigo: Integer; aPrecio: Integer; aStock: Integer; aDetalle: string) : boolean;
begin
  if fileExists('.\Productos.dat') then begin
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

function Ej3.mostrarArchivo : string;
var S: string;
begin
  S:='';
  if FileExists('.\Productos.dat') then begin
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

function Ej3.eliminarProducto(aCodigo:longInt) : boolean;
var Borrado:boolean;
begin
  if FileExists('.\Productos.dat') then begin
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

procedure Ej3.cargarProducto(aCodigo,aPrecio:longInt;aStock:integer;aDetalle:string);
begin
  AssignFile(AP,'.\Productos.dat');
  if not FileExists('.\Productos.dat') then begin
    Rewrite(AP);
    CloseFile(AP);
  end;

  Reset(AP);
  RP.Codigo := aCodigo;
  RP.Detalle := aDetalle;
  RP.Precio := aPrecio;
  RP.stock := aStock;
  RP.Borrado := True;
  Write(AP,RP);
  CloseFile(AP);
end;

procedure Ej3.crearArchivo;
begin
  AssignFile(AP, '.\Productos.dat');
  if not FileExists('.\Productos.dat') then begin
    Rewrite(AP);
    CloseFile(AP);
  end;
end;

function Ej3.mostrarTabla: string;
begin
  Result := T.RetornarClaves;
end;

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

procedure Ej3.crearTabla(aTClave: tipoDatosClave; aTHash: tipoFuncionesHash;
  aCantElem, aNPrimo: integer);
begin
  T.Crear(aTClave, aTHash, aCantElem, aNPrimo);
end;

end.
