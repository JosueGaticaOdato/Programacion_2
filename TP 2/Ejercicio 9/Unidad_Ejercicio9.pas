unit Unidad_Ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Math, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADCajaRegistradora,
  Vcl.ExtCtrls;

Const
  Cantidad_Billetes = 15;

type
   Enumerado = (Cantidad_001,Cantidad_005,Cantidad_010,Cantidad_025,Cantidad_050,Cantidad_1,Cantidad_2,Cantidad_5,Cantidad_10,Cantidad_20,Cantidad_50,Cantidad_100,Cantidad_200,Cantidad_500,Cantidad_1000);

  TEjercicio9 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    BtnBilletes: TButton;
    Carga_Billlete: TEdit;
    CantidadB: TEdit;
    btnSaldo: TButton;
    Valor_Compra: TEdit;
    Label3: TLabel;
    btnVuelto: TButton;
    Label5: TLabel;
    uncenta: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    veinte: TLabel;
    cincuenta: TLabel;
    cien: TLabel;
    doscientos: TLabel;
    quinientos: TLabel;
    mil: TLabel;
    diezcenta: TLabel;
    Label16: TLabel;
    veinticincocenta: TLabel;
    cincuentacenta: TLabel;
    un: TLabel;
    dos: TLabel;
    cinco: TLabel;
    Cantidad_10: TEdit;
    Cantidad_20: TEdit;
    Cantidad_50: TEdit;
    Cantidad_100: TEdit;
    Cantidad_200: TEdit;
    Cantidad_500: TEdit;
    Cantidad_1000: TEdit;
    Cantidad_005: TEdit;
    Cantidad_001: TEdit;
    Cantidad_010: TEdit;
    Cantidad_025: TEdit;
    Cantidad_050: TEdit;
    Cantidad_1: TEdit;
    Cantidad_2: TEdit;
    Cantidad_5: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    diez: TLabel;
    procedure BtnBilletesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaldoClick(Sender: TObject);
    procedure btnVueltoClick(Sender: TObject);
  private
    { Private declarations }
  public
    //Defino el TAD ya que necesito que se guarden los valores
    //de los billetes y las monedas, lo mismo que su cantidad
    Caja : CajaRegistradora;
  end;

var
  Ejercicio9: TEjercicio9;

implementation

{$R *.dfm}

//Carga de billete
procedure TEjercicio9.BtnBilletesClick(Sender: TObject);
var
  Billete: Real;
  Cantidad: Integer;
  Se_Cargo: Boolean;
begin
  //Cargo en una variable la cantidad y en la otra el billete
  Billete := strtofloat(Carga_Billlete.Text);
  Cantidad := strtoint(CantidadB.Text);
  //Utilizo la funcion cargar billete que realiza la carga y devuelve un boolean
  Se_Cargo := Caja.Cargar_Billetes(Billete,Cantidad);
  if not(Se_Cargo) then
    begin
      //Si es falso, quiere decir que cargo el billete
      if Billete >= 10 then
        begin
        memo1.Lines.Add('');
        memo1.Lines.Add('Billete de ' + floattostr(Billete)+ ' pesos cargado exitosamente!');
        end
      else
      begin
        memo1.Lines.Add('');
        memo1.Lines.Add('Moneda de ' + floattostr(Billete) + ' pesos cargado exitosamente!');
      end;

    end
  else
    begin
      //Si es verdad, quiere decir que el billete no se cargo ya que no existe
      memo1.Lines.Add('');
      memo1.Lines.Add('Ese billete no existe')
    end;
end;

//Consulta de saldo
procedure TEjercicio9.btnSaldoClick(Sender: TObject);
var Total: Extended;
  i : Integer;
begin
  memo1.Clear;
  //Uso la funcion estado y saldo para saber el total en la caja registradora
  Total := Caja.EstadoYSaldo();
  memo1.Lines.Add('El total entre todos los billetes y monedas es ' + Total.ToString + ' pesos.');
  memo1.Lines.Add('Cantidades:');
  //Para saber las cantidad, recorro el vector billetes y cantidad
  memo1.Lines.Add('');
  memo1.Lines.Add('Monedas:');
  i := 1;
  while (i < Length(Billetes)) and (Caja.Devuelve_billete(i) < 10) do
    begin
      memo1.Lines.Add('.Moneda de ' + FloatToStr(Caja.Devuelve_billete(i)) + ' pesos: ' + Caja.Devuelve_cantidad_billete(i).ToString);
      i := i + 1;
    end;
  memo1.Lines.Add('');
  memo1.Lines.Add('Billete:');
  while (i <= Length(Billetes)) and (Caja.Devuelve_billete(i) >= 10) do
    begin
      memo1.Lines.Add('.Billete de ' + FloatToStr(Caja.Devuelve_billete(i)) + ' pesos: ' + Caja.Devuelve_cantidad_billete(i).ToString);
      i := i + 1;
    end;
  memo1.Lines.Add('');
end;

//VUELTO
procedure TEjercicio9.btnVueltoClick(Sender: TObject);
var Plata_Cliente: CajaRegistradora;
    Total_Plata_Cliente, Compra: Real;
    i: Integer;
    Diferencia: Real;
    Vector: Vector_Vuelto;
    texto: String;
begin
  //Cargo en el TAD los valores que manda el usuario
  Plata_Cliente.Carga_Billetes_Cliente(Cantidad_001.Text,Cantidad_005.Text,Cantidad_010.Text,Cantidad_025.Text,Cantidad_050.Text,Cantidad_1.Text,Cantidad_2.Text,Cantidad_5.Text,Cantidad_10.Text,Cantidad_20.Text,Cantidad_50.Text,Cantidad_100.Text,Cantidad_200.Text,Cantidad_500.Text,Cantidad_1000.Text);

  //Paso lo que compro a una variable
  Compra := strtofloat(Valor_Compra.Text);
  //Calculo el total de lo que va a pagar el Cliente
  Total_Plata_Cliente := Plata_Cliente.EstadoYSaldo();

  //Saco la diferencia
  Diferencia := Total_Plata_Cliente - Compra;

  //Si es 0 quiere decir pago exacto
  if Diferencia = 0 then
  begin
    memo1.Lines.Add('No hay diferencia, el cliente pago lo mismo que lo cobrado');
    Caja.Cargar_Plata_Cliente(Plata_Cliente);
  end
  //Si es menor quiere decir que el cliente le falta pagar
  else if Diferencia < 0 then
  begin
    memo1.Lines.Add('El cliente no pago con lo suficiente');
  end
  else //Si paga de mas, calculo vuelto
  begin
    //Guardo la plata que me da el cliente a la caja
    Caja.Cargar_Plata_Cliente(Plata_Cliente);

    //Paso el vector que contiene el vuelto
    Vector := Caja.Calcular_Vuelta(Diferencia);

    //Obtengo el texto que contiene el dinero que le voy a devolver al usuario
    //con los billetes y cantidades
    Texto := Caja.Mostrar_Vuelto(Vector,Diferencia);
    //Muestro en memo
    memo1.Lines.Add(Texto);
  end;
end;

procedure TEjercicio9.FormCreate(Sender: TObject);
begin
  //Limpio el memo
  memo1.Clear;
  memo1.Lines.Add('Bienvenido a la caja Registradora');
  //Defino los tipos de billetes y monedas vigentes en los vectores
  Caja.Determinar_billetes_monedas();
end;

end.
