unit CodigoEjercicio8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.DateUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Vcl.StdCtrls, Vcl.WinXPickers, Tipos,
  //ListArray;
  //ListCursor;
  ListPointer;

//Constantes del problema
const
  Maximo = 100;
  Almuerzo_de_negocios = 2; //120 min equivalen a 2 horas
  Almuerzo_de_negocios_hrs = 120;
  Atender_cliente = 10;
  Atender_cliente_VIP = 30;
  Reunion_gerente = 30;
  Un_Dia = 1440;

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
  L: Lista;

implementation

{$R *.dfm}

//Funcion que devuelve en minutos el tiempo de ocupacion
function Ocupacion(L1:Lista):Integer;
var Sumador: Integer;
  X: TipoElemento;
  P: PosicionLista;
  Hora_inicio: TTime;
  Puntero: ^TTime;
begin
  //Inicializo el sumador y la posicion
  Sumador := 0;
  P := L1.Comienzo;
  //Mientras no sea una posicion que no exista
  while P <> Nulo do
  begin
    //Recupero el TE de la posicion
    X := L1.Recuperar(P);
    //Consulto cual actividad es, y segun la que sea
    //la sumo en el sumador
    if X.Valor1 = 'Almuerzo de negocios' then
    begin
      Sumador := Sumador + Almuerzo_de_negocios_hrs;
    end
    else if X.Valor1 = 'Atender cliente' then
    begin
      Sumador := Sumador + Atender_cliente;
    end
    else if X.Valor1 = 'Atender cliente VIP' then
    begin
      Sumador := Sumador + Atender_cliente_VIP;
    end
    else
    begin
      Sumador := Sumador + Reunion_gerente;
    end;
  //Busco el siguiente de P
  P := L.Siguiente(P);
  end;
  //Devuelvo el total de minutos
  Result := Sumador;
end;

//Funcion que me devuelve que actividad tiene que hacer a esa hora
function Actividad_Empleado(L1: Lista; Hora: TTime): String;
var X: TipoElemento;
  P: PosicionLista;
  Bandera: Boolean;
  Hora_inicio: TTime;
  Puntero: ^TTime;
  Devolucion: String;
begin
  //Devolucion es el string que devolvere, sera libre en caso de que
  //no tenga que hacer nada
  Devolucion := 'Libre';
  //Inicializo Posicion y Bandera
  P := L.Comienzo;
  Bandera := True;
  //Mientras P no sea una posicion no valida y no halla encontrado el valor
  while (P <> Nulo) and (Bandera) do
  begin
    //Recupero en esa posicion
    X := L.Recuperar(P);
    Hora_inicio := StrToTime(X.Clave);
    Puntero := X.Valor2;
    //Si la hora dada se encuentra en ese lapso
    if (Hora > Hora_inicio) and (Hora < Puntero^) then
    begin
      //Devuelve la actividad que tiene que hacer
      Devolucion := X.Valor1;
      //La bandera quiere decir que ya lo encontre
      Bandera := False;
    end
    else
    begin
      //Tomo el siguiente en caso de no encontrar
      P := L.Siguiente(P);
    end;
  end;
  //Devuelve la actividad
  Result := Devolucion;
end;

//Boton que agrega la actividad a la lista
procedure TForm1.Button1Click(Sender: TObject);
var X: TipoElemento;
  Apuntador: ^TDateTime;
begin
  //Paso al clave y el valor 1, que seran la hora y la actividad
  X.Clave := Timetostr(Hora.Time);
  X.Valor1 := Actividad.Text;
  New(Apuntador);
  //Segun cual sea la actividad, que cargara el tiempo que dura en el apuntador
  if Actividad.Text = 'Almuerzo de negocios' then
  begin
    Apuntador^ := (Hora.Time + EncodeTime(Almuerzo_de_negocios,0,0,0));
  end
  else if Actividad.Text= 'Atender cliente' then
  begin
    Apuntador^ := (Hora.Time + EncodeTime(0,Atender_cliente,0,0));
  end
  else if Actividad.Text = 'Atender cliente VIP' then
  begin
    Apuntador^ := (Hora.Time + EncodeTime(0,Atender_cliente_VIP,0,0));
  end
  else
  begin
    Apuntador^ := (Hora.Time + EncodeTime(0,Reunion_gerente,0,0));
  end;
  //Paso el apuntador al valor 2
  X.Valor2 := Apuntador;
  //Agrego a la lista
  L.Agregar(X);
  memo1.Lines.Add('Actividad agregada!');
  //Ordeno segun tiempo (osea, la clave)
  L.Sort(True);
end;

//Boton que muestra todos las actividades con sus horarios correspondientes
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add(L.RetornarClaves);
end;

//Boton que me dice que actividad tiene que hacer a tal hora
procedure TForm1.Button3Click(Sender: TObject);
var Act: String;
begin
  //Llamo a la funcion actividad_empleado que me devuelve que actividad tiene que hacer,
  //le paso como parametros la lista y la hora correspondiente
  Act := Actividad_Empleado(L,Averiguar.Time);
  //Muestro en memo
  memo1.Lines.Add(TimetoStr(Averiguar.Time)+ '--->' + Act);
end;

//Boton que saca el porcentaje de ocupacion en el dia
procedure TForm1.Button4Click(Sender: TObject);
var Resultado: Integer;
  Porcentaje: Double;
begin
  //LLamo a la funcion Ocupacion que me devuelve la cantidad de minutos ocupados
  Resultado := Ocupacion(L);
  //Saco el porcentaje, dividiendo el resultado por el dia
  Porcentaje := Resultado/Un_Dia;
  //Muestro los minutos y el porcentaje en el memo
  memo1.Lines.Add('Ocupacion del dia: ' + Resultado.ToString + ' minutos');
  //Formateo el porcentaje
  memo1.Lines.Add(FormatFloat('0.##', Porcentaje) + '% del dia');
end;

//Creacion de la lista
procedure TForm1.FormCreate(Sender: TObject);
begin
  //Creo la lista con un maximo determinado
  L.Crear(Cadena,Maximo);
  Memo1.Clear;
end;

end.
