unit Unidad_Ejercicio2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Unidad_Vector, Vcl.StdCtrls;

type
  TEjercicio2 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Tamaño: TEdit;
    Memo1: TMemo;
    Label2: TLabel;
    Minimo: TEdit;
    Label3: TLabel;
    Maximo: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ejercicio2: TEjercicio2;

implementation

{$R *.dfm}

end.
