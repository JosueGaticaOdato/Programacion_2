unit Unit_Ejercicio5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers, Unit_Fecha;

type
  TForm1 = class(TForm)
    DatePicker1: TDatePicker;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DatePicker2: TDatePicker;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit2: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  F: Fecha;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var nuevaFecha: TDate;
begin
  F.asignar(DatePicker1.Date);
  nuevaFecha := F.restar(Strtoint(Edit1.Text));
  Edit2.Text := Datetostr(nuevaFecha);
end;

procedure TForm1.Button2Click(Sender: TObject);
var nuevaFecha: TDate;
begin
  F.asignar(DatePicker1.Date);
  nuevaFecha := F.sumar(Strtoint(Edit1.Text));
  Edit2.Text := Datetostr(nuevaFecha);
end;

procedure TForm1.Button3Click(Sender: TObject);
var dias: integer;
begin
  F.asignar(DatePicker1.Date);
  dias := F.diferencia(DatePicker2.Date);
  Edit2.Text := Inttostr(dias);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  F.asignar(DatePicker1.Date);
  Edit2.Text := F.comparacion(DatePicker2.Date);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  F.asignar(DatePicker1.Date);
  if F.isBisiesto then
  begin
    Edit2.Text := 'es Bisiesto';
  end
  else
  begin
    Edit2.Text := 'no es Bisiesto';
  end;
end;

end.
