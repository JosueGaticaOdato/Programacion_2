unit ej7Colas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,ej7ColasTAD;

type
  TForm1 = class(TForm)
    btnMostrarYCargar: TButton;
    Memo1: TMemo;
    btnMostrarOrden: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnMostrarYCargarClick(Sender: TObject);
    procedure btnMostrarOrdenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    C1: Ej7;
    C2: Ej7;
    C3: Ej7;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMostrarOrdenClick(Sender: TObject);
var C:Ej7;
begin
  C := C.atenderColas(Q,C1,C2,C3);
  C := C.mostrarOrdenClientes(C);
  memo1.Lines.Add(C.mostrarColas);
end;

procedure TForm1.btnMostrarYCargarClick(Sender: TObject);
begin
  C1.cargarColas(cantElemCola,Min,Max);
  C2.cargarColas(cantElemCola,Min,Max);
  C3.cargarColas(cantElemCola,Min,Max);
  memo1.Lines.Add('Cola 1: ');
  memo1.Lines.Add(C1.mostrarColas);
  memo1.Lines.Add('Cola 2: ');
  memo1.Lines.Add(C2.mostrarColas);
  memo1.Lines.Add('Cola 3: ');
  memo1.Lines.Add(C3.mostrarColas);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
  C1.crearCola(tipoClave,cantElemCola);
  C2.crearCola(tipoClave,cantElemCola);
  C3.crearCola(tipoClave,cantElemCola);
end;

end.
