unit ejercicio4Binarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, binarioTAD;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    binario1: TEdit;
    binario2: TEdit;
    btnSuma: TButton;
    Label1: TLabel;
    Label2: TLabel;
    btnResta: TButton;
    btnConversion1: TButton;
    btnAND: TButton;
    btnOR: TButton;
    btnXOR: TButton;
    btnConversion2: TButton;
    procedure btnSumaClick(Sender: TObject);
    procedure btnANDClick(Sender: TObject);
    procedure btnORClick(Sender: TObject);
    procedure btnXORClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConversion1Click(Sender: TObject);
    procedure btnConversion2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//Click de AND
procedure TForm1.btnANDClick(Sender: TObject);
var nro1, nro2, OperadorAND: Binario;
begin
  //Creo los binarios
  if nro1.Crear(binario1.Text) and nro2.Crear(binario2.Text) then begin
    //Realizo la operacion
    OperadorAND := nro1.andLogico(nro2.toStr);
    //Muestro en memo
    memo1.Lines.Add('La operacion AND entre los dos numeros binarios es igual a ' + OperadorAND.toStr);
    memo1.Lines.Add('');
  end;
end;

//Click de Conversion
procedure TForm1.btnConversion1Click(Sender: TObject);
var nro1: Binario;
  Conversor: Extended;
begin
  //Creo los binarios
  if nro1.Crear(binario1.Text) then
  begin
  //Realizo la operacion
  Conversor := nro1.convertirADecimal;
  //Muestro en memo
  memo1.Lines.Add('La conversion del numero binario a decimal es ' + Conversor.ToString);
  memo1.Lines.Add('');
  end;
end;

//Click de Conversion
procedure TForm1.btnConversion2Click(Sender: TObject);
var nro2: Binario;
  Conversor: Extended;
begin
  //Creo los binarios
  if nro2.Crear(binario2.Text) then
  begin
  //Realizo la operacion
  Conversor := nro2.convertirADecimal;
  //Muestro en memo
  memo1.Lines.Add('La conversion del numero binario a decimal es ' + Conversor.ToString);
  memo1.Lines.Add('');
  end;
end;

//Click de OR
procedure TForm1.btnORClick(Sender: TObject);
var nro1, nro2, OperadorOR: Binario;
begin
  //Creo los binarios
  if nro1.Crear(binario1.Text) and nro2.Crear(binario2.Text) then begin
    //Realizo la operacion
    OperadorOR := nro1.orLogico(nro2.toStr);
    //Muestro en memo
    memo1.Lines.Add('La operacion OR entre los dos numeros binarios es igual a ' + OperadorOR.toStr);
    memo1.Lines.Add('');
  end;
end;

//Click de Suma
procedure TForm1.btnSumaClick(Sender: TObject);
var nro1, nro2, suma: Binario;
begin
  //Creo los binarios
  if nro1.Crear(binario1.Text) and nro2.Crear(binario2.Text) then begin
    //Realizo la suma
    suma := nro1.Sumador(nro2.toStr);
    //Muestro en memo
    memo1.Lines.Add('La suma entre los dos numeros binarios es igual a ' + suma.toStr);
    memo1.Lines.Add('');
  end;
end;

//Click de XOR
procedure TForm1.btnXORClick(Sender: TObject);
var nro1, nro2, OperadorXOR: Binario;
begin
  //Creo los binarios
  if nro1.Crear(binario1.Text) and nro2.Crear(binario2.Text) then begin
    //Realizo la operacion
    OperadorXOR := nro1.xorLogico(nro2.toStr);
    //Muestro en memo
    memo1.Lines.Add('La operacion XOR entre los dos numeros binarios es igual a ' + OperadorXOR.toStr);
    memo1.Lines.Add('');
  end;
end;

//Limpieza de memo
procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
