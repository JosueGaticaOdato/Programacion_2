unit Unidad_Ejercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit_NumeroRacional;

type
  TForm1 = class(TForm)
    N1: TEdit;
    N2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Resultado: TEdit;
    procedure N1Change(Sender: TObject);
    procedure N2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  //Defino las variable a utilizar
  numero1: NumeroRacional;
  numero2: NumeroRacional;

 {
Ejercicio 1
Crear un TAD NúmeroRacional.
El TAD debe disponer de las siguientes operaciones:

.sumar
.restar
.multiplicar
.dividir
.potencia (para calcular potencias enteras)
.comparar (que compara 2 NúmeroRacional) y
 debe retornar [MAYOR, MENOR, IGUAL] según corresponda.
 }

implementation

{$R *.dfm}

//BOTON SUMA
procedure TForm1.Button1Click(Sender: TObject);
begin
  Resultado.Text := FloatToStr(numero1.sumar(numero2));
end;

//BOTON RESTA
procedure TForm1.Button2Click(Sender: TObject);
begin
  Resultado.Text := FloatToStr(numero1.restar(numero2));
end;

//BOTON MULTIPLICAR
procedure TForm1.Button3Click(Sender: TObject);
begin
  Resultado.Text := FloatToStr(numero1.multiplicar(numero2));
end;

//BOTON DIVIDR
procedure TForm1.Button4Click(Sender: TObject);
begin
  Resultado.Text := FloatToStr(numero1.dividir(numero2));
end;

//BOTON POTENCIA
procedure TForm1.Button5Click(Sender: TObject);
begin
  Resultado.Text := FloatToStr(numero1.potencia(numero2));
end;

//BOTON COMPARAR
procedure TForm1.Button6Click(Sender: TObject);
begin
  Resultado.Text := numero1.comparar(numero2);
end;

//CADA VEZ QUE CAMBIA UN NUMERO SE ACTUALIZA
procedure TForm1.N1Change(Sender: TObject);
begin
  numero1.setNumero(StrtoFloat(N1.Text));
end;

procedure TForm1.N2Change(Sender: TObject);
begin
  numero2.setNumero(StrtoFloat(N2.Text));
end;

end.
