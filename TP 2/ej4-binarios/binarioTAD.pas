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
    function Restar(nro: string) : Binario;
    function convertirADecimal(): Extended;
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
var I, Mas_largo : Integer;
    Carry, Suma: String;
begin
  //Determino cual es el numero mas largo y inicializo las variables
  Mas_largo := masLargo(nroBinario, nro);
  Carry := '0';
  Suma := '';
  //Recorro los strings de atras para adelante (por eso el downto)
  for I := Mas_largo + 1 downto 1 do
  begin
    // Si es 1 + 0 ó 0 + 1, entonces:
    if ((nroBinario[I] = '1') and (nro[I] = '0')) or ((nroBinario[I] = '0') and (nro[I] = '1'))  then
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

//Procedimiento interno que emparejar los numeros binarios, agregandole 1
procedure Emparejar_resta(var Mas_Largo, Mas_Corto: String);
Var Cantidad, i : Integer;
begin
  //Determino cual es la diferencia que hay entre el mas largo y el mas corto
  Cantidad := Length(Mas_Largo) - Length(Mas_Corto);
  for i := 1 to Cantidad do
  begin
    //Agrego los 0 necesarios para emparejar ambos numeros
    Mas_corto := '1' + Mas_corto;
  end;
end;

//Conversion para determinar mas grande
function convertirbinario(nro: String): Extended;
//Declaro las variables
var i, Transformar: Integer;
  Valor, Acumulador : Extended;
begin
  Acumulador := 0;
  //Recorro el string de atras para adelante
  for I := Length(nro) downto 1 do
    //Si el string en esa posicion es igual a 1
    if nro[I] = '1' then
    begin
      //Realizo la operacion de 2 elevado a la longitud del vector menos el valor que tiene i en ese momento
      Valor := Power(2,(Length(nro)-i));
      //Acumulo la potencia
      Acumulador := Acumulador + Valor;
    end;
  //Terminado el ciclo, retorno
  convertirbinario := Acumulador;
end;

//Le sumo 1 par completar el complemento
function Suma_1 (nro1, nro2:String): String;
var i: Integer;
  Carry, Suma: String;
begin
  Carry := '0';
  for i := Length(nro1) + 1 downto 1 do
    begin
    // Si es 1 + 0, entonces:
    if (nro1[I] = '1') and (nro2[I] = '0')  then
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
    if (nro1[I] = '0') and (nro2[I] = '1')  then
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
    if (nro1[I] = '0') and (nro2[I] = '0')  then
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
    if (nro1[I] = '1') and (nro2[I] = '1')  then
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

  Result := Suma;
end;

//Funcion que realiza el complemento a 2 de un numero
function Complementoa2(var nro:String): String;
var i: Integer;
  Suma, Suma_mas_1, Retorno: String;
begin
  //Recorro el numero
  for i := 1 to Length(nro) do
  begin
    // Realizo el complemento, si hay 1 pongo 0 y viceversa
    if nro[i] = '1' then
    begin
      nro[i] := '0';
    end
    else if nro[i] = '0' then
    begin
      nro[i] := '1';
    end;
  end;
  //Realizo el +1 para terminar el complemento
  Suma_mas_1 := '1';
  Emparejar(nro,Suma_mas_1);
  Retorno := Suma_1(nro, Suma_mas_1);
  //Retorno el complemento ya hecho
  Complementoa2 := Retorno;
end;

//Funcion que realiza la resta binaria con CA2
function Binario.Restar(nro: string) : Binario;
//Determino las variables
var I, Mas_largo : Integer;
    Carry, Suma, Numero_Con_Complemento, Resultado: String;
    Bandera: Boolean;
begin
  Bandera := False;
  //En el caso de que el numero 2 sea mayor a el 1, quiere decir que voy a tener un numero
  //negativo, utilizo una bandera para el final de ejercicio
  if convertirbinario(nro) > convertirbinario(nroBinario) then
  begin
    Bandera := True;
  end;
  //Realizo el complemento del segundo numero y comienzo la suma
  Numero_Con_Complemento := Complementoa2(nro);
  //En el caso de que sean desparejos, agrego 1 adelante del numero que va a restar
  if Length(Numero_Con_Complemento) < Length(nroBinario)  then
  begin
    Emparejar_resta(nroBinario, Numero_Con_Complemento);
  end;

  Carry := '0';
  Suma := '';
  //Recorro los strings de atras para adelante (por eso el downto)
  for I :=  Length(Numero_Con_Complemento) + 1 downto 1 do
  begin
    // Si es 1 + 0, entonces:
    if (nroBinario[I] = '1') and (Numero_Con_Complemento[I] = '0')  then
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
    if (nroBinario[I] = '0') and (Numero_Con_Complemento[I] = '1')  then
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
    if (nroBinario[I] = '0') and (Numero_Con_Complemento[I] = '0')  then
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
    if (nroBinario[I] = '1') and (Numero_Con_Complemento[I] = '1')  then
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
  Resultado := Suma;

  //Si bandera es verdad, quiere decir que voy a tener un numero negativ
  //por lo tanto realizo el complemento otra vez y le coloco el menos adelante
  if Bandera then
  begin
    Resultado := Complementoa2(Resultado);
    Resultado := '-' + Resultado;
  end;

  //Devuelvo el resultado de la suma
 Restar.nroBinario := Resultado;
end;

//------------------------------------//

//Funcion que realiza la conversion de Binario a Decimal
function Binario.convertirADecimal(): Extended;
//Declaro las variables
var i, Transformar: Integer;
 Valor, Acumulador : Extended;
begin
  Acumulador := 0;
  //Recorro el string de atras para adelante
  for I := Length(nroBinario) downto 1 do
    //Si el string en esa posicion es igual a 1
    if nroBinario[I] = '1' then
    begin
      //Realizo la operacion de 2 elevado a la longitud del vector menos el valor que tiene i en ese momento
      Valor := Power(2,(Length(nroBinario)-i));
      //Acumulo la potencia
      Acumulador := Acumulador + Valor;
    end;
  //Terminado el ciclo, retorno
  convertirADecimal := Acumulador;
end;

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
