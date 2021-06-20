unit CodigoEjercicio0;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, TADEjercicio9;

const
  CantidadMax = 30;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Button4: TButton;
    Memo1: TMemo;
    Palabra: TEdit;
    Button1: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Pila: Ejercicio9;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//Boton que carga la palabra en una pila
procedure TForm1.Button1Click(Sender: TObject);
begin
  Pila.Cargar_Palindromo(Palabra.Text);
  memo1.Clear;
  memo1.Lines.Add('Palabra cargado');
end;

//Boton que devuelve si la pila es o no palindromo
procedure TForm1.Button2Click(Sender: TObject);
var Palindromo: Boolean;
begin
  Palindromo := Pila.Es_Palindromo;
  if Palindromo then
  begin
    memo1.Lines.Add('Es palindromo!');
  end
  else memo1.Lines.Add('No es palindromo');
end;

//Boton que muestra el contenido de la pila
procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('La pila es');
  memo1.Lines.Add(Pila.Mostrar_Pila);
end;

end.
