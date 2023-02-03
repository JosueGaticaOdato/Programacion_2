unit Ejercicio10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos,TADSieteSegmentos,
  //ListArray;
  //ListCursor;
  ListPointer;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  D: Digital;

implementation

{$R *.dfm}

//Boton que carga el numero de forma digital
procedure TForm1.Button1Click(Sender: TObject);
begin
  D.cargar(strtofloat(Edit1.Text));
end;

//Boton que muestra el contenido de la lista
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add(D.mostrarListas);
end;

//Boton que realiza la suma
procedure TForm1.Button3Click(Sender: TObject);
var L: Lista;
begin
  L := D.suma;
  memo1.Lines.Add(D.mostrarResultado(L));
end;

//Boton que realiza la resta
procedure TForm1.Button4Click(Sender: TObject);
var L: Lista;
begin
  L := D.resta;
  memo1.Lines.Add(D.mostrarResultado(L));
end;

//Boton que realiza la multiplicacion
procedure TForm1.Button5Click(Sender: TObject);
var L: Lista;
begin
  L := D.multiplicacion;
  memo1.Lines.Add(D.mostrarResultado(L));
end;

//Boton que realiza la division
procedure TForm1.Button6Click(Sender: TObject);
var L: Lista;
begin
  L := D.division;
  memo1.Lines.Add(D.mostrarResultado(L));
end;


end.
