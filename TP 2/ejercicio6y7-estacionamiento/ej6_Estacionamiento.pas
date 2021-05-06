unit ej6_Estacionamiento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, estacionamientoTAD, Vcl.StdCtrls,
  Vcl.ComCtrls, DateUtils, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, Vcl.WinXPickers;

const
  errorPatente = 'La patente no es correcta';
  errorEstacionamiento = 'No hay lugar en el estacionamiento';
  errorRepetido = 'Ese vehículo ya está estacionado';
  errorEncontrado = 'No se encontró un vehículo con esa patente.';
  errorFechaSal = 'La fecha de salida ingresada es anterior a la fecha de entrada';
  errorFechaEnt = 'La fecha de entrada ingresada es posterior a la fecha de salida';

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnGuardar: TButton;
    btnRetirar: TButton;
    Patente: TEdit;
    Label1: TLabel;
    autosGuardados: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Fecha_Entrada: TDateTimePicker;
    Label4: TLabel;
    Button1: TButton;
    Fecha_Salida: TDateTimePicker;
    Label5: TLabel;
    horaEntrada: TTimePicker;
    horaSalida: TTimePicker;
    procedure btnGuardarClick(Sender: TObject);
    procedure mostrarAuto(autoGuardado: Auto; lugar: integer; Fecha: TDate);
    procedure autosGuardadosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Fecha_EntradaChange(Sender: TObject);
    procedure btnRetirarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

//botón GUARDAR auto, llama a función que guarda en vector si hay lugar
procedure TForm1.btnGuardarClick(Sender: TObject);
var lugar: integer;
    autoGuardado: Auto;
    patenteCorrecta, horaEntCorrecta, fechaCorrecta: boolean;
    horarioEntrada, horarioSalida: TTime;
    Fecha: TDate;
begin
  Fecha:= Fecha_Entrada.Date;

  horarioEntrada := horaEntrada.Time;
  horarioSalida := horaSalida.Time;

  lugar := E.conseguirLugar();
  patenteCorrecta := E.validarPatente(Patente.Text);
  //si hay lugar lo guarda en vector y lo muestra
  if (lugar <> Error) and (patenteCorrecta = True) and (E.buscarPatenteRepetida(Patente.Text) = False) then
  begin
    autoGuardado := E.guardarAuto(Patente.Text,timeToStr(horarioEntrada),timeToStr(horarioSalida),lugar);
    mostrarAuto(autoGuardado,lugar, Fecha);
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

//RETIRAR
procedure TForm1.btnRetirarClick(Sender: TObject);
var patenteAuto: string;
    posicion: integer;
    horaSalCorrecta, fechaCorrecta: boolean;
    fechaSalida: TDate;
    hSalida: TTime;
begin
  hSalida := horaSalida.Time;

  fechaCorrecta := False;
  fechaSalida := Fecha_Salida.Date;
  if (fechaSalida - Fecha_Entrada.Date) >= 0 then
  begin
    fechaCorrecta := True;
  end;

  //guardo el input que escribe el usuario
  patenteAuto := Patente.Text;

  //guardo el resultado de buscar la patente
  posicion := E.buscarPatente(patenteAuto);

  if (posicion <> Error) and (horaSalCorrecta) and (fechaCorrecta) then
  begin
    E.sacarAuto(posicion);
    memo1.Lines.Add('Vehículo retirado.');
  end
  else if posicion = Error then
  begin
    memo1.Lines.Add(errorEncontrado);
  end
  else
  begin
    memo1.Lines.Add(errorFechaSal);
  end;

  //tomar una patente, buscar la patente en el vector y sacar del vector si esta la patente
  //calcular pago segun horario de salida
end;

procedure TForm1.Button1Click(Sender: TObject);
var Dia1, Dia2: TDateTime;
    dif: double;
    hEntrada, hSalida: string;
begin
  // Set up our date variables

  Dia1 := Fecha_Entrada.Date;
  Dia2 := Fecha_Salida.Date;
  dif := Dia2 - Dia1;


  // Display these dates and the days between them
  memo1.Lines.Add('From date = '+DateTimeToStr(Dia1));
  memo1.Lines.Add('To   date = '+DateTimeToStr(Dia2));
  memo1.Lines.Add('Fractional days difference = '+
            FloatToStr(DaySpan(Dia2, Dia1))+' days');
end;
//Manejo de fechas
procedure TForm1.Fecha_EntradaChange(Sender: TObject);
var hEntrada: TDateTime;
    entradaFormateada: string;
    anio, mes, dia, hora, minutos: Word;
//formatear la fecha que pone el usuario
//hacer la cuenta sumando
begin;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   E.cargarEstacionamiento();
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

//muestra en pantalla los datos del auto ingresado
procedure TForm1.mostrarAuto(autoGuardado: Auto; lugar: integer; Fecha: TDate);
begin
  memo1.Lines.Add('Auto ingresado.');
  memo1.Lines.Add('Patente: ' + autoGuardado.patente);
  memo1.Lines.Add('Hora de ingreso: ' + autoGuardado.horarioEntrada);
  memo1.Lines.Add('Fecha de ingreso: ' + datetostr(Fecha));
  memo1.Lines.Add('-------------------------------------------');
end;

end.
