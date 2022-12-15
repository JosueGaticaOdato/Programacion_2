unit Ej3Arboles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Ej3ArbolesTAD, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnCargar: TButton;
    btnRecorrido: TButton;
    btnHojas: TButton;
    btnCargar2: TButton;
    btnComparar: TButton;
    Memo1: TMemo;
    procedure btnCargarClick(Sender: TObject);
  private
    { Private declarations }
    AB:Ej3;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.btnCargarClick(Sender: TObject);
begin
  AB.crearArbol(tipoClave,cantElemArbol);
  AB.cargarArbol;
  AB.pasarNArioABinario(AB);
end;

end.
