unit TADEjercicio11;

interface

uses
  SysUtils,
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  Ejercicio11 = Object
    private
      //Atributo
      P: Pila;
    public
      //Comportamiento
      procedure Definir_Tamaño_Pila(Tamaño: Integer);
      Function Mostrar_Pila(): String;
      procedure Apilar_Pila_Origen(Auxiliar: Pila);
      function MaximoComunDivisor(Numero1,Numero2: Integer): Integer;
      function MCDComun(Numero1,Numero2: Integer): Integer;
  End;

implementation

//Procedimiento que crea la pila
procedure Ejercicio11.Definir_Tamaño_Pila(Tamaño: Integer);
begin
  P.Crear(Cadena,Tamaño);
end;

//Funcion que muestra la pila
function Ejercicio11.Mostrar_Pila;
begin
  Mostrar_Pila := P.RetornarClaves;
end;

//Procedimiento que recupera el contenido de la pila origen
procedure Ejercicio11.Apilar_Pila_Origen(Auxiliar: Pila);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesApilar;
    P.Apilar(X);
  end;
end;

//Funcion recursiva que me devuelve el maximo comun divisor entre dos numeros (Entre siempre tiene al numero 1 como el mayor)
function Ejercicio11.MaximoComunDivisor(Numero1,Numero2: Integer): Integer;
var X: TipoElemento;
  Resta: Integer;
begin
  //Guardo el contenido en un tipo elemento y lo cargo en la pila
  X.Clave := 'MCD('+ Numero1.ToString + ',' + Numero2.ToString + ')';
  P.Apilar(X);
  //Si los numeros son iguales tengo el MCD
  if Numero1 = Numero2 then
  begin
    Result := Numero1;
  end
  else
  begin
  //Sino, al mayor le resto el menor y vuelvo a consultar el MCD
    if Numero1 > Numero2 then
    begin
      //Realizo la resta y pongo adelante el mayor
      Resta := Numero1 - Numero2;
      if Resta > Numero2 then
      begin
        Result := MaximoComunDivisor(Resta,Numero2);
      end
      else
      begin
        Result := MaximoComunDivisor(Numero2,Resta);
      end;
    end
    else
    begin
    //Lo mismo, solamente que el Numero2 es mayor que el numero 1
      Resta := Numero2 - Numero1;
      //Realizo la resta y pongo adelante el mayor
      if Resta > Numero1 then
      begin
        Result := MaximoComunDivisor(Resta,Numero1);
      end
      else
      begin
        Result := MaximoComunDivisor(Numero1,Resta);
      end;
    end;
  end;
end;

//Funcion recursiva que me devuelve el MCD entre dos numeros (en este caso, no importa el orden del mayor)
function Ejercicio11.MCDComun(Numero1: Integer; Numero2: Integer): Integer;
var X: TipoElemento;
begin
//Si los numeros son iguales tengo el MCD
  X.Clave := 'MCD('+ Numero1.ToString + ',' + Numero2.ToString + ')';
  P.Apilar(X);
 if Numero1 = Numero2 then
 begin
    Result := Numero1;
 end
 else
 begin
 //Sino, al mayor le resto el menor y vuelvo a consultar el MCD
  if Numero1 > Numero2 then
  begin
    Result := MaximoComunDivisor(Numero1 - Numero2,Numero2);
  end
  else if Numero1 < Numero2 then
  begin
    Result := MaximoComunDivisor(Numero1,Numero2 - Numero1);
  end;
 end;
end;

end.
