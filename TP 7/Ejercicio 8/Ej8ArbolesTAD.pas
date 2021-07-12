+unit Ej8ArbolesTAD;

interface

uses
  ArbolesBinariosBusqueda,Tipos, SysUtils;

type
  Datos = Record
    CUIT:longInt;
    razonSocial: string;
    Domicilio:string;
    Telefono:longInt;
    Celular:longInt;
  End;
  Ej8 = Object
  private
    A:Arbol;
  public

  End;

var
  RD : Datos;
  AD : File of Datos;

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



end.
