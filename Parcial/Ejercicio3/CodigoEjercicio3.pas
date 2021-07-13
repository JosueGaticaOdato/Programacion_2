unit CodigoEjercicio3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos,
  //QueuesArrayNCMejorada;
  //QueuesCursor;
  QueuesPointer;

const
  Tamaño = 5;
  Min = 1;
  Max = 20;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    Queues : Cola;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//Complejidad O(N) Lineal
//.Creacion y inicializacion de las variables
//.Se toma el primer valor antes de que inicie la interacion, luego Desencolo del principal
//.Mientras no este vacia la cola:
//.Recupero el elemento del frente
//.Lo comparo con el anterior y si es mayor encolo, y cambio la asignacion de X
//.Si no es mayor, corte ahi la cola auxiliar
//.Comparo con la cantidad de elementos del mayor, si le gana esta nueva cola pasara a ser la mayor
//.Sino es asi, la vuelvo 0 y arranco denuevo
//.Al final de cada ciclo desencolo del principal
//.Devuelvo la cantidad de elementos de la cola mayor

function Longitud(Q: Cola):Integer;
var AUX1,Mayor: Cola;
  X,Y: TipoElemento;
  ContadorAUX1, ContadorMayor: Integer;
begin
  AUX1.Crear(Numero,Tamaño);
  ContadorAUX1 := 1;
  ContadorMayor := 1;
  Mayor.Crear(Numero,Tamaño);
  X := Q.Recuperar;
  AUX1.Encolar(X);
  Q.DesEncolar;
  while not Q.EsVacia do
  begin
    Y := Q.Recuperar;
    if ContadorAUX1 <> 0 then
    begin
      if X.Clave < Y.Clave then
      begin
        AUX1.Encolar(Y);
        X.Clave := Y.Clave;
        ContadorAUX1 := ContadorAUX1 + 1;
      end
      else
      begin
        if ContadorAUX1 >= ContadorMayor then
        begin
          Mayor := AUX1;
          ContadorMayor := ContadorAUX1;
          ContadorAUX1 := 0;
        end;
      end;
    end
    else
    begin
      X.Clave := Y.Clave;
      ContadorAUX1 := ContadorAUX1 + 1;
      AUX1.Encolar(X);
    end;
    Q.DesEncolar;
  end;
  Result := ContadorMayor;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Queues.LLenarClavesRandom(Tamaño,Min,Max);
  memo1.Lines.Add('Cola cargada');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Clear;
  memo1.Lines.Add(Queues.RetornarClaves);
end;

procedure TForm1.Button3Click(Sender: TObject);
var Resultado: Integer;
begin
  Resultado := Longitud(Queues);
  memo1.Lines.Add('Resultado: ' + Resultado.ToString);
end;

end.
