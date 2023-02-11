unit Ej1Conjuntos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Ej1ConjuntosTAD;

type
  TForm1 = class(TForm)
    btnMostrar: TButton;
    Memo1: TMemo;
    btnUnion: TButton;
    btnInterseccion: TButton;
    btnDiferencia: TButton;
    btnPertenencia: TButton;
    editElemento: TEdit;
    Label1: TLabel;
    checkBoxC1: TCheckBox;
    checkBoxC2: TCheckBox;
    btnCargar: TButton;
    procedure btnMostrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUnionClick(Sender: TObject);
    procedure btnInterseccionClick(Sender: TObject);
    procedure btnDiferenciaClick(Sender: TObject);
    procedure btnPertenenciaClick(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
  private
    { Private declarations }
    C1,C2:Ej1;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 1

  Desarrollar un algoritmo que dados dos conjuntos de elementos tipo carácter (char)
  verifique las operaciones de Unión, Intersección, Diferencia y Pertenencia.
}

//Mostrar contenido de los conjuntos
procedure TForm1.btnMostrarClick(Sender: TObject);
begin
  memo1.Lines.Add('Conjunto 1: ');
  memo1.Lines.Add(C1.mostrarConjunto(C1));
  memo1.Lines.Add('Conjunto 2: ');
  memo1.Lines.Add(C2.mostrarConjunto(C2));
end;

//Boton que busca si un elemento dado esta en ub conjunto
procedure TForm1.btnPertenenciaClick(Sender: TObject);
var C:Ej1;
    Elem:integer;
begin
  if checkBoxC1.Checked then
  begin
    if C1.Pertenencia(C1,editElemento.Text) then
    begin
      memo1.Lines.Add('El elemento pertenece al conjunto 1');
    end
    else memo1.Lines.Add('El elemento no pertenece al conjunto 1');
  end;

  if checkBoxC2.Checked then
  begin
    if C2.Pertenencia(C2,editElemento.Text) then
    begin
      memo1.Lines.Add('El elemento pertenece al conjunto 2');
    end
    else memo1.Lines.Add('El elemento no pertenece al conjunto 2');
  end;
end;

//Boton que realiza la Union
procedure TForm1.btnUnionClick(Sender: TObject);
var C:Ej1;
begin
  C := C1.Union(C1,C2);
  memo1.Lines.Add('Unión: ');
  memo1.Lines.Add(C.mostrarConjunto(C));
end;

//Boton que realiza la interseccion
procedure TForm1.btnInterseccionClick(Sender: TObject);
var C:Ej1;
begin
  C := C1.Interseccion(C1,C2);
  memo1.Lines.Add('Intersección: ');
  memo1.Lines.Add(C.mostrarConjunto(C));
end;

//Boton que carga los conjuntos
procedure TForm1.btnCargarClick(Sender: TObject);
begin
  C1.crearConjunto(tipoClave,cantElem,Min);
  C2.crearConjunto(tipoClave,cantElem,Min);
end;

//Boton que realiza la diferencia
procedure TForm1.btnDiferenciaClick(Sender: TObject);
var C:Ej1;
begin
  C := C1.cDiferencia(C1,C2);
  memo1.Lines.Add('Diferencia (Conjunto 1 - Conjunto 2): ');
  memo1.Lines.Add(C.mostrarConjunto(C));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  C1.crearConjunto(tipoClave,cantElem,Min);
  C2.crearConjunto(tipoClave,cantElem,Min);
  memo1.Clear;
end;

end.
