unit Ejercicio13Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Numero: TEdit;
    Memo1: TMemo;
    Comprobar: TButton;
    procedure ComprobarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function Divisible_por_7 ( Numero: Integer): Boolean;
var Cifra: Integer;
begin
  //El caso base es que el numero sera menor o igual a 70
  if Numero <= 70 then
  begin
    //Si es, verifico si es multiplo o no de 7
    if Numero MOD 7 = 0 then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  end
  //Si no es el caso base, procedo a lo siguiente
  else
  begin
    //Saco la ultima cifra y la multiplico por 2
    Cifra := strtoint(Numero.ToString[Length(Numero.ToString)]);
    Cifra := Cifra * 2;
    //La funcion copy me elimina el ultimo valor que esta en el numero
    //Recibe como paratros un string, la posicion inicial y la posicion final
    Numero := strtoint(copy(Numero.ToString,1, Length(Numero.ToString) - 1));
    //Realizo la resta
    Numero := Numero - Cifra;
    //Realizo el procedimiento recursivo con el nuevo numero
    Result := Divisible_por_7(Numero);
  end;
end;

procedure TForm1.ComprobarClick(Sender: TObject);
var Valor: Boolean;
begin
  //LLamo a la funcion recursiva
  Valor := Divisible_por_7(strtoint(Numero.Text));
  //Si valor es verdadero es divisible
  if Valor then
  begin
    memo1.Lines.Add('Es divisible por 7');
  end
  //Sino no es divisible
  else
  begin
    memo1.Lines.Add('No es divisible por 7');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
