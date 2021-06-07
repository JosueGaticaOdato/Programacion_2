unit CodigoEjercicio8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.DateUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Vcl.StdCtrls, Vcl.WinXPickers, Tipos,
  ListArray;
  //ListCursor;
  //ListPointer,

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
  L: Lista;

implementation

{$R *.dfm}

function Ocupacion(L1:Lista):Integer;
var Sumador: Integer;
  X: TipoElemento;
  P: PosicionLista;
  Hora_inicio: TTime;
  Puntero: ^TTime;
begin
  Sumador := 0;
  P := L1.Comienzo;
  while P <> Nulo do
  begin
    X := L1.Recuperar(P);
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
  P := L.Siguiente(P);
  end;
  Result := Sumador;
end;

function Actividad_Empleado(L1: Lista; Hora: TTime): String;
var X: TipoElemento;
  P: PosicionLista;
  Bandera: Boolean;
  Hora_inicio: TTime;
  Puntero: ^TTime;
  Devolucion: String;
begin
  Devolucion := 'Libre';
  P := L.Comienzo;
  Bandera := True;
  while (P <> Nulo) and (Bandera) do
  begin
    X := L.Recuperar(P);
    Hora_inicio := StrToTime(X.Clave);
    Puntero := X.Valor2;
    if (Hora > Hora_inicio) and (Hora < Puntero^) then
    begin
      Devolucion := X.Valor1;
      Bandera := False;
    end
    else
    begin
      P := L.Siguiente(P);
    end;
  end;
  Result := Devolucion;
end;

procedure TForm1.Button1Click(Sender: TObject);
var X: TipoElemento;
  Apuntador: ^TDateTime;
begin
  X.Clave := Timetostr(Hora.Time);
  X.Valor1 := Actividad.Text;
  New(Apuntador);
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
  X.Valor2 := Apuntador;
  L.Agregar(X);
  memo1.Lines.Add('Actividad agregada!');
  L.Sort(True);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add(L.RetornarClaves);
end;

procedure TForm1.Button3Click(Sender: TObject);
var Act: String;
begin
  Act := Actividad_Empleado(L,Averiguar.Time);
  memo1.Lines.Add(TimetoStr(Averiguar.Time)+ '--->' + Act);
end;

procedure TForm1.Button4Click(Sender: TObject);
var Resultado: Integer;
  Porcentaje: Double;
begin
  Resultado := Ocupacion(L);
  Porcentaje := Resultado/Un_Dia;
  memo1.Lines.Add('Ocupacion del dia: ' + Resultado.ToString + ' minutos');
  memo1.Lines.Add(FormatFloat('0.##', Porcentaje) + '% del dia');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  L.Crear(Cadena,Maximo);
end;

end.
