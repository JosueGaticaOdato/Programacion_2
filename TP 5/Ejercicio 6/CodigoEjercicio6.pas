unit CodigoEjercicio6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, TADEjercicio6;

const
  Tamaño = 4;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button4: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    P: Ejercicio6;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  P.Cargar_Pila_Aleatoria(Tamaño);
  memo1.Lines.Add('Pila cargada');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  P.Insertar(Strtoint(Edit1.Text),Strtoint(Edit2.Text));
  memo1.Lines.Add('Elemento insertado');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add(P.Mostrar_Pila);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MEMO1.Clear;
end;

end.
