unit Ejercicio6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Math;

const //NUMERO DE LAS BASES
  binario = 2;
  octal = 8;
  hexa = 16;
  decimal = 10;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Edit2: TEdit;
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

{
Ejercicio 6

Generar un programa que permita ingresar un número
en cualquiera de los siguientes sistemas numéricos:
binario, octal, decimal y hexadecimal, y lo convierta
a cualquiera de los otros tres sistemas numéricos.

}

//Conversor numero Hexa
function HexaANumero(numero: String): String;
var valor: String;
begin
    valor := numero;
    //Tuve que hacerlo asi porque el case no me dejaba tomar como variable un String
    if numero = 'A' then valor := '10'
    else if numero = 'B' then valor := '11'
    else if numero = 'C' then valor := '12'
    else if numero = 'D' then valor := '13'
    else if numero = 'E' then valor := '14'
    else if numero = 'F' then valor := '15';
    Result := valor;
end;

//Funcion que transformar un numero a Hexa
function NumeroAHexa(numero: integer): String;
var valor: String;
begin
    valor := inttostr(numero);
    case (strtoint(valor)) of
    10: valor := 'A';
    11: valor := 'B';
    12: valor := 'C';
    13: valor := 'D';
    14: valor := 'E';
    15: valor := 'F';
    end;
    Result := valor;
end;

//Pasaje de una base a decimal
function baseaDecimal(numero: String;base: integer): extended;
var
  i: integer;
  valor : String;
  conversor: extended;
begin
  conversor := 0;
  for i := length(numero)  downto 1 do //Recorro de atras hacia adelante
  begin
    valor := HexaANumero(numero[i]); //Obtengo el valor
    // y lo paso por la funcion en el caso de que sea hexa
    //Multiplico el valor por la base elevado a el largo del
    //numero menos la posicion donde esta el numero
    conversor := conversor + strtoint(valor) * Power(base,length(numero) - i);
  end;
  result := conversor; //Devuelvo el resultado
end;

//Decimal a una base
function decimalAUnaBase(numero, base:Integer): String;
var resto: String;
begin
  //Caso base: El numero sea menor que la base, osea que no se puede dividir
  if numero < base then
  begin
    Result := numero.ToString; //Devuelvo ese numero
  end
  else //Sino, agrego al final el resto y aplico la funcion sobre el cociente
  begin
    resto := NumeroAHexa(numero MOD base);//Chequeo que lo pueda pasar a hexa
    Result :=  decimalAUnaBase(numero DIV base, base) + resto;
  end;
end;


//Boton que genera las conversiones
procedure TForm1.Button1Click(Sender: TObject);
var
contenedor: String;
begin
  case Combobox1.ItemIndex of
  0://Binario a
  begin
    case Combobox2.ItemIndex of
      1: //Decimal
      begin
        //Binario a decimal
        Edit2.Text := baseaDecimal(Edit1.Text,binario).ToString;
      end;
      2: //Octal
      begin
        //Decimal a Octal
        contenedor := baseaDecimal(Edit1.Text,binario).ToString; //Primero paso binario a decimal
        Edit2.Text := decimalAUnaBase(strtoint(contenedor),Octal);
      end;
      3: //Hexa
      begin
        //Decimal a Hexa
        contenedor := baseaDecimal(Edit1.Text,binario).ToString; //Primero paso binario a decimal
        Edit2.Text := decimalAUnaBase(strtoint(contenedor),Hexa);
      end;
      else Edit2.Text := Edit1.Text; //Misma base
    end;
  end;
  1://Decimal a
  begin
    case Combobox2.ItemIndex of
        0:
        begin
          //Decimal a binario
          Edit2.Text := decimalAUnaBase(strtoint(Edit1.Text),binario);
        end;
        2:
        begin
          //Decimal a Octal
          Edit2.Text := decimalAUnaBase(strtoint(Edit1.Text),Octal);
        end;
        3:
        begin
          //Decimal a Hexa
          Edit2.Text := decimalAUnaBase(strtoint(Edit1.Text),Hexa);
        end;
        else Edit2.Text := Edit1.Text; //Misma base
      end;
  end;
  2://Octal a
  begin
    case Combobox2.ItemIndex of
      0: //Binario
      begin
        //Octal a binario
        //Paso primero de octal a decimal y luego lo paso a binario
        contenedor := baseaDecimal(Edit1.Text,Octal).ToString;
        Edit2.Text := decimalAUnaBase(strtoint(contenedor),Binario);
      end;
      1: //Decimal
      begin
        //Octal a decimal
        Edit2.Text := baseaDecimal(Edit1.Text,Octal).ToString;
      end;
      3: //Hexa
      begin
        //Octal a Hexa
        //Paso primero de octal a decimal y luego lo paso a Hexa
        contenedor := baseaDecimal(Edit1.Text,Octal).ToString;
        Edit2.Text := decimalAUnaBase(strtoint(contenedor),Hexa);
      end;
      else Edit2.Text := Edit1.Text;  //Misma base
    end;
  end;
  3://Hexa a
  begin
    case Combobox2.ItemIndex of
      0: //Binario
      begin
        //Hexa a binario
        //Paso primero de Hexa a decimal y luego lo paso a binario
        contenedor := baseaDecimal(Edit1.Text,Hexa).ToString;
        Edit2.Text := decimalAUnaBase(strtoint(contenedor),Binario);
      end;
      1: //Decimal
      begin
        //Hexa a decimal
        Edit2.Text := baseaDecimal(Edit1.Text,Hexa).ToString;
      end;
      2: //Octal
      begin
        //Hexa a octal
        //Paso primero de Hexa a decimal y luego lo paso a octal
        contenedor := baseaDecimal(Edit1.Text,Hexa).ToString;
        Edit2.Text := decimalAUnaBase(strtoint(contenedor),octal);
      end;
      else Edit2.Text := Edit1.Text; //Misma base
    end;
  end;
  end;

End;

end.
