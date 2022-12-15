unit Ejercicio3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Tipos, TADEjercicio3;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    Arbol1 : Ej3;
    Arbol2 : Ej3;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Arbol1.crearArbol(tipoClave,cantElemArbol);
  Arbol1.cargarArbol;
  memo1.Lines.Add('Arbol cargado');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Recorrido en anchura del arbol 2:');
  memo1.Lines.Add(Arbol2.mostrarAnchura)
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add('Recorrido en anchura:');
  memo1.Lines.Add(Arbol1.mostrarAnchura)
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('Hojas del arbol n-ario:');
  memo1.Lines.Add(Arbol1.Hojas)
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Arbol2.crearArbol(tipoClave,cantElemArbol);
  Arbol2.cargarArbol;
  memo1.Lines.Add('Arbol 2 cargado');
end;

procedure TForm1.Button6Click(Sender: TObject);
var Iguales: Boolean;
begin
  Iguales := Arbol1.Misma_Estructura(Arbol1,Arbol2);
  if Iguales then
  begin
    memo1.Lines.Add('Ambos arboles tienen la misma estructura');
  end
  else
  begin
    memo1.Lines.Add('Los arboles no tienen la misma estructura');
  end;
end;

end.
