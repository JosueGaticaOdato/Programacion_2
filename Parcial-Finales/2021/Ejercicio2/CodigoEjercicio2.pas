unit CodigoEjercicio2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos,
  ArbolesBinarios,
  ListArray,
  //ListCursor,
  //ListPointer,
  Vcl.StdCtrls;

const
  Tamaño = 100;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    L: Lista;
    A: Arbol;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
//Complejidad algoritmica O(n) Lineal
//.Recorrido en PostOrden pero de forma inversa, comenzado por la derecha
//.Recorro hasta encontrar el mas grande de los de las derecha
//.Guardo el nodo y busco a su padre
//.Consigo a su padre y busco a su hijo izquierdo
//.Recupero el subarbol del hijo izquierdo y ahora guardo el padre de los dos
//.Repetir
Function recorridoArbol(var Tree:Arbol): Lista;
var
  X: TipoElemento;
  List: Lista;
  Procedure AUXrecorridoArbol(P: PosicionArbol);
  begin
    If Tree.RamaNula(P) Then
    begin
    end
    Else
    Begin
      AUXrecorridoArbol(P^.HD);
      AUXrecorridoArbol(P^.HI);
      List.Agregar(P^.Datos);
    End;
  End;
Begin
  List.Crear(Cadena,Tamaño);
  AUXrecorridoArbol(Tree.Root);
  recorridoArbol := List;
End;

procedure TForm1.Button1Click(Sender: TObject);
begin
  A.CargarArbol;
  memo1.Lines.Add('Arbol cargado');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  L := Recorridoarbol(A);
  memo1.Lines.Add('Recorrido:');
  memo1.Lines.Add(L.RetornarClaves);
end;

end.
