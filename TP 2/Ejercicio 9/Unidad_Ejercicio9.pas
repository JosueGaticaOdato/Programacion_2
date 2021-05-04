unit Unidad_Ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Math, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADCajaRegistradora;

type
  TEjercicio9 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    BtnBilletes: TButton;
    BtnMoneda: TButton;
    Carga_Moneda: TEdit;
    Carga_Billlete: TEdit;
    CantidadB: TEdit;
    btnSaldo: TButton;
    CantidadM: TEdit;
    Edit1: TEdit;
    Label3: TLabel;
    btnVuelto: TButton;
    procedure BtnBilletesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnMonedaClick(Sender: TObject);
    procedure btnSaldoClick(Sender: TObject);
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
      memo1.Lines.Add('');
      memo1.Lines.Add('Billete de ' + Billete.ToString + ' pesos cargado exitosamente!')
    end
  else
    begin
      //Si es verdad, quiere decir que el billete no se cargo ya que no existe
      memo1.Lines.Add('');
      memo1.Lines.Add('Ese billete no existe')
    end;
end;

//Carga de Moneda
procedure TEjercicio9.BtnMonedaClick(Sender: TObject);
var
  Moneda: Double;
  Cantidad: Integer;
  Se_Cargo: Boolean;
begin
  //Uso una variable para guardar el valor de la moneda y en la otra la cantidad
  Moneda := strtofloat(Carga_Moneda.Text);
  Cantidad := strtoint(CantidadM.Text);
  //Utilizo la funcion cargar moneda que me devuelve un booleano
  Se_Cargo := Caja.Cargar_Monedas(Moneda,Cantidad);
  if not(Se_Cargo) then
    begin
      //Si es falso quiere decir que se cargo la moneda
      memo1.Lines.Add('');
      memo1.Lines.Add('Moneda de ' + Moneda.ToString + ' pesos cargado exitosamente!')
    end
  else
    begin
      //Si es verdad quiere decir que la moneda es invalida
      memo1.Lines.Add('');
      memo1.Lines.Add('Esa moneda no existe')
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
  memo1.Lines.Add('Billetes:');
  //Para saber las cantidad de cada billete, recorro el vector apareados de billetes y cantidad
  for i := 1 to Max_Billete do
  begin
    //Uso devuelve billete para mostar el billete y devuelve cantidad para indicar cuantos
    //billetes de ese tipo existen
    memo1.Lines.Add('.Billete de ' + Caja.Devuelve_billete(i).ToString + ' pesos: ' + Caja.Devuelve_cantidad_billete(i).ToString);
  end;
  memo1.Lines.Add('');
  memo1.Lines.Add('Moneda:');
  //Recorro el vector de monedas y cantidad
  for i := 1 to Max_Moneda do
  begin
    //Uso devuelve moneda para mostar la moneda y devuelve cantidad para indicar cuantas
    //moneda de ese tipo existen
    //cada condicional es usado solamente para mostrar en vez de la palabra "peso", "centavo".
    if Caja.Devuelve_Moneda(i) > 1 then
      begin
        memo1.Lines.Add('.Moneda de ' + Caja.Devuelve_Moneda(i).ToString + ' pesos: ' + Caja.Devuelve_cantidad_moneda(i).ToString);
      end
    else if Caja.Devuelve_Moneda(i) = 1 then
      begin
      memo1.Lines.Add('.Moneda de ' + Caja.Devuelve_Moneda(i).ToString + ' peso: ' + Caja.Devuelve_cantidad_moneda(i).ToString);
      end
    else
    begin
      memo1.Lines.Add('.Moneda de ' + Caja.Devuelve_Moneda(i).ToString + ' centavos: ' + Caja.Devuelve_cantidad_moneda(i).ToString);
    end;
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
