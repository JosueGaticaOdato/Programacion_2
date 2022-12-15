unit CodigoEjercicio7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, TADEjercicio7;

const
  Tamaño = 10;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Numero_Cola: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Tiempo_Cliente: TComboBox;
    Tiempo_Empleado: TComboBox;
    Label4: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Colas : Ejercicio7;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var X: TipoElemento;
begin
  //LLamo a cargar colas, pasandole el numero de cola y el tiempo
  X.Clave := StrtoInt(Tiempo_Cliente.Text);
  Colas.Cargar_Cola(Numero_Cola.ItemIndex,X);
  memo1.Lines.Add('Cola cargada con exito');
end;

procedure TForm1.Button2Click(Sender: TObject);
var Texto: String;
begin
  //LLamo a la funcion atender, pasandole el tiempo que va a hacer el empleado
  //al atender
  memo1.Clear;
  Texto := Colas.Atender(Strtoint(Tiempo_Cliente.Text));
  memo1.Lines.Add(Texto);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  //Funcion que muestra el contenido de las colas
  memo1.Clear;
  memo1.Lines.Add(Colas.Mostrar_Cola);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //Creacion de las colas
  Colas.Crear_Cola(Numero,Tamaño);
end;

end.
