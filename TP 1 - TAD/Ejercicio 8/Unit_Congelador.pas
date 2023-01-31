unit Unit_Congelador;

interface

uses
  SysUtils,System.TypInfo;

const
  Cant_Sabores = 4;
  Aleatorio = 50; //TESTING
  bocha = 25; //Tamaño de la bocha de helado
  helado_2_bochas = 2;
  helado_3_bochas = 3;


type
  Sabores = (Chocolate, CremaAmericana, Frutilla, Limon);

  Balde = Record
    sabor: Sabores;
    cantidad: integer; //en gramos
  End;

  Cono = Record
    peso: integer;
    sabores: Array of Sabores;
  End;

  Congelador = object
    private
      Baldes: Array[0..Cant_Sabores - 1] of Balde;
    public
      procedure crearBaldes();
      procedure cargarBaldesTesting();
      procedure aumentarCantidadHelado(sabor: String;cantidad: Integer);
      function buscarSabor(sabor: String): integer;
      function mostrarCantidades(): String;
      function alcanzaHelado3(sabor1,sabor2,sabor3: String): Boolean;
      function alcanzaHelado2(sabor1,sabor2: String): Boolean;
      function alcanzaEseSabor(saborPosicion: integer): boolean;
      function servirHelado2Bochas(sabor1,sabor2: String; var servido: boolean): Cono;
      function servirHelado3Bochas(sabor1,sabor2,sabor3: String; var servido: boolean): Cono;
      procedure decrementarCantidadHelado(sabor: String;cantidad: Integer);
      function combinacionesPosibles2Bochas(): String;
      function combinacionesPosibles3Bochas(): String;
  end;

implementation

//Procedimiento que crear el balde sin helados
procedure Congelador.crearBaldes;
var
i: integer;
begin
  for i := 0 to Cant_Sabores - 1 do
  begin
    Baldes[i].sabor := Sabores(i);
    Baldes[i].cantidad := 0;
  end;
end;

//Procedimiento que carga los baldes de forma aleatoria (para testing)
procedure Congelador.cargarBaldesTesting;
var
i: integer;
begin
  Randomize;
  for i := 0 to Cant_Sabores - 1 do
  begin
    Baldes[i].cantidad := Random(Aleatorio);
  end;
end;

//Procedimiento para aumentar la cantidad a un determinado helado
procedure Congelador.aumentarCantidadHelado(sabor: String;cantidad: Integer);
var i: integer;
begin
  i := buscarSabor(sabor);
  Baldes[i].cantidad := Baldes[i].cantidad + cantidad;
end;

//Procedimiento que baja la cantidad de helado, ya que este sera servido en una bocha
procedure Congelador.decrementarCantidadHelado(sabor: String;cantidad: Integer);
var i: integer;
begin
  i := buscarSabor(sabor);
  Baldes[i].cantidad := Baldes[i].cantidad - cantidad;
end;

//Funcion para buscar un sabor especifico dentro del refrigerador y devolver la posicion donde esta
//en el refri
function Congelador.buscarSabor(sabor: String): integer;
var
i: integer;
encontrado: boolean;
begin
  encontrado := false;
  i := 0;
  while (i < cant_Sabores) and (not encontrado) do
  begin
    if GetEnumName(TypeInfo(Sabores),Integer(Baldes[i].sabor)) = sabor then //Si coincide en el refrigerador y es el sabor que busco
    begin
      encontrado := true;
    end
    else
    begin
      inc(i);
    end;
  end;
  buscarSabor := i;
end;

//Funcion que muestra los helados que hay con su cantidad
function Congelador.mostrarCantidades: string;
var
i: integer;
texto,EnumString: String;
begin
  for i := 0 to Cant_Sabores - 1 do
  begin
    EnumString := GetEnumName(TypeInfo(Sabores),Integer(Sabores(i))); //Obtener en string el valor de un enumerado
    texto := texto + 'Sabor: '  + EnumString + ' - Cantidad: '
    + inttostr(Baldes[i].cantidad) + ' gr.' +#13#10;
  end;
  Result := texto;
end;

//Funcion que me dice si ese sabor especifica de helado alcanza para servir una bocha
function congelador.alcanzaEseSabor(saborPosicion: integer): boolean;
var alcanza: boolean;
begin
  alcanza := false;
  if Baldes[saborPosicion].cantidad >= bocha then //Consulto si tengo mas cantidad que la que requiere una bocha de helado
  begin
    alcanza := true;
  end;
  Result := alcanza;
end;

//Funcion para saber si se puede armar un helado de 3 bochas
function congelador.alcanzaHelado3(sabor1,sabor2,sabor3: String): Boolean;
var
alcanza: boolean;
begin
  alcanza := false;
  //Llamo a la funcion alcanza ese sabor para cada sabor y siempre le paso como parametro la posicion donde esta el sabor en el congelador
  if (alcanzaEseSabor(buscarSabor(sabor1)) and alcanzaEseSabor(buscarSabor(sabor2)) and alcanzaEseSabor(buscarSabor(sabor3)))  then
  begin
    alcanza := true;
  end;
  Result := alcanza;
end;

//Funcion para saber si se puede armar un helado de 2 bochas
function congelador.alcanzaHelado2(sabor1, sabor2: String): Boolean;
var
alcanza: boolean;
begin
  alcanza := false;
  //Llamo a la funcion alcanza ese sabor para cada sabor y siempre le paso como parametro la posicion donde esta el sabor en el congelador
  if (alcanzaEseSabor(buscarSabor(sabor1)) and alcanzaEseSabor(buscarSabor(sabor2))) then
  begin
    alcanza := true;
  end;
  Result := alcanza;
end;

//Funcion que sirve un helado de 2 bochas
function congelador.servirHelado2Bochas(sabor1: string; sabor2: string; var servido: Boolean): Cono;
var
  I: Integer;
  C: Cono;
begin
  if alcanzaHelado2(sabor1,sabor2) then //Si alcanza, armo el helado
  begin
    //Cargo los sabores
      SetLength(C.sabores, helado_2_bochas);
      C.sabores[0] := Sabores(buscarSabor(sabor1)); //Cargo los helados en el cono
      C.sabores[1] := Sabores(buscarSabor(sabor2));
      decrementarCantidadHelado(sabor1,bocha); //Bajo la cantidad en el congelador
      decrementarCantidadHelado(sabor2,bocha);
      C.peso := bocha * helado_2_bochas; //Calculo el peso
      servido := true;
  end;
  Result := C; //Devuelvo el cono
end;

//Funcion que sirve un helado de 3 bochas
function congelador.servirHelado3Bochas(sabor1: string; sabor2: string; sabor3: string; var servido: Boolean): Cono;
var
  I: Integer;
  C: Cono;
begin
  if alcanzaHelado3(sabor1,sabor2,sabor3) then //Si alcanza, armo el helado
  begin
    //Cargo los sabores
      SetLength(C.sabores, helado_3_bochas);
      C.sabores[0] := Sabores(buscarSabor(sabor1)); //Cargo los helados en el cono
      C.sabores[1] := Sabores(buscarSabor(sabor2));
      C.sabores[2] := Sabores(buscarSabor(sabor3));
      decrementarCantidadHelado(sabor1,bocha); //Bajo la cantidad en el congelador
      decrementarCantidadHelado(sabor2,bocha);
      decrementarCantidadHelado(sabor3,bocha);
      C.peso := bocha * helado_3_bochas; //Calculo el peso
      servido := true;
  end;
  Result := C; //Devuelvo el cono
end;

//Funcion para saber las combinaciones posibles de helado de 2 bochas
function congelador.combinacionesPosibles3Bochas(): String;
var
combinaciones,s1,s2, s3: String;
  I, j,x, cantCombinaciones: Integer;
begin
  cantCombinaciones := 1;
  combinaciones := '';
  for I := 0 to Cant_Sabores - 1 do //Recorro todas las posibilidad de helado
  begin
    for j := 0 to Cant_Sabores - 1 do
    begin
      for x := 0 to Cant_Sabores - 1 do
      begin
        s1 := GetEnumName(TypeInfo(Sabores),Integer(Sabores(i))); //obtengo los sabores de helado
        s2 := GetEnumName(TypeInfo(Sabores),Integer(Sabores(j)));
        s3 := GetEnumName(TypeInfo(Sabores),Integer(Sabores(x)));
        //Si los tres gustos son distintos y alcanza la cantidad de helados para los tres
        if ((Baldes[i].sabor <> Baldes[j].sabor) and (Baldes[i].sabor <> Baldes[x].sabor) and (Baldes[j].sabor <> Baldes[x].sabor)) and
        (alcanzaEseSabor(buscarSabor(s1)) and alcanzaEseSabor(buscarSabor(s2)) and alcanzaEseSabor(buscarSabor(s3)))  then
          begin
            combinaciones := combinaciones + 'Combinacion ' + cantCombinaciones.ToString + ': ' +
              s1 + ' - ' + s2 + ' - ' + s3 + #13#10;
              inc(cantCombinaciones);
          end;
      end;
    end;
  end;
  result := combinaciones;
end;

//Funcion para saber las combinaciones posibles de helado de 2 bochas
function congelador.combinacionesPosibles2Bochas(): String;
var
combinaciones,s1,s2: String;
  I, j, cantCombinaciones: Integer;
begin
  cantCombinaciones := 1;
  combinaciones := '';
  for I := 0 to Cant_Sabores - 1 do //Recorro todas las posibilidad de helado
  begin
    for j := 0 to Cant_Sabores - 1 do
    begin
      s1 := GetEnumName(TypeInfo(Sabores),Integer(Sabores(i))); //obtengo los sabores de helado
      s2 := GetEnumName(TypeInfo(Sabores),Integer(Sabores(j)));
      //Si los dos gustos son distintos y alcanza la cantidad de helados para los dos
      if (Baldes[i].sabor <> Baldes[j].sabor) and (alcanzaEseSabor(buscarSabor(s1)) and
        alcanzaEseSabor(buscarSabor(s2))) then
        begin
          combinaciones := combinaciones + 'Combinacion ' + cantCombinaciones.ToString + ': ' +
            s1 + ' - ' + s2 + #13#10;
            inc(cantCombinaciones);
        end;
    end;
  end;
  result := combinaciones;
end;

end.
