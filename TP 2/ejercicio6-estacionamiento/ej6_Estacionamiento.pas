unit ej6_Estacionamiento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, estacionamientoTAD, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Patente: TEdit;
    Label1: TLabel;
    autosGuardados: TButton;
    procedure Button1Click(Sender: TObject);
//    procedure autosGuardadosClick(Sender: TObject);
    procedure mostrarAuto(lugar: integer);
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
//procedure TForm1.autosGuardadosClick(Sender: TObject);
//var Autos : array[min..max] of Auto;
//    I: integer;
//begin
//  Autos := AutosGuardados();
//  for I := min to max do begin
//    mostrarAuto(I);
//  end;
//
//end;

procedure TForm1.Button1Click(Sender: TObject);
var E: Estacionamiento;
    lugar: integer;
begin
  E.cargarEstacionamiento();
  lugar := E.conseguirLugar();
  if lugar <> -1 then begin
    E.guardarAuto(Patente.Text,DateTimeToStr(now),' ',lugar);
    mostrarAuto(lugar);
  end
  else begin
    memo1.Lines.Add('No hay lugar en el estacionamiento');
  end;

end;

procedure TForm1.mostrarAuto(lugar: integer);
begin
  memo1.Lines.Add('Auto ingresado.');
  memo1.Lines.Add('Patente: ' + Patente.Text);
  memo1.Lines.Add('Hora de ingreso: ' + DateTimeToStr(now));
  memo1.Lines.Add('Lugar en el estacionamiento: ' + (lugar+1).ToString);
  memo1.Lines.Add('-------------------------------------------');
end;

end.
