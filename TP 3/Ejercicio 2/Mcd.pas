unit Mcd;

interface

implementation

function MaximoComunDivisor(Numero1,Numero2: Integer): Integer;
begin
//Si los numeros son iguales tengo el MCD
  if Numero1 = Numero2 then begin
   Result := Numero1;
  end
  else if Numero1 > Numero2 then begin
  //Sino, al mayor le resto el menor y vuelvo a consultar el MCD
    Result := MaximoComunDivisor(Numero1 - Numero2,Numero2);
  end
  else begin
    Result := MaximoComunDivisor(Numero1,Numero2 - Numero1);
  end;
end;


end.
