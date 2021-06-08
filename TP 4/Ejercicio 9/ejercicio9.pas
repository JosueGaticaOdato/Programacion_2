unit ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos,
   ListArray, Vcl.StdCtrls, Vcl.ComCtrls;
  //ListCursor;
  //ListPointer;

const
  cantElemMax = 100;

type
  antiguedadMultas = Array[0..1] of integer;
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Button2: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  L: Lista;

implementation

{$R *.dfm}
//
//Generar una lista de lista que permita almacenar como clave la patente de un
// vehículo (campo clave) y como valores de la clave las multas que se le
//realizaron a dicho vehículo. Se debe guardar como datos de la multa el número de
// acta (campo clave), la fecha y el importe (como valores), estado (Pendiente,
// Abonada, Anulada).
//

//Se pide:
//
//    Dado un vehículo determinar el total adeudado por multas, la multa más
//antigua y la más reciente (comparable por las fechas).
//    ¿Cuál es el vehículo con mayor cantidad de infracciones?
//    ¿Cuál es el vehículo que más deuda de infracciones tiene?
//    ¿Existe algún vehículo/s que no tenga deuda de infracciones?

//procedure mostrarLista(var Li: Lista);
//begin
//  Li.RetornarClaves;
//end;

function multaAntiguayReciente(L: Lista; Auto: string) : antiguedadMultas;
var contL1, contL2: tipoElemento;
    pos: posicionLista;
    puntero: ^Lista;
    multas: antiguedadMultas;
    multaAntigua, multaReciente: integer;
begin
  pos := L.Comienzo;
  contL1 := L.Recuperar(pos);
  multaAntigua := 0;
  multaReciente := 0;
  if contL1.Clave = Auto then begin
    puntero := contL1.Valor2;
    contL2 := puntero^.Recuperar(pos);
    while pos <> Nulo do begin
      if contL2.Clave[0] = 'Pendiente' then begin
        multaAntigua := contL2.Valor1;
        multaReciente := contL2.Valor1;
        if ContL2.Valor1 < multaAntigua then begin
          multaAntigua := ContL2.Clave[1];
        end;
        if ContL2.Valor1 > multaReciente then begin
          multaReciente := ContL2.Clave[1];
        end;
      end;
      pos := L.Siguiente(pos);
      contL2 := puntero^.Recuperar(pos);
    end;
  end;
  multas[0] := multaAntigua;
  multas[1] := multaReciente;
  Result := multas;
end;


function totalMultas(L: Lista; Auto: string) : integer;
var sumador: integer;
    contL1, contL2: tipoElemento;
    pos: posicionLista;
    puntero: ^Lista;
    puntero2: ^integer;
begin
  pos := L.Comienzo;
  sumador := 0;

  while pos <> Nulo do begin
    contL1 := L.Recuperar(pos);
    if contL1.Clave = Auto then begin
      if contL1.Valor1 = 'Pendiente' then begin
        puntero := contL1.Valor2;
        contL2 := puntero^.Recuperar(pos);

        puntero2 := contL2.Valor2;
        sumador := sumador + puntero2^;
      end;
    end;
    pos := L.Siguiente(pos);
  end;
  Result := sumador;
end;

procedure TForm1.Button1Click(Sender: TObject);
var Elem, ElemPuntero: tipoElemento;
    posElem: posicionLista;
    puntero: ^Lista;
    punteroValor2: ^Integer;
    claveMulta: Array[0..1] of string;
begin
  Randomize;
  L.Crear(Cadena,cantElemMax);
  New(puntero);
  puntero^.Crear(Numero,cantElemMax);
  Elem.Clave := Edit1.Text; //patente
  New(punteroValor2);
  claveMulta[0] := intToStr(Random(100));
  claveMulta[1] := ComboBox1.Text;
  ElemPuntero.Clave := claveMulta; // nro acta multa y estado
  ElemPuntero.Valor1 := DateTimePicker1.Date;        //fecha multa

  punteroValor2^ := Random(15000);  //importe multa
  ElemPuntero.Valor2 := punteroValor2;

  puntero^.Agregar(ElemPuntero);
  Elem.Valor2 := puntero;        //multas
  L.Agregar(Elem);
  memo1.Lines.Add(L.RetornarClaves);
  memo1.Lines.Add(puntero^.RetornarClaves);
  //mostrarLista(L);
end;



procedure TForm1.Button2Click(Sender: TObject);
var deuda: integer;
begin
  deuda := totalMultas(L, Edit2.Text);
  memo1.Lines.Add(intToStr(deuda));
end;

procedure TForm1.Button3Click(Sender: TObject);
var multas: antiguedadMultas;
begin
  multas := multaAntiguayReciente(L, Edit2.Text);
  memo1.Lines.Add('Multa más antigüa: ' + intToStr(multas[0]));
  memo1.Lines.Add('Multa más reciente: ' + intToStr(multas[1]));
end;

end.
