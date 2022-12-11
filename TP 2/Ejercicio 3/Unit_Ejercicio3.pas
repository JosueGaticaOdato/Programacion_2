unit Unit_Ejercicio3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit_Matriz,Unit_Vector;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Button7: TButton;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  M: Matriz;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
V: Vector;
begin
  V := M.DiagonalPrincipal;
  memo1.Lines.Add('Diagonal principal:');
  memo1.Lines.Add(M.mostrarDiagonal(V));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('La maxima fila es ' + Inttostr(M.maximaFila));
  memo1.Lines.Add('Valor:' + Inttostr(M.valorMaximaFila));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
V: Vector;
begin
  V := M.DiagonalOpuesta;
  memo1.Lines.Add('Diagonal opuesta:');
  memo1.Lines.Add(M.mostrarDiagonal(V));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('La maxima columna es ' + Inttostr(M.maximaColumna));
  memo1.Lines.Add('Valor:' + Inttostr(M.valorMaximaColumna));
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  M.multiplicarEscalar(Strtoint(Edit1.Text));
  memo1.Lines.Add('Escalar aplicado!');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  memo1.Lines.Add(M.buscar(strtoint(edit1.Text)));
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  M.cargarAleatorio;
  memo1.Lines.Add('Matriz cargada');
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  memo1.Lines.Add(M.mostrar);
end;

end.
