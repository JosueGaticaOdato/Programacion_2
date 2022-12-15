unit Unit_Ejercicio8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Unit_Congelador;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Button4: TButton;
    Button5: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  C: Congelador;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  C.aumentarCantidadHelado(Sabores(ComboBox1.ItemIndex),Strtoint(Edit1.Text));
  memo1.lines.add('Cantidad aumentada');
end;

end.
