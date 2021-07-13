unit TADEjercicio5;

interface

uses
  System.SysUtils,
  Tipos,
  ListCursor;
  //ListPointer;
  //ListArray;

const
  Tamaño = 5;

type
  Registro = Record
    Mesa : Integer;
    Distrito : Integer;
    Provincia : Integer;
    Cantidad_Votos : Integer;
  End;

  Puntero_Array = ^Arreglo;

  Arreglo = Array of Registro;

  Registro_De_Votos = Object
    private
      L: Lista;
      Lista_de_Votos: Lista;
    public
      //procedure Crear();
      function Buscar_Candidato(Nombre: String):PosicionLista;
      procedure Cargar_Voto(Mesa,Distrito,Provincia,Cant_Votos: Integer; Candidato: String);
      function Generar_Lista_Votos(): String;
  End;


implementation

//procedure Registro_De_Votos.Crear();
//var i: Integer;
//  X, Y: TipoElemento;
//  Pointer : ^Lista;
//  //Arreglo: Array of Registro;
//begin
//  L.Crear(Cadena, Tamaño);
//  I := L.Comienzo;
//  while I <= L.SizeList do
//  begin
//    New(Pointer);
//    X := L.Recuperar(I);
//    //Y.Clave := Arreglo;
//    //Pointer.Agregar(Y);
//    //X.Valor2 := Puntero_Array;
//
//  end;
//end;

function Registro_De_Votos.Buscar_Candidato(Nombre: string): PosicionLista;
var I: PosicionLista;
  X: TipoElemento;
  Encontrado: Boolean;
begin
  I := L.Comienzo;
  Encontrado := False;
  while (I <= L.CantidadElementos) and (not Encontrado) do
  begin
    X := L.Recuperar(I);
    if (X.Clave = Nombre) or (X.Clave = '') then
    begin
      Encontrado := True;
      X.Clave := Nombre;
      L.Actualizar(X,I);
    end
    else
    begin
      I := L.Siguiente(I);
    end;
  end;
  Result := I;
end;

procedure Registro_De_Votos.Cargar_Voto(Mesa: Integer; Distrito: Integer; Provincia: Integer; Cant_Votos: Integer; Candidato: string);
var Posicion: PosicionLista;
  X,Y: TipoElemento;
  Lista_Mesas: ^Lista;
  Contenido: ^Registro;
  Punt_Contenido: ^Registro;
  I: Integer;
  Cargado: Boolean;
begin
  I := Random(Tamaño);
  Contenido^.Mesa := Mesa;
  Contenido^.Distrito := Distrito;
  Contenido^.Provincia := Provincia;
  Contenido^.Cantidad_Votos := Cant_Votos;
  Y.Valor2 := Contenido;
  Posicion := Buscar_Candidato(Candidato);
  if Posicion <> Nulo then
  begin
    X := L.Recuperar(Posicion);
    Lista_Mesas := X.Valor2;
    Lista_Mesas.Agregar(Y);
    X.Valor2 := Lista_Mesas;
  end;

end;

function Registro_De_Votos.Generar_Lista_Votos(): String;
var Posicion: PosicionLista;
  X,Y: TipoElemento;
  Lista_Mesas: ^Lista;
  Contenido: ^Registro;
  I: Integer;
begin

end;

end.
