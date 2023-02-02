unit Ejercicio5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  //ListArray;
  //ListCursor;
  ListPointer;

const
  cantElementos = 3;
  minRandom = 1;
  maxRandom = 10;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

PROCEDURE Burbujeo(var L: Lista; P, Q: PosicionLista);
begin

end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  L.LlenarClavesRandom(cantElementos, minRandom, maxRandom);
end;

//Boton que muestra el contenido de las lista
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Contenido lista:');
  memo1.Lines.Add(L.RetornarClaves);
end;

end.
