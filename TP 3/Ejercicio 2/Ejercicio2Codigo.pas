unit Ejercicio2Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Numero1: TEdit;
    btnMCD: TButton;
    Numero2: TEdit;
    MCDEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    procedure btnMCDClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



//Ejercicio 2 2021: Maximo comun divisor entre dos numeros
function MaximoComunDivisor(Numero1,Numero2: Integer): Integer;
begin
//Si los numeros son iguales tengo el MCD, ese es mi caso base
  if Numero1 = Numero2 then begin
   Result := Numero1;
  end
  else if Numero1 > Numero2 then begin
  //Sino, al mayor le resto el menor y vuelvo a consultar el MCD
    Result := MaximoComunDivisor(Numero1 - Numero2,Numero2);
  end
  else begin
  //O viceversa, dependiendo de quien es el mayor
    Result := MaximoComunDivisor(Numero1,Numero2 - Numero1);
  end;
end;

(*
Dados dos números enteros m y n, construir una función
recursiva que devuelva el producto de ambos,
calculando el mismo como sumas sucesivas.
Esto es: m*n=m+m+…+m, n veces.
*)

//Ejercicio 2 2022: Producto recursiva
function Producto(Numero1,Numero2: Integer): Integer;
begin
  //Caso base, que Numero 2 sea 1
  if (Numero2 = 1) then
  begin
    Result := Numero1;
  end
  else
  begin
  //Caso recursivo, sumo el numero y le resto uno a la potencia
    Result := Numero1 + Producto(Numero1, Numero2 - 1);
  end;
end;

procedure TForm1.btnMCDClick(Sender: TObject);
var
  N1, N2: Integer;
begin
  N1 := strtoint(Numero1.Text);
  N2 := strtoint(Numero2.Text);
  MCDEdit.Text := Inttostr(MaximoComunDivisor(N1, N2));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  N1, N2: Integer;
begin
  N1 := strtoint(Numero1.Text);
  N2 := strtoint(Numero2.Text);
  MCDEdit.Text := Inttostr(Producto(N1, N2));
end;

end.
