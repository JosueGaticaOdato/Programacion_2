unit ej6_Estacionamiento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, estacionamientoTAD, Vcl.StdCtrls,
  Vcl.ComCtrls, DateUtils, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, Vcl.WinXPickers;

const
  //Constates de errores
  errorPatente = 'La patente no es correcta';
  errorEstacionamiento = 'No hay lugar en el estacionamiento';
  errorRepetido = 'Ese vehículo ya está estacionado';
  errorEncontrado = 'No se encontró un vehículo con esa patente.';
  errorFechaSal = 'La fecha de salida ingresada es anterior a la fecha de entrada';
  errorFechaEnt = 'La fecha de entrada ingresada es posterior a la fecha de salida';

type
  TEjercicico6y7 = class(TForm)
    Memo1: TMemo;
    btnGuardar: TButton;
    btnRetirar: TButton;
    Patente: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Fecha_Entrada: TDateTimePicker;
    Label4: TLabel;
    Fecha_Salida: TDateTimePicker;
    Label5: TLabel;
    horaEntrada: TTimePicker;
    horaSalida: TTimePicker;
    Label6: TLabel;
    Fecha_a_Percibir: TDateTimePicker;
    Label7: TLabel;
    BtnPercibir: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BtnRangoFechas: TButton;
    procedure btnGuardarClick(Sender: TObject);
    procedure mostrarAutoIngresado(lugar: integer);
    procedure FormCreate(Sender: TObject);
    procedure btnRetirarClick(Sender: TObject);
    procedure BtnPercibirClick(Sender: TObject);
    procedure BtnRangoFechasClick(Sender: TObject);
  private
    //Se define el TAD dentro del formulario de forma privada
    E: Estacionamiento;
  public

  end;

var
  Ejercicico6y7: TEjercicico6y7;

implementation

{$R *.dfm}

//botón GUARDAR auto, llama a función que guarda en vector si hay lugar
procedure TEjercicico6y7.btnGuardarClick(Sender: TObject);
//Defino las variables
var lugar: integer;
    patenteCorrecta, horaEntCorrecta: boolean;
    horarioEntrada: TTime;
    Fecha: TDate;
begin
  //Guardo en una variable la fecha y el horario que se implementan en el formulario
  Fecha := Fecha_Entrada.Date;
  horarioEntrada := horaEntrada.Time;

  //LLamo la funcion conseguir lugar, que me devuelve una posicion libre
  //para guardar el auto. Si no hay lugar, devuelve Error ( que es -1 )
  lugar := E.conseguirLugar();
  //LLamo a la funcion para valir la patente, que devuelve verdadera si la patente es correcta
  patenteCorrecta := E.validarPatente(Patente.Text);
  //si hay lugar lo guarda en vector y lo muestra
  if (lugar <> Error) and (patenteCorrecta = True) and (E.buscarPatenteRepetida(Patente.Text) = False) then
  begin
    E.guardarAuto(Patente.Text,horarioEntrada,Fecha,lugar);
    mostrarAutoIngresado(lugar);
  end
  //En caso de que no se cumple alguno de los requisitos, se mostrar el error
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


procedure TEjercicico6y7.BtnPercibirClick(Sender: TObject);
var Texto: String;
begin
  memo1.Clear;
  Texto := E.Mostrar_Contenido_Fecha(Fecha_a_percibir.DateTime);
  memo1.Lines.Add(Texto);
end;

procedure TEjercicico6y7.BtnRangoFechasClick(Sender: TObject);
begin

end;

//RETIRAR AUTO
procedure TEjercicico6y7.btnRetirarClick(Sender: TObject);
var patenteAuto, salida: string;
    posicion: integer;
    fechaCorrecta, patenteCorrecta: boolean;
    fechaSalida: TDateTimePicker;
    tarifa: double;
begin
  //Paso como una concatenacion de string la fecha y la hora, para luego
  //utilizarlo en la resta
  salida := DateToStr(Fecha_Salida.DateTime) + ' ' + TimeToStr(horaSalida.Time);
  //Valido si las fechas son correctas
  fechaCorrecta := False;
  //Si la fecha de salida es menor a la de entrada, quiere decir que hay un problema
  if (fecha_Salida.Date - Fecha_Entrada.Date) >= 0 then
  begin
    //Si las fechas son correctas devuelve true
    fechaCorrecta := True;
  end;

  //guardo el input que escribe el usuario
  patenteAuto := Patente.Text;
  //Llamo a validar patente para indicar que sea correcta
  patenteCorrecta := E.validarPatente(Patente.Text);
  //guardo el resultado de buscar la patente, si no encuentra nada devuelve error
  posicion := E.buscarPatente(patenteAuto);


  //Si las tres condiciones se cumplen, se procede a retirar el vehiculo y indicar la tarifa
  if (posicion <> Error) and (fechaCorrecta)and (patenteCorrecta)  then
  begin
    //Saco el auto del estacionamiento
    E.sacarAuto(posicion);
    memo1.Lines.Add('Vehículo retirado.');
    //Calculo la tarifa, pasando la posicion y fecha-hora de salida
    tarifa := E.calcularPago(posicion, strToDateTime(salida));
    memo1.Lines.Add('El dueño del vehiculo tiene que pagar ' + tarifa.ToString + ' pesos.');
  end
  else if posicion = Error then
  begin
    memo1.Lines.Add(errorEncontrado);
  end
  else if not patenteCorrecta then
  begin
    memo1.Lines.Add(errorPatente);
  end
  else
  begin
    memo1.Lines.Add(errorFechaSal);
  end;
end;

//Proceso que realiza la limpieza del memo y crea
//el formulario cuando inicia el programa
procedure TEjercicico6y7.FormCreate(Sender: TObject);
begin
   E.cargarEstacionamiento();
   Memo1.Clear;
end;

//Proceso que muestra el auto en el memo
procedure TEjercicico6y7.mostrarAutoIngresado(lugar: integer);
begin
  memo1.Lines.Add(E.mostrarAuto(lugar));
end;

end.
