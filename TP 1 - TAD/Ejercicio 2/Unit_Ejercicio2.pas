unit Unit_Ejercicio2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Unit_Vector;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit3: TEdit;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  V: Vector;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  V.carga(Strtoint(Edit1.Text),Strtoint(Edit2.Text),Checkbox1.Checked);
  memo1.Lines.Add('Vector cargado!');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Sumatoria: ' + inttostr(V.sumatoria));
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add('Promedio: ' + floattostr(V.promedio));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('Maximo');
  memo1.Lines.Add('Numero: ' + inttostr(V.maximoValor));
  memo1.Lines.Add('Posicion: ' + inttostr(V.maximoValorPosicion));
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  memo1.Lines.Add('Minimo');
  memo1.Lines.Add('Numero: ' + inttostr(V.minimoValor));
  memo1.Lines.Add('Posicion: ' + inttostr(V.minimoValorPosicion));
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  memo1.Lines.Add('Intercalado con ' + '"' + Edit3.Text + '"');
  memo1.Lines.Add(V.intercalado(Edit3.Text));
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  V.prodescalar(StrToInt(Edit3.Text));
  memo1.Lines.Add('Escalar multiplicado!');
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  memo1.Lines.Add(V.mostrar);
end;

procedure TForm1.Button9Click(Sender: TObject);
var newVector: Vector;
begin
  newVector.carga(Strtoint(Edit1.Text),Strtoint(Edit2.Text), Checkbox1.Checked);
  memo1.Lines.Add('Nuevo vector');
  memo1.Lines.Add(newVector.mostrar);
  V.sumaVectores(newVector);
  memo1.Lines.Add('Suma realizada');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  V.vaciar;
end;

end.
