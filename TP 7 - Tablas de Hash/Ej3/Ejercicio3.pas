unit Ejercicio3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,TADEjercicio3,Tipos;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnCargar: TButton;
    btnMostrar: TButton;
    btnEliminar: TButton;
    Memo1: TMemo;
    editCodigo: TEdit;
    editPrecio: TEdit;
    editDetalle: TEdit;
    editStock: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button1: TButton;
    Button4: TButton;
    procedure btnCargarClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TH:Ej3;

implementation

{$R *.dfm}

{
Ejercicio 3
  Desarrollar un algoritmo que dado un archivo que contendrá los datos de un producto
  (código, detalle, precio, stock) genere una tabla hash donde la clave será el código y
  se guardará como dato la posición física del registro para poder realizar accesos directos.

  Hacer un ABM para poder para cargar manualmente el archivo. El código es un valor de 7 dígitos.
}

procedure TForm1.btnCargarClick(Sender: TObject);
begin
  TH.cargarProducto(strtoint(editcodigo.Text),strtoint(editprecio.Text)
          ,strtoint(editstock.Text),editdetalle.text);
  memo1.Lines.Add('Producto agregado');
end;

procedure TForm1.btnMostrarClick(Sender: TObject);
begin
  memo1.lines.Add(TH.mostrarArchivo);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Lines.Add(TH.mostrarTablaHash);
end;

procedure TForm1.Button2Click(Sender: TObject);
var Ocupacion: Extended;
begin
  Ocupacion := TH.Porcentaje_Ocupacion * 100;
  memo1.Lines.Add('Porcentaje de ocupacion ' + Ocupacion.ToString + '%');
end;

procedure TForm1.Button3Click(Sender: TObject);
var Ocupacion: Extended;
begin
  Ocupacion := TH.Claves_Cargadas_VS_ZO * 100;
  memo1.Lines.Add('Porcentaje de claves en la ZO vs Claves cargadas ' + Ocupacion.ToString + '%');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TH.crearArchivo;
end;

end.
