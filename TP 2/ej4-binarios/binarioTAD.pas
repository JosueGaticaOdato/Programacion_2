unit binarioTAD;

interface

uses
  SysUtils, Math;

type
  Binario = Object
  private
    nroBinario: String;
  public
    function Crear(nro: string) : boolean;
    function Sumador(nro: string) : Binario;
    function toStr() : string;
    //function restar(nro) : string;
    function convertirADecimal(nro) : string;
    function andLogico(nro: String) : Binario;
    function orLogico(nro: String) : Binario;
    function xorLogico(nro: String) : Binario;
  End;

implementation

function Binario.toStr() : string;
begin
  toStr := nroBinario;
end;

function Binario.Crear(nro: string) : boolean;
var I: Integer;
begin
  nroBinario := nro;
  Result := True;
  for I := 1 to Length(nro) do begin
    if (nro[I] <> '0') and (nro[I] <> '1') then begin
      Result := False;
    end;
  end;
end;

//Procedimiento interno que empareja los numeros, agregandole 0, para realizar la suma correspondiente
procedure Emparejar(var Mas_Largo, Mas_Corto: String);
Var Cantidad, i : Integer;
begin
  //Determino cual es la diferencia que hay entre el mas largo y el mas corto
  Cantidad := Length(Mas_Largo) - Length(Mas_Corto);
  for i := 1 to Cantidad do
  begin
    //Agrego los 0 necesarios para emparejar ambos numeros
    Mas_corto := '0' + Mas_corto;
  end;
end;

//Funcion que determina cual es el numero mas largo
function masLargo(var nro1, nro2: string) : Integer;
var Longitud : Integer;
begin
  if Length(nro1) > Length(nro2) then begin
    //Si uno es mas largo que otro, se determina el valor
    //mas largo y se empareja el numero mas corto
    Longitud := Length(nro1);
    Emparejar(nro1,nro2);
  end
  else if Length(nro1) < Length(nro2) then begin
    //Si uno es mas largo que otro, se determina el valor
    //mas largo y se empareja el numero mas corto
    Longitud := Length(nro2);
    Emparejar(nro2,nro1);
  end
  else
  begin
    //En el caso de que no halla diferencia y sean de igual longitud
    //Elijo cualquiera de los dos numeros y no realizo el emparejamiento
    Longitud := Length(nro1);
  end;
  masLargo := Longitud;
end;

//Funcion que realiza la suma binaria
function Binario.Sumador(nro: string) : Binario;
//Determino las variables
var I, Mas_largo, Acumulador : Integer;
    Carry, Suma: String;
begin
  //Determino cual es el numero mas largo y inicializo las variables
  Mas_largo := masLargo(nroBinario, nro);
  Carry := '0';
  Suma := '';
  //Recorro los strings de atras para adelante (por eso el downto)
  for I := Mas_largo + 1 downto 1 do
  begin
    // Si es 1 + 0, entonces:
    if (nroBinario[I] = '1') and (nro[I] = '0')  then
    begin
      //Si el carry es 1:
      if Carry = '1' then
        begin
        //Entonces voy a tener como valor de suma 0, y el carry le sumo 1
        Suma := '0' + Suma;
        Carry := '1';
        end
      else
      begin
      //Sino es 1 el carry, pongo el 1 a la suma (1+0 en binario es 1)
        Suma := '1' + Suma;
      end;
    end;
    //Si 0 + 1
    if (nroBinario[I] = '0') and (nro[I] = '1')  then
    begin
      //Si el carry es 1 entonces
      if Carry = '1' then
        begin
        //A la suma le coloco 0 y el carry sigue siendo 1
        Suma := '0' + Suma;
        Carry := '1';
        end
      else
      begin
        //Si el carry no es 1, realizo la suma (0+1 en binario es 1)
        Suma := '1' + Suma;
      end;
    end;
    // Si 0 + 0
    if (nroBinario[I] = '0') and (nro[I] = '0')  then
    begin
      //Si el carry es 1
      if Carry = '1' then
        begin
        //Gasto el carry en la suma y este se trasnforma en 0
        Suma := '1' + Suma;
        Carry := '0';
        end
      else
      begin
        //Sino, realizo la suma binaria comun (0+0 en binario es 0)
        Suma := '0' + Suma;
      end;
    end;
    // Si 1+1
    if (nroBinario[I] = '1') and (nro[I] = '1')  then
    begin
      //Si el carry es 1
      if Carry = '1' then
        begin
        //La suma entre ellos da 3(11 en binario), entonces pongo 1 en la suma y le coloco 1 al carry
        Suma := '1' + Suma;
        Carry := '1';
        end
      else
      begin
        //Sino, realizo la suma que es 2(1+1:10), el 0 se queda en la suma y el carry se transforma en 1
        Suma :='0' + Suma;
        Carry := '1';
      end;
    end;

  end;

  //En el caso de que en el carry haya sobrado algo, lo pongo adelante en la suma
  if Carry = '1' then
  begin
    Suma := '1' + Suma;
  end;

  //Devuelvo el resultado de la suma
 Sumador.nroBinario := Suma;
end;

//------------------------------------//
function Binario.convertirADecimal(nro) : string;


//------------------------------------//

//Procedimiento que realiza el emparejamiento de bits para las operaciones logicas
procedure Emparejar_logico(var Mas_Largo, Mas_Corto: String);
Var Cantidad, i : Integer;
begin
  //Determino cual es la diferencia que hay entre el mas largo y el mas corto
  Cantidad := Length(Mas_Largo) - Length(Mas_Corto);
  for i := 1 to Cantidad do
  begin
    //Agrego giones necesarios para emparejar ambos numeros
    Mas_corto := '-' + Mas_corto;
  end;
end;

//Funcion que determina cual es el numero mas largo (PARA OPERACIONES LOGICAS)
function masLargo_Logico(var nro1, nro2: string) : Integer;
var Longitud : Integer;
begin
  if Length(nro1) > Length(nro2) then begin
    //Si uno es mas largo que otro, se determina el valor
    //mas largo y se empareja el numero mas corto
    Longitud := Length(nro1);
    Emparejar_logico(nro1,nro2);
  end
  else if Length(nro1) < Length(nro2) then begin
    //Si uno es mas largo que otro, se determina el valor
    //mas largo y se empareja el numero mas corto
    Longitud := Length(nro2);
    Emparejar_logico(nro2,nro1);
  end
  else
  begin
    //En el caso de que no halla diferencia y sean de igual longitud
    //Elijo cualquiera de los dos numeros y no realizo el emparejamiento
    Longitud := Length(nro1);
  end;
  masLargo_Logico := Longitud;
end;

//Funcion que realiza la operacion AND logico
function Binario.andLogico(nro: String) : Binario;
//Determino las variables
var I, Mas_largo : Integer;
    Resultado: String;
begin
  //Determino cual es el numero mas largo y inicializo las variables
  Mas_largo := masLargo_Logico(nroBinario, nro);
  I := (Mas_largo);
  //Mientras no halla guiones y todavia halla bits, continuo haciendo el and
  while (I >= 1) and (nroBinario[I] <> '-') and (nro[I] <> '-') do
    begin
      begin
        //Si tengo 1-1
        if (nroBinario[I] = '1') and (nro[I] = '1')  then
        begin
        //Entonces realizo el AND ( 1-1 : 1) y lo coloco como resultado
        Resultado := '1' + Resultado;
        end
        else
        begin
        //Cualquier otro resultado, el AND devuelve 0
        //Por lo tanto, coloco 0 como resultado y concateno
        Resultado := '0' + Resultado;
        end;
      end;
    //Resto la variable interactiva
    I := I - 1;
    end;
//Devuelvo el resultado a el elemento del objeto
andLogico.nroBinario := Resultado;
end;

//Funcion que realiza la operacion OR logico
function Binario.orLogico(nro: String) : Binario;
//Determino las variables
var I, Mas_largo : Integer;
    Resultado: String;
begin
  //Determino cual es el numero mas largo y inicializo las variables
  Mas_largo := masLargo_Logico(nroBinario, nro);
  I := (Mas_largo);
  //Mientras no halla guiones y todavia halla bits, continuo haciendo el or
  while (I >= 1) and (nroBinario[I] <> '-') and (nro[I] <> '-') do
    begin
      begin
        //Si tengo 0-0
        if (nroBinario[I] = '0') and (nro[I] = '0')  then
        begin
        //Entonces realizo el OR ( 0-0 : 0) y lo coloco como resultado
        Resultado := '0' + Resultado;
        end
        else
        begin
        //Cualquier otro resultado, el OR devuelve 1
        //Por lo tanto, coloco 1 como resultado y concateno
        Resultado := '1' + Resultado;
        end;
      end;
    //Resto la variable interactiva
    I := I - 1;
    end;
//Devuelvo el resultado a el elemento del objeto
orLogico.nroBinario := Resultado;
end;

//Funcion que realiza la operacion XOR logico
function Binario.xorLogico(nro: String) : Binario;
//Determino las variables
var I, Mas_largo : Integer;
    Resultado: String;
begin
  //Determino cual es el numero mas largo y inicializo las variables
  Mas_largo := masLargo_Logico(nroBinario, nro);
  I := (Mas_largo);
  //Mientras no halla guiones y todavia halla bits, continuo haciendo el xor
  while (I >= 1) and (nroBinario[I] <> '-') and (nro[I] <> '-') do
    begin
      begin
        //Si tengo 1-0 O 0-1
        if ((nroBinario[I] = '0') and (nro[I] = '1')) or ((nroBinario[I] = '1') and (nro[I] = '0'))  then
        begin
        //Entonces realizo el XOR ( 1-0 o 0-1 : 1) y lo coloco como resultado
        Resultado := '1' + Resultado;
        end
        else
        begin
        //Cualquier otro resultado, el XOR devuelve 0
        //Por lo tanto, coloco 1 como resultado y concateno
        Resultado := '0' + Resultado;
        end;
      end;
    //Resto la variable interactiva
    I := I - 1;
    end;
//Devuelvo el resultado a el elemento del objeto
xorLogico.nroBinario := Resultado;
end;

end.
