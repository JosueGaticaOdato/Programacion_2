unit CodigoEjercicio3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADEjercicio3, Vcl.StdCtrls;

const
  Tamaño = 3;
  Maximo = 10;
  Minimo = 1;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Memo1: TMemo;
    c: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure cClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    Cola: Ejercicio3;
    Sin_Repeticiones: Ejercicio3;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 3
Dada una cola de números enteros, no ordenada, construir un algoritmo que permita pasar
a otra cola todos los elementos que no se repiten en la primera,
sin destruir el contenido de la cola original y dejándola en su estado inicial.

Determinar la complejidad algorítmica de la solución.

Ejemplo: si C contiene (12, 6, 8, 5, 8, 12, 12) la cola resultado del proceso sería (6, 5).
}

//Boton que carga la cola
procedure TForm1.Button1Click(Sender: TObject);
begin
  Cola.Cargar_Aleatorio(Tamaño,Minimo,Maximo);
  memo1.Lines.Add('Cola cargada');
end;

//Boton que muestra la cola
procedure TForm1.Button2Click(Sender: TObject);
begin
  Cola.cargarEjemplo;
  memo1.Lines.Add('Cola cargada');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add('Cola:');
  memo1.Lines.Add(Cola.Mostrar_Cola);
end;

//Boton que muestra una nueva cola sin los repetidos
procedure TForm1.cClick(Sender: TObject);
begin
  Sin_Repeticiones := Cola.Eliminar_Repeticiones(Tamaño);
  memo1.Lines.Add('La cola sin repeticiones es la siguiente');
  memo1.Lines.Add(Sin_Repeticiones.Mostrar_Cola);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Cola.Crear_Cola(Numero,Tamaño);
end;

end.
