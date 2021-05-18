unit Ejercicio11Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

Const
  Poblacion_Inicial = 8000; //Ejemplo

type
  TForm1 = class(TForm)
    Label2: TLabel;
    CN: TEdit;
    CNmenos: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Vector = Array of String;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//Funcion que realiza el parsing o split
Function Parsing(aSS: String; aSep: String): Vector;
Var I: Integer;
    P: Integer;
    V: Vector;
Begin
  I := 0;
  // Controlo que el ultimo caracter sea el separador, sino lo agrega
  if aSS.Substring(aSS.Length,1) <> aSep then aSS := aSS + aSep;

  // Hacemos el split
  P := Pos(aSep, aSS);
  while P > 0 do Begin
    Inc(I);
    SetLength(V, I);  // Se redimensiona el array y no se pierden los datos
    V[I-1] := Copy(aSS, 1, P-1);
    aSS := Copy(aSS, P+1, Length(aSS));
    P := Pos(aSep, aSS);
  End;

  // Retorno el array
  Parsing := V;
End;

function Potencia (Numero: Double; Exponente: Integer): Double;
begin
  if Exponente = 0 then
  begin
    result := 1;
  end
  else
  begin
    Result := Numero * Potencia(Numero, Exponente - 1);
  end;
end;

function Producto(Numero1: Integer; Numero2: Double): Double;
begin
  //Caso base en caso de restar con numero positivo y negativo
  if Numero2 = 1 then
  begin
    Result := Numero1;
  end
  else if (Numero2 = -1) then
  begin
    Result := - Numero1;
  end
  else
  //Si no se cumple el caso base, uso el condicional acorde al valor del divisor
  begin
    //Si es positivo sumo, y resto al divisor como parametro
    if Numero2 > 0 then
    begin
      Result := Numero1 + Producto(Numero1,Numero2 - 1);
    end
    //Si es negativo sumo pero numero 1 sera negativo, y sumo al divisor
    else if Numero2 < 0 then
    begin
      Result := - Numero1 + Producto(Numero1,Numero2 + 1);
    end
  end;
end;

function Division(Numero1, Numero2: Integer): Double;
begin
  //Caso base: en caso de que la resta sea menor a cero, el resultado de la division es 0
  if Numero1 - Numero2 < 0 then
  begin
    Result := 0;
  end
  else
  begin
    //El resultado sera 1 (porque quiere decir que se puede dividir)
    //y hago el llamado teniendo como parametro el N1-N2 y el divisor que no cambia
    Result := 1 + Division(Numero1 - Numero2, Numero2)
  end;
end;

function Formula (Dia, Poblacion_Inicial, CN, CNmenos: Integer): Double;
var Calculo: Double;
begin
  Calculo := Division(CN,CNmenos);
  Calculo := Potencia(Calculo,Dia);
  Calculo := Producto(Poblacion_Inicial,Calculo);
  result := Calculo;
end;

function Duplicacion_de_casos(Dia, Poblacion_Inicial, CN, CNmenos: Integer; Dia_Base: Double): String;
var Day: Double;
begin
  Day := Formula(Dia, Poblacion_Inicial, CN, CNmenos);
  if Dia_Base < Day then
  begin
    Result := Day.ToString;
  end
  else
  begin
    Randomize;
    Cn := Cn + Random(100);
    CNmenos := CNmenos + Random(100);
    Result := Duplicacion_de_casos(Dia + 1, Poblacion_Inicial, CN, CNmenos,Dia_Base) + ',';
  end;


end;

function Duplicacion_de_casosAUX(Dia, Poblacion_Inicial, CN, CNmenos: Integer): Vector;
var Dia_Base: Double;
begin
  Dia_Base := Potencia(Formula(Dia, Poblacion_Inicial, CN, CNmenos),2);
  Result := Parsing(Duplicacion_de_casos(Dia + 1, Poblacion_Inicial, CN, CNmenos, Dia_Base),',');
end;



procedure TForm1.Button1Click(Sender: TObject);
var Contagios: Vector;
  i: Integer;
begin
  memo1.Clear;
  //Hago el llamado y guardo en "Numeros" el resultado
  Contagios := Duplicacion_de_casosAUX(1,Poblacion_Inicial,strtoint(CN.Text),strtoint(CNmenos.Text));
  //Muestro el vector con el contenido
  memo1.Lines.Add('El resultado es:');
  for i := 0 to Length(Contagios) - 1 do
  begin
    memo1.Lines.Add(Contagios[i]);
  end;
end;

end.
