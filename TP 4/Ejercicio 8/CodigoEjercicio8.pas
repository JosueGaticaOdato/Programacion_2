unit CodigoEjercicio8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.DateUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Vcl.StdCtrls, Vcl.WinXPickers, Tipos, TADAgenda;

type
  TActividad = (AlmuerzoDeNegocios,AtenderCliente,AtenderClienteVIP,ReunionGerente);

  Activity = Record
    Nombre: TActividad;
    Indice: integer;
  End;

//Constantes del problema
const
  Maximo = 100;
  Un_Dia = 1440;
  Duraciones : Array [AlmuerzoDeNegocios..ReunionGerente]
    of Integer = (120,10,30,30);

type
  TForm1 = class(TForm)
    Actividad: TComboBox;
    Hora: TTimePicker;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Averiguar: TTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  //Creo la lista
  L: Agenda;

implementation

{$R *.dfm}


//Complejidad Algoritmica: Lineal (Asignar, Condicionales para saber contenido,
                                //agregar al final)
//Boton que agrega la actividad a la lista
procedure TForm1.Button1Click(Sender: TObject);
var X: TipoElemento;
  Apuntador: ^TDateTime;
  Contenido: Activity;
begin
  //Paso al clave y el valor 1, que seran la hora y la actividad
  X.Clave := Timetostr(Hora.Time);
  X.Valor1 := TActividad(Actividad.ItemIndex);
  New(Apuntador);
  //Segun cual sea la actividad, que cargara el tiempo que dura en el apuntador
  Apuntador^ := (Hora.Time + EncodeTime(Duraciones[TActividad(Actividad.ItemIndex)] DIV 60,
    Duraciones[TActividad(Actividad.ItemIndex)] MOD 60,0,0));
  //Paso el apuntador al valor 2
  X.Valor2 := Apuntador;
  //Agrego a la lista
  L.Agregar_agenda(X);
  memo1.Lines.Add('Actividad agregada!');
  //Ordeno segun tiempo (osea, la clave)
  L.Ordenar_Agenda;
end;

//Boton que muestra todos las actividades con sus horarios correspondientes
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add(L.Mostrar_Agenda);
end;

//Boton que me dice que actividad tiene que hacer a tal hora
procedure TForm1.Button3Click(Sender: TObject);
var Act: String;
begin
  //Llamo a la funcion actividad_empleado que me devuelve que actividad tiene que hacer,
  //le paso como parametros la lista y la hora correspondiente
  Act := L.Actividad_Empleado(Averiguar.Time);
  //Muestro en memo
  memo1.Lines.Add(TimetoStr(Averiguar.Time)+ '--->' + Act);
end;

//Boton que saca el porcentaje de ocupacion en el dia
procedure TForm1.Button4Click(Sender: TObject);
var Resultado: Integer;
  Porcentaje: Double;
begin
  //LLamo a la funcion Ocupacion que me devuelve la cantidad de minutos ocupados
  Resultado := L.Ocupacion;
  //Saco el porcentaje, dividiendo el resultado por el dia
  Porcentaje := Resultado/Un_Dia;
  memo1.Lines.Add('Ocupacion del dia: ' + Resultado.ToString + ' minutos');
  //Formateo el porcentaje
  memo1.Lines.Add(FormatFloat('0.##', Porcentaje) + '% del dia');
end;

//Creacion de la lista
procedure TForm1.FormCreate(Sender: TObject);
begin
  L.Crear();
  Memo1.Clear;
end;

end.
