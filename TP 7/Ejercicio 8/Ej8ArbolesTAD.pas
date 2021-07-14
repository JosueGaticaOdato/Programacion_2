unit Ej8ArbolesTAD;

interface

uses
  ArbolesBinariosBusqueda,Tipos, SysUtils;

const
  Esp = Char(32);

type
  Datos = Record
    CUIT:longInt;
    razonSocial: string[15];
    Domicilio:string[30];
    Telefono:longInt;
    Celular:longInt;
  End;
  aDatos = file of Datos;

  Ej8 = Object
  private
    A:ArbolBB;
  public
    procedure crearArchivo(aFile:string);
    function mostrarArchivo(aFile:string) : string;
    procedure cargarArchivo(aFile: string; aCuit: Integer; aRazon: string; aDomicilio: string; aTel: Integer; aCel: Integer);
  End;

implementation

//Construir un ABM para manejar un archivo cuyo registro contiene los
//siguientes campos: CUIT, RAZÓN SOCIAL, DOMICILIO, TELÉFONO y CELULAR.
//
//
//El archivo se maneja a través de un índice (utilizando un árbol binario de
// búsqueda), considerando como clave el campo CUIT (el CUIT es único, no
//  existen duplicados). Se deben mantener sincronizado el índice y el
//  archivo, cada vez que se agrega un registro en el archivo se debe
//   actualizar el índice en memoria.

procedure Ej8.cargarArchivo(aFile: string; aCuit: Integer; aRazon: string; aDomicilio: string; aTel: Integer; aCel: Integer);
var RD: Datos;
    AD: aDatos;
begin
  AssignFile(AD,aFile);
  if not FileExists(aFile) then begin
    Rewrite(AD);
    CloseFile(AD);
  end;
  Reset(AD);
  RD.CUIT := aCuit;
  RD.razonSocial := aRazon;
  RD.Domicilio := aDomicilio;
  RD.Telefono := aTel;
  RD.Celular := aCel;
  Write(AD,RD);
  CloseFile(AD);
end;

function Ej8.mostrarArchivo(aFile:string) : string;
var S: string;
    RD: Datos;
    AD: aDatos;
begin
  S:='';
  if FileExists(aFile) then begin
    AssignFile(AD,aFile);
    Reset(AD);
    while not EOF(AD) do begin
      Read(AD,RD);
      S := S + RD.CUIT.ToString + Esp + RD.razonSocial + Esp +
      RD.Domicilio + Esp + RD.Telefono.ToString + Esp +
      RD.Celular.ToString + cCRLF;
    end;
    CloseFile(AD);
    Result := S;
  end;
end;


procedure Ej8.crearArchivo(aFile:string);
var RD: Datos;
    AD: aDatos;
begin
  AssignFile(AD, aFile);
  if not FileExists(aFile) then begin
    Rewrite(AD);
    CloseFile(AD);
  end;
end;


end.
