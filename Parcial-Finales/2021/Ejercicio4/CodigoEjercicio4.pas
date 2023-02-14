unit CodigoEjercicio4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, TADEjercicio5;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Candidato: TEdit;
    Label1: TLabel;
    Mesa: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Distrito: TEdit;
    Provincia: TEdit;
    Votos: TEdit;
    Label5: TLabel;
    Memo1: TMemo;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    EJ4: Registro_De_Votos;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  EJ4.Cargar_Voto(Strtoint(Mesa.Text),Strtoint(Distrito.Text),Strtoint(Provincia.Text),Strtoint(Votos.Text),Candidato.Text);
  memo1.lines.add('Votos cargados');
end;

end.
