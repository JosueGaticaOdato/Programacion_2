unit CodigoEjercicio5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEjercicio5, Tipos;

const
  CantidadMaxRandom = 3;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button4: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    Pila: Ejercicio5;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Pila.Cargar_Pila_Aleatoria(CantidadMaxRandom);
  memo1.Lines.Add('Pila cargada');
end;

procedure TForm1.Button2Click(Sender: TObject);
var X: TipoElemento;
  PSinOcurrencias: Ejercicio5;
begin
  //PSinOcurrencias.Definir_Tamaño_Pila(CantidadMaxRandom);
  X.Clave := StrToint(Edit1.Text);
  PSinOcurrencias := Pila.Eliminar_Ocurrencias(X);
  memo1.Lines.Add('La pila sin las ocurrencias es');
  memo1.Lines.Add(PSinOcurrencias.Mostrar_Pila);
end;

procedure TForm1.Button3Click(Sender: TObject);
var X: TipoElemento;
  PSinOcurrencias: Ejercicio5;
  AUX1,AUX2,AUX3: Ejercicio5;
begin
  Aux1.Definir_Tamaño_Pila(CantidadMaxRandom);
  Aux2.Definir_Tamaño_Pila(CantidadMaxRandom);
  Aux3.Definir_Tamaño_Pila(CantidadMaxRandom);
  X.Clave := StrToint(Edit1.Text);
  PSinOcurrencias := Pila.Eliminar_Ocurrencias_Recursiva(X,AUX1,AUX2,AUX3);
  memo1.Lines.Add('La pila sin las ocurrencias es');
  memo1.Lines.Add(PSinOcurrencias.Mostrar_Pila);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('La pila es');
  memo1.Lines.Add(Pila.Mostrar_Pila);
end;

end.
