unit Unit_Ejercicio7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit_Cliente;

type
  TForm1 = class(TForm)
    Codigo: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Razon: TEdit;
    Domicilio: TEdit;
    Localidad: TEdit;
    TE: TEdit;
    Mail: TEdit;
    Filtra: TEdit;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    C: Clientes;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 7

Generar un ABM (alta, baja y modificación) para cargar datos de un cliente.

Los campos del archivo son Codigo de tipo longint,
Razon_Social de tipo String[50], Domicilio de tipo String[50],
Localidad de String[30], TE de BigInt y Mail de String[100].

Se pide además realizar una consulta donde se pueda
filtrar por la “Razon_Social”. El Código identificará
la posición del registro del cliente en el archivo.
Es decir, el código 250 estará almacenado en la posición
250 del archivo. Contemplar un total máximo de 1000 clientes.
}

//Boton que realiza el alta de un cliente
procedure TForm1.Button1Click(Sender: TObject);
var agregado: boolean;
begin
  memo1.Clear;
  agregado := C.alta(strtoint(Codigo.Text), strtoint(te.Text),
  razon.Text, domicilio.Text, localidad.Text, mail.Text);
  if agregado then //Segun lo que devuelta la funcion se mostrara en pantalla lo sucedido
  begin
    memo1.Lines.Add('Cliente agregado!');
  end
  else
  begin
    memo1.Lines.Add('No se pudo agregar al cliente');
  end;
end;

//Filtrar todos los clientes por la razon social
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Clear;
  memo1.Lines.Add('Filtrando por ' + Filtra.Text);
  memo1.Lines.Add(C.filtrar(Filtra.Text));

end;

//Boton que muestra todos los clientes existentes
procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Clear;
  memo1.Lines.Add(C.mostrarTodo);
end;

procedure TForm1.Button4Click(Sender: TObject);
var borrado: boolean;
begin
  memo1.Clear;
  borrado := C.baja(strtoint(Codigo.Text));
  if borrado then //Segun lo que devuelta la funcion se mostrara en pantalla lo sucedido
  begin
    memo1.Lines.Add('Cliente borrado!');
  end
  else
  begin
    memo1.Lines.Add('No se pudo borrar al cliente porque no existe');
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var modificado: boolean;
begin
  modificado := C.modificacion(strtoint(Codigo.Text), strtoint(te.Text),
  razon.Text, domicilio.Text, localidad.Text, mail.Text);
  if modificado then //Segun lo que devuelta la funcion se mostrara en pantalla lo sucedido
  begin
    memo1.Lines.Add('Cliente modificado!');
  end
  else
  begin
    memo1.Lines.Add('No se pudo modificar al cliente porque no existe');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  C.Crear;
end;

end.
