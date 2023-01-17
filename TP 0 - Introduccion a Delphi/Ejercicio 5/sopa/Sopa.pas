unit Sopa;

interface

uses
  sysutils;

const
  tamañoMaximoFila = 9;
  tamañoMaximoColumna = 10;
  tamañoMaximoPalabraABuscar = 9;
  tamañoMinimoArreglo = 1;
  posicionPrimeraLetra = 1;

type
  matrizSopa = array [tamañoMinimoArreglo..tamañoMaximoFila,
    tamañoMinimoArreglo..tamañoMaximoColumna] of Char;
  arrayPalabras = array [tamañoMinimoArreglo..tamañoMaximoPalabraABuscar] of String;

  Posicion = Record
    fila: integer;
    columna: integer;
  End;

  RecordPalabraEncontrada = Record
    Palabra: String;
    Posiciones: array of Posicion;
  End;

  RecordResultado = array of RecordPalabraEncontrada;

  function resolverSopa(Sopa: matrizSopa; palabras: arrayPalabras)
  : RecordResultado;
  function mostrarResultado(Resultado: RecordResultado): String;

implementation

//Funcion que busca la palabra en forma horizontal
function buscarHorizontal(Sopa: matrizSopa; palabra: String;
  fila,columna,posicionPalabra: integer;var Resultado: RecordResultado): boolean;
var
   buscador: boolean;
   i: integer;
   palabraHallada: RecordPalabraEncontrada;
begin
  //Defino el tamaño de las posiciones donde estaran las letras de la palabra
  SetLength(palabraHallada.Posiciones,length(palabra));
  buscador := true;
  i := 0;
  while (buscador) and (i < length(palabra)) do
  begin
    //Si la letra de la palabra es distinta a la que esta en
    //la sopa, corto el ciclo y devuelvo falso
    if palabra[i+1] <> Sopa[fila][columna] then
    begin
      buscador := false;
    end
    else
    begin
      //Sigo, quiere decir que las letras son iguales, por eso
      //guardo las posiciones
      palabraHallada.Posiciones[i].fila := fila;
      palabraHallada.Posiciones[i].columna := columna;
      inc(i);
      inc(columna); //Como es vertical, lo que aumento es la columna
    end;
  end;
  if buscador then //Si esta la palabra en la sopa
  begin
    palabraHallada.Palabra := palabra;
    Resultado[posicionPalabra - 1] := palabraHallada; //Cargo la palabra en los resultados
  end;
  Result:= buscador;
end;


//Funcion que busca la palabra en forma vertical
function buscarVertical(Sopa: matrizSopa; palabra: String;
  fila,columna,posicionPalabra: integer;var Resultado: RecordResultado):boolean;
var
   buscador: boolean;
   i: integer;
   palabraHallada: RecordPalabraEncontrada;
begin
  //Defino el tamaño de las posiciones donde estaran las letras de la palabra
  SetLength(palabraHallada.Posiciones,length(palabra));
  buscador := true;
  i := 0;
  while (buscador) and (i < length(palabra)) do
  begin
    //Si la letra de la palabra es distinta a la que esta en
    //la sopa, corto el ciclo y devuelvo falso
    if palabra[i+1] <> Sopa[fila][columna] then
    begin
      buscador := false;
    end
    else
    begin
      //Sigo, quiere decir que las letras son iguales, por eso
      //guardo las posiciones
      palabraHallada.Posiciones[i].fila := fila;
      palabraHallada.Posiciones[i].columna := columna;
      inc(i);
      inc(fila); //Como es horizontal, lo que aumento es la fila
    end;
  end;
  if buscador then //Si esta la palabra en la sopa
  begin
    palabraHallada.Palabra := palabra;
    Resultado[posicionPalabra - 1] := palabraHallada; //Cargo la palabra en los resultados
  end;
  Result:= buscador;
end;

//Funcion principal que resuelve la sopa de letras
function resolverSopa(Sopa: matrizSopa; palabras: arrayPalabras)
  : RecordResultado;
var
  fila,columna,i: Integer;
  primerLetraAparece: boolean;
  palabraaBuscar: String;
  Resultado: RecordResultado;
begin
  // acá tienen que resolver el problema
  SetLength(Resultado,length(palabras)); //Defino el tamaño de las palabras resultado
  for I := 1 to length(palabras) do //Recorrer todas las palabras
  begin
    palabraaBuscar := palabras[I]; //Guardo en una variable la palabra a buscar
    //Ahorra recorro en la sopa, letra por letra
    primerLetraAparece := false;
    fila := 1;
    while (not primerLetraAparece) and (fila <= tamañoMaximoFila)  do
    begin //Busco por fila
      columna := 1;
      while (not primerLetraAparece) and (columna <= tamañoMaximoColumna)  do
      begin //Busco por columna
        //Si coincide la primera letra de la palabra con la que esta en la sopa
        if Sopa[fila][columna] = palabraaBuscar[posicionPrimeraLetra] then //
        begin
          //Tengo que utilizar dos funciones, para buscar de forma horizontal
          //y vertical
          //Ambas funciones devuelve el booleano, indicando si la encontre o no
          primerLetraAparece := buscarVertical(Sopa,palabraaBuscar,
            fila, columna,i,Resultado) or buscarHorizontal(Sopa,palabraaBuscar,
            fila, columna,i,Resultado);
        end;
        inc(columna);
      end;
      inc(fila);
    end;
  end;
  Result := Resultado;
end;

//Funcion que muestra el resultado de la sopa de letras
function mostrarResultado(Resultado: RecordResultado): String;
var
i,j: integer;
s: String;
begin
  for i := 0 to length(Resultado) - 1 do
  begin
    s := s + #13#10+  'Palabra: ' + Resultado[i].Palabra + #13#10 + 'Posiciones: ';
    for j := 0 to length(Resultado[i].Posiciones) - 1 do
    begin
      s := s + '[' + inttostr(Resultado[i].Posiciones[j].fila) + '-'
       + inttostr(Resultado[i].Posiciones[j].columna) + '] ';
    end;
  end;
  Result := s;
end;

end.
