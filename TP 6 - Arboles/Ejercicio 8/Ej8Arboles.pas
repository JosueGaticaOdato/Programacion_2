unit Ej8Arboles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Ej8ArbolesTAD, Vcl.StdCtrls;

const
  cFile = '.\Datos.dat';

type
  TForm1 = class(TForm)
    btnMostrar: TButton;
    Memo1: TMemo;
    btnCargar: TButton;
    editCuit: TEdit;
    editRazon: TEdit;
    editDomicilio: TEdit;
    editTelefono: TEdit;
    editCelular: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure btnMostrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
  private
    { Private declarations }
    AB:Ej8;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCargarClick(Sender: TObject);
var Cuit,Tel,Cel:integer;
begin
  if (tryStrToInt(editCuit.Text,Cuit)) and (tryStrToInt(editTelefono.Text,Tel)) and (tryStrToInt(editCelular.Text,Cel)) then begin
    AB.cargarArchivo(cFile,Cuit,editRazon.Text,editDomicilio.Text,Tel,Cel);
    memo1.Lines.Add('El archivo se cargó correctamente')
  end
  else memo1.Lines.Add('Los datos ingresados no son correctos');
end;

procedure TForm1.btnMostrarClick(Sender: TObject);
//var AD:aDatos;
//    RD:Datos;
begin
  memo1.Lines.Add(AB.mostrarArchivo(cFile));
//  assignFile(AD,cFile);
//  Reset(AD,cFile);
//  while not EOF(AD) do begin
//    Read(AD,RD);
//    memo1.Lines.Add(RD.CUIT.ToString);
//    memo1.Lines.Add(RD.razonSocial);
//    memo1.Lines.Add(RD.Domicilio);
//    memo1.Lines.Add(RD.Telefono.ToString);
//    memo1.Lines.Add(RD.Celular.ToString);
//
//  end;
//  CloseFile(AD);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  AB.crearArchivo(cFile);
  memo1.Clear;
end;

end.
