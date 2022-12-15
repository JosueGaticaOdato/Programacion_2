unit Ejercico8Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Cadena: TEdit;
    Memo1: TMemo;
    Generar: TButton;
    procedure GenerarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

(*
Se tiene una cadena que representa una onda digital
de señales L (Low) y H (High).
Se pide mostrar la onda que representa utilizando _ y |.

Por ejemplo, si se tiene la cadena HHHHLLLLHHHHHLLHHLLHH,
su onda digital se puede ver algo así:

_ _ _ _            _ _ _ _ _         _ _         _ _
       | _ _ _ _ |           | _ _ |     | _ _ |
*)

//Funcion recursiva que devuelve la onda correspondiente
function Onda_Digital (Cadena: String; Posicion: Integer): String;
begin
  //Si en la posicion en la que estoy no hay mas letras, corto la recursividad
  if Length(Cadena) + 1 <> Posicion then
  begin
    //Si se produce el cambio de H a L o viceversa, tengo que agregar un |
    if ((Cadena[Posicion] = 'H') and (Cadena[Posicion + 1] = 'L')) or
    ((Cadena[Posicion] = 'L') and (Cadena[Posicion + 1] = 'H'))then
    begin
      //Si es H pongo el guion alto y la barra
      if ((Cadena[Posicion] = 'H'))then
      begin
        //Hago el llamado recursivo aumentando la posicion
        Result := ' ¯ | ' + Onda_Digital(Cadena,Posicion + 1);
      end
      else
      //Si es L pongo el guion bajo y la barra
      begin
        //Hago el llamado recursivo aumentando la posicion
        Result := ' _ | ' + Onda_Digital(Cadena,Posicion + 1);
      end;
    end
    else
    //En caso de que no se produzca cambio, colo el guion correspondiente
    begin
      //Si es H, guion alto y sigo con la recursividad, lo mismo con el guion bajo
      if (Cadena[Posicion] = 'H') then
      begin
        Result := ' ¯ ' + Onda_Digital(Cadena,Posicion + 1);
      end
      else if (Cadena[Posicion] = 'L') then
      begin
        Result := ' _ ' + Onda_Digital(Cadena,Posicion + 1);
      end;
    end;
    //La recursividad solo termina cuando no tenga mas espacios, ese es el caso base
  end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
 memo1.Clear;
end;

procedure TForm1.GenerarClick(Sender: TObject);
var Onda: String;
begin
  Onda := Onda_Digital(Cadena.Text,1);
  memo1.Lines.Add(Onda)
end;

end.
