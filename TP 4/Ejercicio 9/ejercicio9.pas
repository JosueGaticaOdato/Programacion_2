unit ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADMultas, ListArray, ListCursor, ListPointer,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
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
    Label5: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit3: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    LV: Vehiculo;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}

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

//ingresa la patente, busco si la patente ya esta, si la lista esta vacia agrego de una,
//sino, veo si la lista de multas está llena, sino agrego la multa



procedure TForm1.Button1Click(Sender: TObject);
var seGuardo: Errores;
begin
  seGuardo := LV.Guardar(Edit1.Text,ComboBox1.Text,Edit2.Text,DateTimePicker1.Date);
  if seGuardo = OK then begin
    memo1.Lines.Add('Se guardó correctamente');
  end
  else begin
    memo1.Lines.Add('No se pudo guardar');
  end;
  memo1.Lines.Add( LV.mostrarLista);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LV.inicializarLista(Cadena,cantElemMax);
  memo1.Clear;
end;

end.
