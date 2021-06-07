unit CodigoEjercicio8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Vcl.StdCtrls, Vcl.WinXPickers, Tipos,
  ListArray;
  //ListCursor;
  //ListPointer,

const
  Maximo = 100;
  Almuerzo_de_negocios = 2; //120 min equivalen a 2 horas
  Atender_cliente = 10;
  Atender_cliente_VIP = 30;
  Reunion_gerente = 30;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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

//function Carga(L1: Lista): String;
//var Cont: String;
//begin
//  Cont := L.RetornarClaves;
//  Carga := Cont;
//end;

function Actividad(L1: Lista; Hora: TDateTime): String;
var X: TipoElemento;
  P: PosicionLista;
  Bandera: Boolean;
  Hora_inicio, Hora_fin: TDateTime;
  Devolucion: String;
begin
  Devolucion := 'Libre';
  P := L.Comienzo;
  Bandera := True;
  while (P <> Nulo) and (Bandera) do
  begin
    X := L.Recuperar(P);
    Hora_inicio := X.Valor1;
    //Hora_Fin := (X.Valor2)^;
    if (Hora > Hora_inicio) and (Hora < Hora_Fin) then
    begin
      Devolucion := X.Valor1;
      Bandera := False;
    end
    else
    begin
      P := L.Siguiente(P);
    end;
  end;
  Actividad := Devolucion;
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
//var C: String;
begin
  //C := Carga(L);
  memo1.Lines.Add(L.RetornarClaves);
end;

procedure TForm1.Button3Click(Sender: TObject);
var Act: String;
begin
  Act := Actividad(L,Averiguar);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  L.Crear(Cadena,Maximo);
end;

end.
