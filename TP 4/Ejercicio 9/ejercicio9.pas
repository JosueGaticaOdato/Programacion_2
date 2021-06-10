unit ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADMultas,
  Vcl.StdCtrls, Vcl.ComCtrls,
  ListArray;
  //ListCursor;
  //ListPointer; //Falta chequear puntero

const
  cantElemMax = 100;


type


  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Label5: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  L: Lista;
  V: Vehiculo;

implementation
{$R *.dfm}

//Boton que realiza la carga en la lista
procedure TForm1.Button1Click(Sender: TObject);
var posAuto, posMulta: integer;
begin
  L.Crear(Cadena,cantElemMax);
  posAuto := V.buscarAuto(Edit1.Text);
  if posAuto = numError then begin
    posAuto := V.buscarPosDispo();
    if posAuto = numError then begin
      memo1.Lines.Add('No hay lugar en la lista de autos');
    end
    else begin
      V.guardarPatente(Edit1,posAuto);
    end;
  end
  else begin
    posMulta := V.buscarPosMulta(DateTimePicker1.Date,posAuto);
    if posMulta = numError then begin
      memo1.Lines.Add('No hay lugar en la lista de multas');
    end
    else begin
      V.guardarMulta(DateTimePicker1.Date,posAuto,posMulta,posMulta,Edit2.Text,ComboBox1.Text);
    end;
  end;
end;
//
////Generar una lista de lista que permita almacenar como clave la patente de un vehículo
//// (campo clave) y como valores de la clave las multas que se le realizaron a dicho
//// vehículo. Se debe guardar como datos de la multa el número de acta (campo clave),
////  la fecha y el importe (como valores), estado (Pendiente, Abonada, Anulada).
////
////Se pide:
////
////    Dado un vehículo determinar el total adeudado por multas, la multa más antigua
////    y la más reciente (comparable por las fechas).
////    ¿Cuál es el vehículo con mayor cantidad de infracciones?
////    ¿Cuál es el vehículo que más deuda de infracciones tiene?
////    ¿Existe algún vehículo/s que no tenga deuda de infracciones?
// recibo patente, fecha, importe y estado
//1. busco si la patente ya esta guardada
//1.1 si ya esta guardada, busco si hay una posición disponible y guardo en la 1ra que encuentre
//1.2 si no hay posicion disponible devuelvo error
//2. busco si existe una multa igual a la ingresada
//2.1 si existe repito lo mismo que el 1.1 y 1.2

//Boton que calcula el total de deudas de ese vehiculo
procedure TForm1.Button2Click(Sender: TObject);
var deuda: integer;
begin
  deuda := V.totalMultas(L, Edit3.Text);
  memo1.Lines.Add('La deuda del vehiculo ' + Edit3.Text + ' es de ' + deuda.ToString + ' pesos');
end;

//Boton que me muestra la multa mas antigua de ese vehiculo
procedure TForm1.Button3Click(Sender: TObject);
var X:TipoElemento;
  P: ^Integer;

begin
  X := V.multaAntigua(L,Edit3.Text);
  memo1.Lines.Add('La multa mas antigua es ' + FloatToStr(X.Clave));
  memo1.Lines.Add('Cargada el dia ' + DateToSTR(X.Valor1));
  P := X.Valor2;
  memo1.Lines.Add('Con un valor de ' + P^.ToString + ' pesos.');
end;

//Boton que me muestra la multa mas reciente de ese vehiculo
procedure TForm1.Button4Click(Sender: TObject);
var X:TipoElemento;
  P: ^Integer;
begin
  X := V.multaReciente(L,Edit3.Text);
  memo1.Lines.Add('La multa mas recien es ' + FloatToStr(X.Clave));
  memo1.Lines.Add('Cargada el dia ' + DateToSTR(X.Valor1));
  P := X.Valor2;
  memo1.Lines.Add('Con un valor de ' + P^.ToString + ' pesos.');
end;

//Boton que me muestra el vehiculo con la mayor cantidad de infraccion y su cantidad
procedure TForm1.Button5Click(Sender: TObject);
var X: TipoElemento;
begin
  X := V.Mayor_Cant_Infracciones(L);
  memo1.Lines.Add('El vehiculo con mayor cantidad de infracciones es ' + X.Clave);
  memo1.Lines.Add('Con un total de ' + IntToStr(X.Valor1) + ' infracciones');
end;

//Boton que me muestra el vehiculo con la mayor deuda
procedure TForm1.Button6Click(Sender: TObject);
var X: TipoElemento;
begin
  X := V.Mayor_Deuda(L);
  memo1.Lines.Add('El vehiculo con mayor deuda es ' + X.Clave) ;
  memo1.Lines.Add('Con un total a pagar de ' + IntToSTR(X.Valor1) + ' pesos.');
end;

//Boton que me muestra el vehiculo sin deudas
procedure TForm1.Button7Click(Sender: TObject);
var Vehiculo_sin_deuda: String;
begin
  Vehiculo_sin_deuda := V.Sin_Deuda(L);
  memo1.Lines.Add('El vehiculo que no tiene deudas es ' + Vehiculo_sin_deuda);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;

end;

end.
