unit ej6_Estacionamiento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, estacionamientoTAD, Vcl.StdCtrls,
  Vcl.ComCtrls, DateUtils;

const
  errorPatente = 'La patente no es correcta';
  errorEstacionamiento = 'No hay lugar en el estacionamiento';
  errorRepetido = 'Ese vehículo ya está estacionado';

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnGuardar: TButton;
    btnRetirar: TButton;
    Patente: TEdit;
    Label1: TLabel;
    autosGuardados: TButton;
    horarioEntrada: TEdit;
    Label2: TLabel;
    horarioSalida: TEdit;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    procedure btnGuardarClick(Sender: TObject);
    procedure mostrarAuto(autoGuardado: Auto; lugar: integer);
    procedure autosGuardadosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure btnRetirarClick(Sender: TObject);
  private
    E: Estacionamiento;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//muestra todos los autos guardados, lo hice para ver como solucionaba el problema de que siempre guarda en el mismo indice
procedure TForm1.autosGuardadosClick(Sender: TObject);
var cantidadAutos: integer;
begin
//  cantidadAutos := E.conseguirLugar();
  memo1.Lines.Add('La cantidad de autos estacionados es: ' + cantidadAutos.ToString);
end;

//botón guardar auto, llama a función que guarda en vector si hay lugar
procedure TForm1.btnGuardarClick(Sender: TObject);
var lugar: integer;
    autoGuardado: Auto;
    patenteCorrecta: boolean;
begin
  lugar := E.conseguirLugar();
  patenteCorrecta := E.validarPatente(Patente.Text);
  //si hay lugar lo guarda en vector y lo muestra
  if (lugar <> Error) and (patenteCorrecta = True) and (E.buscarPatenteRepetida(Patente.Text) = False) then
  begin
    autoGuardado := E.guardarAuto(Patente.Text,horarioEntrada.Text,horarioSalida.Text,lugar);
    mostrarAuto(autoGuardado,lugar);
  end
  else if patenteCorrecta = False then
  begin
    memo1.Lines.Add(errorPatente);
  end
  else if lugar = Error then
  begin
    memo1.Lines.Add(errorEstacionamiento);
  end
  else
  begin
    memo1.Lines.Add(errorRepetido);
  end;


end;

procedure TForm1.btnRetirarClick(Sender: TObject);
var patenteAuto: string;
    posicion: integer;
    encontro: boolean;
begin
  //guardo el input que escribe el usuario
  patenteAuto := Patente.Text;

  //guardo el resultado de buscar la patente
  encontro := E.buscarPatente(patenteAuto);

  if encontro = True then
  begin
    memo1.Lines.Add('Vehículo retirado.');
  end
  else
  begin
    memo1.Lines.Add('No se encontró un vehículo con esa patente.');
  end;
  //tomar una patente, buscar la patente en el vector y sacar del vector si esta la patente
  //calcular pago segun horario de salida
end;

//Manejo de fechas
procedure TForm1.DateTimePicker1Change(Sender: TObject);
var hEntrada: TDateTime;
    entradaFormateada: string;
    anio, mes, dia, hora, minutos: Word;
//formatear la fecha que pone el usuario
//hacer la cuenta sumando
begin
//
  hEntrada := DateTimePicker1.DateTime;
  DecodeDate(hEntrada,anio,mes,dia);
  16:00
  horarioEntrada.Text
  Memo1.Lines.Add( 'Día: ' + IntToStr( dia ) );
  Memo1.Lines.Add( 'Mes: ' + IntToStr( mes ) );
  Memo1.Lines.Add( 'Año: ' + IntToStr(anio ) );

//  entradaFormateada := FormatDateTime('hhnn:ssd/m/yyyy ', hEntrada);
 // memo1.Lines.Add(entradaFormateada);
//6/5/2021 20:10:59
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   E.cargarEstacionamiento();
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

//muestra en pantalla los datos del auto ingresado
procedure TForm1.mostrarAuto(autoGuardado: Auto; lugar: integer);
begin
  memo1.Lines.Add('Auto ingresado.');
  memo1.Lines.Add('Patente: ' + autoGuardado.patente);
  memo1.Lines.Add('Hora de ingreso: ' + autoGuardado.horarioEntrada);
  //memo1.Lines.Add('Lugar en el estacionamiento: ' + (lugar).ToString);
  memo1.Lines.Add('-------------------------------------------');
end;

end.
