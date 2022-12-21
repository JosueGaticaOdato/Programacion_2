unit UnidadEj2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

const
  Min = 1;
  Max = 21;
  AsciiMin = 65;
  AsciiMax = 122;
type
  Vector = Array [Min..Max] of Integer; //Vector donde guardo la cadena
  Vector_Ascii = Array [AsciiMin..AsciiMax] of Integer;  //Vector con los valores ascci
  //(util para saber la cantidad de consonantes y vocales)

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    V_Consonantes: Vector;
    V_Contador: Vector_Ascii;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 2
Generar un programa que dada una cadena de máximo 40 caracteres:

Genere una nueva cadena sólo con los caracteres en mayúsculas.
Genere una nueva cadena sólo con los caracteres en minúsculas.
Genere una nueva cadena que elimine todos los espacios.
Con la cadena sin espacios genere una nueva cadena, pero invertida.
Muestre la cantidad de caracteres que tiene la frase.
Muestre la cantidad de ocurrencias de cada consonante de la cadena original.

Ejemplo

Frase Original: “Hola Mundo Cruel y Despiadado”
1. H M C D
2. ola undo ruel y espiadado
3. HolaMundocruelyDespiadado
4. odadaipseDyleurCodnuMaloH
5. TU FRASE TIENE 29 caracteres
6. H=1 l=2 M=1 n=1 d=3 ...
}

{FUNCIONES DEL PROGRAMA}

//Funcion que me devuelve solo las mayusculas del string
function Solo_Mayusculas(var Cadena: String; Tamaño: Integer): String;
var i: Integer;
  Nueva_cadena: string;
begin
  Nueva_cadena := '';
  //Recorro la cadena
  for i := 1 to Tamaño do
    begin
      //Consulto si es mayuscula o espacio
      //ORD me devuelve el Ascii de la letra
      if (Ord(Cadena[i]) >= Ord('A')) and
        (Ord(Cadena[i]) <= Ord('Z')) or (Ord(Cadena[i]) = Ord(' ')) then
      begin
        //Lo agrego a la cadena
        Nueva_cadena := Nueva_cadena + Cadena[i];
      end;
    end;
  Solo_Mayusculas := Nueva_cadena; //Devuelvo la cadena
end;

//Funcion que me devuelve solo mas minusculas del texto
function Solo_Minusculas(var Cadena: String; Tamaño: Integer): String;
var i: Integer;
  Nueva_cadena: string;
begin
  Nueva_cadena := '';
  //Recorro la cadena
  for i := 1 to Tamaño do
    begin
      //Consulto si esta entre el rango de minusculas o es espacio
      if (Ord(Cadena[i]) >= Ord('a')) and
        (Ord(Cadena[i]) <= Ord('z')) or (Ord(Cadena[i]) = Ord(' ')) then
      begin
        //Lo agrego a la cadena
        Nueva_cadena := Nueva_cadena + Cadena[i];
      end;
    end;
  Solo_Minusculas := Nueva_cadena; //Devuelvo la cadena
end;

//Funcion que me devuelve el texto pero sin espacios
function Sin_Espacios(var Cadena: String; Tamaño: Integer): String;
var i: Integer;
Nueva_cadena: string;
begin
  Nueva_cadena := '';
  //Recorro la cadena
  for i := 1 to Tamaño do
    begin
      //Consulto si no es espacio
      if Ord(Cadena[i]) <> Ord(' ') then
      begin
        //Agrego la letra
        Nueva_cadena := Nueva_cadena + Cadena[i];
      end;
    end;
  Sin_Espacios := Nueva_cadena; //Devuelvo la cadena
end;

//Funcion que me devuelve el texto al revez y sin espacios
function Sin_Espacios_y_al_revez(var Cadena: String; Tamaño: Integer): String;
var i: Integer;
Nueva_Cadena_Invertida, sin_espacio: String;
begin
  sin_Espacio := Sin_Espacios(Cadena,Tamaño);
  Nueva_Cadena_Invertida := '';
  //Recorro la cadena al revez
  for i := length(sin_Espacio) downto 1 do
  begin
  //Lo pongo adelante en la nueva cadena
    Nueva_Cadena_Invertida := Nueva_Cadena_Invertida + sin_Espacio[i];
  end;
  Sin_Espacios_y_al_revez := Nueva_Cadena_Invertida; //Devuelvo la cadena
end;

//Funcion que me devuelve la cantidad de consonantes que tiene la palabra
procedure Consonantes(var Cadena: String; Tamaño: Integer; var bV: Vector_Ascii);
var x,i,j: Integer;
begin
  //Recorro la palabra
  for i := 1 to Tamaño do
  begin
    //Recorro todos los valores ASCII de las letras
    for j := 65 to 122 do
    begin
      //Si el valor ASCII del bucle coincide con la letra del texto
      if Ord(Cadena[i]) = j then
        begin
          //Sumo al vector de consonantes, indexado por el valor ASCCI de la letra
          bV[j] := bV[j] + 1;
        end;
    end;
  end;
end;

{BOTONES}

//Boton que me devuelve solo las mayusculas
procedure TForm1.Button1Click(Sender: TObject);
var i, Largo : Integer;
  Cadena: String;
begin
  Cadena := edit1.Text;
  Largo := Length(Cadena);
  memo1.Lines.Add(Solo_Mayusculas(Cadena,Largo))
end;

//Boton que me devuelve solo las minusculas
procedure TForm1.Button2Click(Sender: TObject);
var i, Largo : Integer;
  Cadena: String;
  Nueva_cadena: String;
begin
  Cadena := edit1.Text;
  Largo := Length(Cadena);
  memo1.Lines.Add(Solo_Minusculas(Cadena,Largo));
end;

//Boton que me devuelve solo las cadena sin espacios
procedure TForm1.Button3Click(Sender: TObject);
var i, Largo : Integer;
  Cadena: String;
  Nueva_cadena: String;
begin
  Cadena := edit1.Text;
  Largo := Length(Cadena);
  memo1.Lines.Add(Sin_Espacios(Cadena,Largo));
end;

//Boton que me devuelve la cadena invertida sin espacios
procedure TForm1.Button4Click(Sender: TObject);
var i, Largo : Integer;
  Cadena: String;
  Nueva_cadena: String;
begin
  Cadena := edit1.Text;
  Largo := Length(Cadena);
  memo1.Lines.Add(Sin_Espacios_y_al_revez(Cadena,Largo));
end;

//Boton que me dice la cantidad de caracteres que tiene una palabra
procedure TForm1.Button5Click(Sender: TObject);
var i, Largo : Integer;
  Cadena: String;
begin
  Cadena := edit1.Text;
  Largo := Length(Cadena);
  memo1.Lines.Add('Tu frase tiene ' + Largo.ToString + ' Caracteres.');
end;

//Boton que me dice la cantidad de ocurrencias de minusculas y mayusculas
procedure TForm1.Button6Click(Sender: TObject);
var i, Largo : Integer;
  Cadena: String;
begin
  Cadena := edit1.Text;
  Largo := Length(Cadena);
  Consonantes(Cadena,Largo,V_Contador);
  //Mostrar las consonantes en mayuscula
  for i := 65 to 90 do
    begin
      //Si es distinto de 0 quiere decir que tuvo una aparicion en el texto
      if V_Contador[i] <> 0 then
      begin
        memo1.lines.add(Chr(i) + '=' + V_Contador[i].ToString);
      end;
    end;
  //Mostrar las consonantes en minuscula
  for i := 97 to 122 do
    begin
    //Si es distinto de 0 quiere decir que tuvo una aparicion en el texto
      if V_Contador[i] <> 0 then
      begin
        memo1.lines.add(Chr(i) + '=' + V_Contador[i].ToString);
      end;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear
end;

end.
