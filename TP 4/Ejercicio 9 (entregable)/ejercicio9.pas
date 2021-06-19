unit ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADVehiculos, ListArray, ListCursor, ListPointer,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    EditPatente: TEdit;
    Label1: TLabel;
    opcionesEstados: TComboBox;
    fechaPicker: TDateTimePicker;
    EditImporte: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnTotal: TButton;
    Label5: TLabel;
    btnMayorCant: TButton;
    btnMayorDeuda: TButton;
    btnSinDeuda: TButton;
    editConsulta: TEdit;
    btnGuardar: TButton;
    btnMultaReciente: TButton;
    btnMultaAntigua: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnMultaAntiguaClick(Sender: TObject);
    procedure btnMultaRecienteClick(Sender: TObject);
    procedure btnMayorCantClick(Sender: TObject);
    procedure btnMayorDeudaClick(Sender: TObject);
    procedure btnSinDeudaClick(Sender: TObject);
  private
    { Private declarations }
    LV: Vehiculos;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation
{$R *.dfm}

////Generar una lista de lista que permita almacenar como clave la patente de un vehículo
//// (campo clave) y como valores de la clave las multas que se le realizaron a dicho
//// vehículo. Se debe guardar como datos de la multa el número de acta (campo clave),
////  la fecha y el importe (como valores), estado (Pendiente, Abonada, Anulada).
////
////Se pide:
////
////    Dado un vehículo determinar el total adeudado por multas, la multa más antigua
////    y la más reciente (comparable por las fechas).
////    ¿Cuál es el vehículo con mayor cantidad de infracciones?
////    ¿Cuál es el vehículo que más deuda de infracciones tiene?
////    ¿Existe algún vehículo/s que no tenga deuda de infracciones?

procedure TForm1.btnGuardarClick(Sender: TObject);
var seGuardo: Errores;
    Importe: integer;
begin
  if LV.validarPatente(EditPatente.Text) then begin
    seGuardo := LV.guardarAuto(EditPatente.Text);
    if (seGuardo = OK) or (seGuardo = ClaveDuplicada) then begin
      if seGuardo = OK then begin
        memo1.Lines.Add('El auto se guardó correctamente');
      end
      else begin
        memo1.Lines.Add('Ya hay un auto guardado con esa patente');
      end;

      if tryStrToInt(EditImporte.Text,Importe) then begin
        Importe := strToInt(EditImporte.Text);
        if LV.insertarMulta(EditPatente.Text,opcionesEstados.Text,Importe,FechaPicker.Date) = OK then begin
          memo1.Lines.Add('La multa se guardó correctamente');
        end
        else begin
          memo1.Lines.Add('No se guardó la multa');
        end;
      end
      else begin
          memo1.Lines.Add('No se ingresaron datos de multa o estos son incorrectos.');
      end;
      memo1.Lines.Add('Patentes: ');
      memo1.Lines.Add( LV.mostrarLista);
    end
    else begin
      memo1.Lines.Add('No se pudo ingresar el vehículo');
    end;
  end
  else begin
    memo1.Lines.Add('No se ingresaron datos de vehículo o estos son incorrectos.');
  end;
end;


procedure TForm1.btnMultaAntiguaClick(Sender: TObject);
var Multa: tipoElemento;
begin
  Multa := LV.fechaMulta(editConsulta.Text,true);
  if Multa.Valor1 = Vacia then begin
    memo1.Lines.Add('No hay un vehículo guardado con la patente ingresada');
  end
  else if Multa.Valor1 = CError then begin
    memo1.Lines.Add('El auto consultado no tiene multas');
  end
  else begin
    memo1.Lines.Add('La multa más antigüa es del ' + dateToStr(Multa.Clave));
  end;
end;

procedure TForm1.btnMultaRecienteClick(Sender: TObject);
var Multa: tipoElemento;
begin
  Multa := LV.fechaMulta(editConsulta.Text,false);
  if Multa.Valor1 = Vacia then begin
    memo1.Lines.Add('No hay un vehículo guardado con la patente ingresada');
  end
  else if Multa.Valor1 = CError then begin
    memo1.Lines.Add('El auto consultado no tiene multas');
  end
  else begin
    memo1.Lines.Add('La multa más reciente es del ' + dateToStr(Multa.Clave));
  end;
end;

procedure TForm1.btnTotalClick(Sender: TObject);
var Deuda: integer;
begin
  Deuda := LV.totalMultas(editConsulta.Text);

  if Deuda <> nError then begin

  memo1.Lines.Add('El importe total adeudado es ' + intToStr(Deuda));
  end
  else begin
    memo1.Lines.Add('No hay un auto guardado con esa patente');
  end;
end;

procedure TForm1.btnSinDeudaClick(Sender: TObject);
var Patente: string;
begin
  Patente := LV.sinDeuda;
  if Patente = 'CError' then begin
    memo1.Lines.Add('No hay autos sin deudas');

  end
  else if Patente = 'Vacia' then begin
    memo1.Lines.Add('No hay autos guardados');
  end
  else begin
    memo1.Lines.Add('El vehículo ' + LV.sinDeuda() + ' no tiene deudas.');
  end;
end;

procedure TForm1.btnMayorDeudaClick(Sender: TObject);
var Patente: string;
begin
  Patente := LV.mayorDeuda;
  if Patente = 'Vacia' then begin
    memo1.Lines.Add('No hay autos guardados');
  end
  else if Patente = 'CError' then begin
     memo1.Lines.Add('El o los autos guardados no tienen multas');
  end
  else begin
    memo1.Lines.Add('El vehículo con la mayor deuda es ' + Patente);
  end;
end;

procedure TForm1.btnMayorCantClick(Sender: TObject);
var Auto: string;
begin
  Auto := LV.cantMultasMayor();
  if Auto = 'Vacia' then begin
    memo1.Lines.Add('No hay ningún auto guardado');
  end
  else if Auto = 'CError' then begin
    memo1.Lines.Add('El o los autos guardados no tienen multas');
  end
  else begin
    memo1.Lines.Add('El vehículo con la mayor cantidad de infracciones es '
   + Auto);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LV.inicializarLista(Cadena,cantElemMax);
  memo1.Clear;
end;

end.
