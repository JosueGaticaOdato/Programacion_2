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
      P: Pila;
    public
      procedure Definir_Tamaño_Pila(Tamaño: Integer);
      Function Mostrar_Pila(): String;
      procedure Apilar_Pila_Origen(Auxiliar: Pila);
      function MaximoComunDivisor(Numero1,Numero2: Integer): Integer;
  End;

implementation

procedure Ejercicio11.Definir_Tamaño_Pila(Tamaño: Integer);
begin
  P.Crear(Cadena,Tamaño);
end;

function Ejercicio11.Mostrar_Pila;
begin
  Mostrar_Pila := P.RetornarClaves;
end;

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

function Ejercicio11.MaximoComunDivisor(Numero1,Numero2: Integer): Integer;
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
