unit Ejercicio11Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

const
 Habitantes = 8000;
 Min = 1;
 Max = 100;

type

Poblacion = Record
  Poblacion_Inicial : Integer;
  Dia : Integer;
  Cant_Contagiados : Integer;
  end;

  Vector_Poblacion = Array [Min..Max] of Poblacion;

  TForm1 = class(TForm)
    Label2: TLabel;
    CN: TEdit;
    Memo1: TMemo;
    Label3: TLabel;
    Dia: TEdit;
    Cargar: TButton;
    Button1: TButton;
    procedure CargarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    P: Vector_Poblacion;
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

function Producto(Numero1: Double; Numero2: Double): Double;
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

function Duplicacion_de_casos(Poblacion: Vector_Poblacion; Posicion: Integer): String;
var Casos,Doble_poblacion: Double;
  Texto: String;
begin
  Texto := '';
  Casos := Formula(Poblacion[Posicion + 1].Dia,Poblacion[Posicion + 1].Poblacion_Inicial,Poblacion[Posicion + 1].Cant_Contagiados,Poblacion[Posicion].Cant_Contagiados);
  Doble_poblacion := Producto(Habitantes,2);
  if Doble_Poblacion < Casos then
  begin
    Texto := Casos.ToString;
    Result:= Texto;
  end
  else
  begin
    Texto := Texto + '-' + Duplicacion_de_casos(Poblacion,Posicion + 1);
    Result:= Texto;
  end;

end;

function No_hay_nada(Poblacion: Vector_Poblacion): Integer;
var i: Integer;
  Listo: Boolean;
begin
 i := 1;
 Listo := True;
 while Listo do
 begin
  if Poblacion[i].Poblacion_Inicial = 0 then
  begin
      Listo := False;
  end
  else
  begin
    i := i + 1;
  end;
 end;
 Result := i;

end;

procedure TForm1.Button1Click(Sender: TObject);
var Contenido: String;
begin
  Contenido := Duplicacion_de_casos(P,1);
end;

procedure TForm1.CargarClick(Sender: TObject);
var Posicion: Integer;
begin
  Posicion := No_hay_nada(P);
  P[Posicion].Poblacion_Inicial := Habitantes;
  P[Posicion].Dia := strtoint(Dia.Text);
  P[Posicion].Cant_Contagiados := strtoint(CN.Text);
  memo1.Lines.Add('Carga exitosa');
end;

end.
