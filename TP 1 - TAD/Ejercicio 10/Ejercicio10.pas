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
    Button3: TButton;
    Valor: TEdit;
    Button4: TButton;
    Cuotas: TCheckBox;
    CantCuotas: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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

//Boton para obtener la entidad de la tarjeta
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add(('La entidad de la tarjeta es: ' +MiTarjeta.getEntidadEmisora()));
end;

//Boton para mostrar los limites de compras
procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add('Limites');
  memo1.Lines.Add(MiTarjeta.MostrarLimites());
end;

//Boton para realizar una compra
procedure TForm1.Button4Click(Sender: TObject);
begin
  if Cuotas.Checked then //Checked para ver si el usuario pagara en cuotas o no
  begin
    memo1.Lines.Add('COMPRA EN CUOTAS');
  end
  else
  begin
    memo1.Lines.Add('COMPRA EN 1 SOLA CUOTA');
  end;
  memo1.Lines.Add('Valor: ' + Valor.Text);
  memo1.Lines.Add('Cantidad de cuotas: ' + CantCuotas.Text);
  if miTarjeta.Comprar(strtoint(Valor.Text), strtoint(CantCuotas.Text), Cuotas.Checked) then
  begin
    memo1.Lines.Add('Compra realiza con exito');
    memo1.Lines.Add('Limites actualizados');
    memo1.Lines.Add(MiTarjeta.MostrarLimites());
  end
  else
  begin
    memo1.lines.add('No se pudo realizar la compra.');
  end;
end;

end.
