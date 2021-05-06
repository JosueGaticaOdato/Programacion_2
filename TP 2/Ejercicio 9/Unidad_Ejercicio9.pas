unit Unidad_Ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Math, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADCajaRegistradora,
  Vcl.ExtCtrls;

type
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
    diezpesos: TEdit;
    veientepesos: TEdit;
    cincuentapesos: TEdit;
    cienpesos: TEdit;
    doscientospesos: TEdit;
    quinientospesos: TEdit;
    milpesos: TEdit;
    cincocentavos: TEdit;
    uncentavo: TEdit;
    diezcentavos: TEdit;
    veinticincocentavos: TEdit;
    cincuentacentavos: TEdit;
    unpeso: TEdit;
    dospesos: TEdit;
    cincopesos: TEdit;
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

{procedure Carga_Plata_Cliente(Plata_C : CajaRegistradora;);
var Uno: TLabel;
begin
end;}


//Carga de billete
procedure TEjercicio9.BtnBilletesClick(Sender: TObject);
var
  Billete, Cantidad: Integer;
  Se_Cargo: Boolean;
begin
  //Cargo en una variable la cantidad y en la otra el billete
  Billete := strtoint(Carga_Billlete.Text);
  Cantidad := strtoint(CantidadB.Text);
  //Utilizo la funcion cargar billete que realiza la carga y devuelve un boolean
  Se_Cargo := Caja.Cargar_Billetes(Billete,Cantidad);
  if not(Se_Cargo) then
    begin
      //Si es falso, quiere decir que cargo el billete
      if Billete >= 10 then
        begin
        memo1.Lines.Add('');
        memo1.Lines.Add('Billete de ' + Billete.ToString + ' pesos cargado exitosamente!');
        end
      else
      begin
        memo1.Lines.Add('');
        memo1.Lines.Add('Moneda de ' + Billete.ToString + ' pesos cargado exitosamente!');
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

end;

procedure TEjercicio9.btnVueltoClick(Sender: TObject);
var i: Integer;
  Plata_Cliente: CajaRegistradora;
  Total_Plata_Cliente: Real;
  Compra: Integer;
begin
  Plata_Cliente.Cargar_Billetes(i,strtoint(diezpesos.Text));
  Compra := strtoint(Valor_Compra.Text);
  Total_Plata_Cliente := Plata_Cliente.EstadoYSaldo;
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
