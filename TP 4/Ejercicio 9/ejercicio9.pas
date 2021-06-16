unit ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADVehiculos, ListArray, ListCursor, ListPointer,
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
    editConsulta: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    LV: Vehiculos;

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
    Importe: integer;
begin
  Importe := strToInt(Edit2.Text);

  seGuardo := LV.guardarAuto(Edit1.Text);
  if (seGuardo = OK) or (seGuardo = ClaveDuplicada) then begin
    if seGuardo = OK then memo1.Lines.Add('El auto se guardó correctamente');
    if LV.insertarMulta(Edit1.Text,ComboBox1.Text,Importe,DateTimePicker1.Date) = OK then begin
      memo1.Lines.Add('La multa se guardó correctamente');
    end
    else begin
      memo1.Lines.Add('No se guardó la multa');
    end;
  end
  else begin
    memo1.Lines.Add('No se pudo guardar');
  end;
  memo1.Lines.Add('Patentes: ');
  memo1.Lines.Add( LV.mostrarLista);
end;

procedure TForm1.Button2Click(Sender: TObject);

begin
 memo1.Lines.Add('El importe total adeudado es ' + intToStr(LV.totalMultas(editConsulta.Text)));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LV.inicializarLista(Cadena,cantElemMax);
  memo1.Clear;
end;

end.
