unit CodigoEjercicio11;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEjercicio11, Tipos;

const
  CantidadMaxima = 50;

type
  TForm1 = class(TForm)
    Label4: TLabel;
    Numero1: TEdit;
    Numero2: TEdit;
    Label3: TLabel;
    btnMCD: TButton;
    Label2: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnMCDClick(Sender: TObject);
  private
    { Private declarations }
    Pila: Ejercicio11;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMCDClick(Sender: TObject);
var MCD: Integer;
begin
  MCD := Pila.MaximoComunDivisor(StrtoInt(Numero1.Text),StrToint(Numero2.Text));
  memo1.Lines.Add('El maximo comun divisor entre esos dos numeros es ' + MCD.ToString);
  memo1.Lines.Add('Llamado recursivo');
  memo1.Lines.Add(Pila.Mostrar_Pila);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Pila.Definir_Tamaño_Pila(CantidadMaxima);
end;

end.
