unit CodigoEjercicio4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEjercicio4, Tipos;

const
  CantidadMaxRandom = 3;


type
  TForm1 = class(TForm)
    Button1: TButton;
    Button4: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Pila: Ejercicio4;
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
var PilaInvertida: Ejercicio4;
begin
  PilaInvertida := Pila.Invertir;
  memo1.Lines.Add('La pila invertida seria');
  memo1.Lines.Add(PilaInvertida.Mostrar_Pila);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('La pila es');
  memo1.Lines.Add(Pila.Mostrar_Pila);
end;

end.
