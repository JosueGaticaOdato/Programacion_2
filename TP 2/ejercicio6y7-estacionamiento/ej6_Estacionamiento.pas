unit ej6_Estacionamiento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, estacionamientoTAD, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnGuardar: TButton;
    Button2: TButton;
    Patente: TEdit;
    Label1: TLabel;
    autosGuardados: TButton;
    horarioEntrada: TEdit;
    Label2: TLabel;
    horarioSalida: TEdit;
    Label3: TLabel;
    procedure btnGuardarClick(Sender: TObject);
    procedure mostrarAuto(autoGuardado: Auto; lugar: integer);
    procedure autosGuardadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//muestra todos los autos guardados, lo hice para ver como solucionaba el problema de que siempre guarda en el mismo indice
procedure TForm1.autosGuardadosClick(Sender: TObject);
var cantidadAutos: integer;
    E: Estacionamiento;
begin
  cantidadAutos := E.conseguirLugar();
  memo1.Lines.Add('La cantidad de autos estacionados es: ' + cantidadAutos.ToString);
end;

//botón guardar auto, llama a función que guarda en vector si hay lugar
procedure TForm1.btnGuardarClick(Sender: TObject);
var E: Estacionamiento;
    lugar: integer;
    autoGuardado: Auto;
begin
  E.cargarEstacionamiento();
  lugar := E.conseguirLugar();

  //si hay lugar lo guarda en vector y lo muestra
  if lugar <> -1 then begin
    autoGuardado := E.guardarAuto(Patente.Text,horarioEntrada.Text,horarioSalida.Text,lugar);
    mostrarAuto(autoGuardado,lugar);
  end
  else begin
    memo1.Lines.Add('No hay lugar en el estacionamiento');
  end;

end;

//muestra en pantalla los datos del auto ingresado
procedure TForm1.mostrarAuto(autoGuardado: Auto; lugar: integer);
begin
  memo1.Lines.Add('Auto ingresado.');
  memo1.Lines.Add('Patente: ' + autoGuardado.patente);
  memo1.Lines.Add('Hora de ingreso: ' + autoGuardado.horarioEntrada);
  memo1.Lines.Add('Lugar en el estacionamiento: ' + (lugar+1).ToString);
  memo1.Lines.Add('-------------------------------------------');
end;

end.
