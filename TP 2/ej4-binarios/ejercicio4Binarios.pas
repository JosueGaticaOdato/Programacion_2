unit ejercicio4Binarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, binarioTAD;

type
  TForm1 = class(TForm)
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
    Label3: TLabel;
    Result: TEdit;
    CBinario: TEdit;
    CDecimal: TEdit;
    ResultBD: TEdit;
    ResultDB: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    procedure btnSumaClick(Sender: TObject);
    procedure btnANDClick(Sender: TObject);
    procedure btnORClick(Sender: TObject);
    procedure btnXORClick(Sender: TObject);
    procedure btnConversion1Click(Sender: TObject);
    procedure btnConversion2Click(Sender: TObject);
    procedure btnRestaClick(Sender: TObject);
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
    //Muestro
    Result.Text := OperadorAND.toStr;
  end
  else
  begin
    Result.Text := 'ERROR';
  end;
end;

//Click de Conversion
procedure TForm1.btnConversion1Click(Sender: TObject);
var nro1: Binario;
  Conversor: Extended;
begin
  //Creo los binarios
  if nro1.Crear(CBinario.Text) then
  begin
  //Realizo la operacion
    Conversor := nro1.convertirADecimal;
  //Muestro
  //memo1.Lines.Add(Conversor.);
    ResultBD.Text := Conversor.ToString;
  end
  else
  begin
    Result.Text := 'ERROR';
  end;
end;

//Click de Conversion2
procedure TForm1.btnConversion2Click(Sender: TObject);
var Numero: Integer;
  Conversor : Binario;
begin
  Numero := strtoint(CDecimal.Text);
  //Realizo la operacion
  Conversor.ConvertirABinario(Numero);
  //Muestro
  ResultDB.Text := Conversor.toStr;
end;

//Click de OR
procedure TForm1.btnORClick(Sender: TObject);
var nro1, nro2, OperadorOR: Binario;
begin
  //Creo los binarios
  if nro1.Crear(binario1.Text) and nro2.Crear(binario2.Text) then begin
    //Realizo la operacion
    OperadorOR := nro1.orLogico(nro2.toStr);
    //Muestro
    Result.Text := OperadorOR.toStr;
  end
  else
  begin
    Result.Text := 'ERROR';
  end;
end;

//Click de Resta
procedure TForm1.btnRestaClick(Sender: TObject);
var nro1, nro2, resta: Binario;
begin
  //Creo los binarios
  if nro1.Crear(binario1.Text) and nro2.Crear(binario2.Text) then
  begin
    //Realizo la suma
    resta := nro1.Restar(nro2.toStr);
    //Muestro
    Result.Text := resta.toStr;
  end
  else
  begin
    Result.Text := 'ERROR';
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
    //Muestro
    Result.Text := suma.toStr;
  end
  else
  begin
    Result.Text := 'ERROR';
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
    //Muestro
    Result.Text := OperadorXOR.toStr;
  end
  else
  begin
    Result.Text := 'ERROR';
  end;
end;

end.
