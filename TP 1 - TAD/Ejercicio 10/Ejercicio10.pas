unit Ejercicio10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, TADTarjetaDeCredito;

type
  TForm1 = class(TForm)
    Tarjeta: TEdit;
    Button1: TButton;
    Fecha: TDateTimePicker;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  MiTarjeta: Tarjeta;

implementation

{$R *.dfm}

//Boton para cargar y comprobar si la tarjeta es valida
procedure TForm1.Button1Click(Sender: TObject);
var isValida: boolean;
begin
  MiTarjeta.cargarTarjeta(Strtoint(Tarjeta.Text),Fecha.Date);
    isValida := MiTarjeta.validarNro;
    if isValida then
    begin
      memo1.Lines.Add('Es valida');
    end
    else
    begin
      memo1.Lines.Add('No es valida');
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add(('La entidad de la tarjeta es: ' +MiTarjeta.EntidadEmisora()));
end;

end.
