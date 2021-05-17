unit TesteoCodigo;

interface

implementation

//procedure Vaciar (var Vector: Vector);
//var i: Integer;
//begin
//  for i := 1 to Length(Vector) do
//  begin
//    Vector[i] := 0
//  end;
//
//end;
//
//Function Parsing(aSS: String; aSep: String): Vector_String;
//Var I: Integer;
//    P: Integer;
//    A: Vector_String;
//Begin
//  I := 0;
//  // Controlo que el ultimo caracter sea el separador, sino lo agrega
//  if aSS.Substring(aSS.Length,1) <> aSep then aSS := aSS + aSep;
//
//  // Hacemos el split
//  P := Pos(aSep, aSS);
//  while P > 0 do Begin
//    Inc(I);
//    SetLength(A, I);  // Se redimensiona el array y no se pierden los datos
//    A[I-1] := Copy(aSS, 1, P-1);
//    aSS := Copy(aSS, P+1, Length(aSS));
//    P := Pos(aSep, aSS);
//  End;
//
//  // Retorno el array
//  Parsing := A;
//End;
//
//function Suma_Acumuladora(V: Vector): Integer;
//var Suma, i: Integer;
//begin
//  Suma := 0;
//  for i := 1 to Length(V) do
//  begin
//    Suma := Suma + V[i];
//  end;
//  result := Suma;
//end;
//
//function Parseo(Texto: String): Vector_String;
//begin
//
//end;
//
//function SubconjuntoAUX(Numero,Acumulador: Vector; Cantidad, Posicion, Indice: Integer): String;
//var Suma, i : Integer;
//  Texto: String;
//begin
//  Texto := '';
//  if Numero[Posicion] <> 0 then
//  begin
//    Acumulador[Indice] := Numero[Posicion];
//    Suma := Suma_Acumuladora(Acumulador);
//    if Suma = Cantidad then
//    begin
//      for i := 1 to length(Acumulador) do
//      if Acumulador[i] <> 0 then
//        Texto := Texto + Acumulador[i].ToString + ',';
//    end
//    else if Suma < Cantidad then
//    begin
//      Texto := Texto + SubconjuntoAUX(Numero,Acumulador,Cantidad, Posicion + 1, Indice + 1);
//    end;
//  end;
//  Result := Texto;
//end;
//
//function Subconjunto(Numero: Vector; Cantidad, Posicion: Integer): String;
//var i: Integer;
//  Acum: Vector;
//  Texto: String;
//begin
//  if Numero[Posicion] <> 0 then
//  begin
//    if Numero[Posicion] = Cantidad then
//    begin
//      Texto := Numero[Posicion].ToString;
//    end
//    else if Numero[Posicion] < Cantidad then
//    begin
//      Vaciar(Acum);
//      Acum[1] := Numero[Posicion];
//      for i := Posicion to length(Numero) do
//        Texto := Texto + '-' + SubconjuntoAUX(Numero,Acum,Cantidad,i + 1, 2);
//    end;
//    Result := Texto;
//  end;
//end;
//
//procedure TForm1.CalcularClick(Sender: TObject);
//var Cargador: String;
//  Combinaciones: Vector_String;
//  i: Integer;
//begin
//  Cargador := '';
//  for i := Min to Max do
//  begin
//    Cargador := Cargador + Subconjunto(V,strtoint(Cantidad.Text),i);
//  end;
//  Combinaciones := Parsing(Cargador,'-');
//  memo1.Lines.Add('Los subconjuntos son:');
//  for i := Min to Max do
//  begin
//      if (Cargador[i] <> '') or (Cargador[i] <> ',') then
//      begin
//        memo1.Lines.Add(Cargador[i]);
//      end;
//  end;
//
//end;
//

end.
