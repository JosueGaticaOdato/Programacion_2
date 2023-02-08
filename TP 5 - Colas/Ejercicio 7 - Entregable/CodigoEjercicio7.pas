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

{
Ejercicio 7
  Un negocio tiene 3 ventanillas para atender a sus clientes. Los clientes forman cola en cada ventanilla.
  Un día, dos de los tres empleados que atienden las ventanillas no pueden asistir al trabajo,
  quedando uno solo para atender a las tres colas. Este empleado decide que, a medida que lleguen los clientes,
  atenderá por cierta cantidad de minutos (que denominaremos Q) a cada cola, paseándose por todas las colas equitativamente.

  Se pide que implemente un algoritmo que modele esta situación y dé como resultado el orden en que fueron atendidos los clientes.

  Ejemplo: El algoritmo recibe un Q de tiempo que atenderá a cada cola y
  las tres colas cargadas con clientes, donde cada cliente es la cantidad de tiempo que se necesita para atenderlo.
  Q = 10
  Cola1 = (40, 20, 30)
  Cola2 = (20, 10)
  Cola3 = (10, 10, 10)

  Resultado =
  Cliente 1 Cola 3,
  Cliente 1 Cola 2,
  Cliente 2 Cola 3,
  Cliente 2 Cola 2,
  Cliente 3 Cola 3,
  Cliente 1 Cola 1,
  Cliente 2 Cola 1,
  Cliente 3 Cola 1}

//Boton que carga la cola
procedure TForm1.Button1Click(Sender: TObject);
var X: TipoElemento;
begin
  //LLamo a cargar colas, pasandole el numero de cola y el tiempo
  X.Clave := StrtoInt(Tiempo_Cliente.Text);
  Colas.Cargar_Cola(Numero_Cola.ItemIndex,X);
  memo1.Lines.Add('Cola cargada con exito');
end;

//Boton que muestra como tiene que atender las colas
procedure TForm1.Button2Click(Sender: TObject);
var Texto: String;
begin
  //LLamo a la funcion atender, pasandole el tiempo que va a hacer el empleado
  //al atender
  memo1.Clear;
  Texto := Colas.Atender(Strtoint(Tiempo_Cliente.Text));
  memo1.Lines.Add(Texto);
end;

//Boton que muestra el contenido de las colas
procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Clear;
  memo1.Lines.Add(Colas.Mostrar_Cola);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //Creacion de las colas
  Colas.Crear_Cola(Numero,Tamaño);
end;

end.
