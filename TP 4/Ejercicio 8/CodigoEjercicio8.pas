unit CodigoEjercicio8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos,
  //ListArray;
  //ListCursor;
  ListPointer, Vcl.StdCtrls, Vcl.WinXPickers;

const
  Almuerzo_de_negocios = 120;
  Atender_cliente = 10;
  Atender_cliente_VIP = 30;
  Reunion_gerente = 30;

type
  TForm1 = class(TForm)
    Actividad: TComboBox;
    Hora: TTimePicker;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  L: Lista;

implementation

{$R *.dfm}

function Mostrar (L1: Lista): String;
begin
  L.RetornarClaves;
end;

procedure TForm1.Button1Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Hora.Time;
  X.Valor1 := Actividad.Text;
  L.Agregar(X);
  memo1.Lines.Add('Actividad agregada!');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add(L.RetornarClaves);
end;

end.
