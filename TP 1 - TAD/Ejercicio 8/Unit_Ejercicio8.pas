unit Unit_Ejercicio8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Unit_Congelador,System.TypInfo;

const
  Cant_Sabores = 4;

type
  Sabores = (Chocolate, CremaAmericana, Frutilla, Limon);

  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Chocolate: TCheckBox;
    CremaAmericana: TCheckBox;
    Frutilla: TCheckBox;
    Limon: TCheckBox;
    Button4: TButton;
    Button5: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure obtenerHelados(var saboresElegidos: Array of String);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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

{
Ejercicio 8
En una heladería se ofrecen conos con bochas de 25 gramos de 2 y 3 sabores distintos a escoger entre chocolate, crema americana, frutilla y limón.

El congelador de helados almacena un balde por cada sabor, cada balde con su cantidad de helado disponible.

Al congelador se le puede:

Aumentar una cantidad de helado de un determinado sabor,
Consultar si alcanza el helado para crear un cono dados 2 o 3 sabores disponibles,
Consultar las combinaciones bochas de helado disponibles para crear conos de ambos tipos.
También se puede servir un helado siempre y cuando haya suficiente cantidad de helado de los sabores deseados.
Cree un TAD para representar un congelador de helados e implemente los métodos indicados.
}

//Boton para aumentar la cantidad de helado
procedure TForm1.Button1Click(Sender: TObject);
begin
  C.aumentarCantidadHelado(ComboBox1.Text,Strtoint(Edit1.Text));
  memo1.lines.add('Cantidad aumentada');
end;

//Boton que muestra las cantidad posibles de helado
procedure TForm1.Button2Click(Sender: TObject);
var
saboresElegidos: Array[1..3] of String;
cantBochas,i: integer;
Alcanza: boolean;
begin
  //El ord comvierte el true en 1 y el false en 0
  cantBochas := Ord(Chocolate.Checked) + Ord(CremaAmericana.Checked) + Ord(Frutilla.Checked) + Ord(Limon.Checked);
  if (cantBochas = 3) or (cantBochas = 2) then
  begin
    obtenerHelados(saboresElegidos); //Guardo en un vector los helados que fueron elegidos
    case cantBochas of //Segun lo que elegio el usuario (2 o 3 bochas)
      2: Alcanza := C.alcanzaHelado2(saboresElegidos[1],saboresElegidos[2]);
      3: Alcanza := C.alcanzaHelado3(saboresElegidos[1],saboresElegidos[2],saboresElegidos[3]);
    end;
    if Alcanza then //SI ALCANZA PARA HACER EL HELADO
    begin
      memo1.Lines.Add('Alcanza el helado para crear un cono');
    end
    else
    begin
       memo1.Lines.Add('No alcanza la cantidad de helado');
    end;
  end
  else
  begin
    memo1.Lines.Add('La cantidad de helado es invalida. Solo se sirven bochas de 2 o 3 helados distintos.');
  end;
end;

//Boton para mostrar las combinaciones posibles de bochas
procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add('Combinaciones para 2 bochas');
  memo1.Lines.Add(C.combinacionesPosibles2Bochas);
  memo1.Lines.Add('');
  memo1.Lines.Add('Combinaciones para 3 bochas');
  memo1.Lines.Add(C.combinacionesPosibles3Bochas);
end;

//Funcion que me muestra el Cono que se armo, con su peso y sabores
function mostrarCucurucho(C: Cono): String;
var i: integer;
texto, EnumString: String;
begin
  texto := 'Peso: ' + C.peso.ToString + #13#10;
  for I := 0 to length(C.sabores) - 1 do
  begin
    EnumString := GetEnumName(TypeInfo(Sabores),integer(C.sabores[i])); //Obtener en string el valor de un enumerado
    texto := texto + 'Sabor ' + (I + 1).ToString + ': ' + EnumString + #13#10;
  end;
  Result := texto;
end;

//Boton para crear un helado
procedure TForm1.Button4Click(Sender: TObject);
var
saboresElegidos: Array[1..3] of String;
cantBochas,i: integer;
Alcanza: boolean;
Cucurucho: Cono;
begin
  //El ord comvierte el true en 1 y el false en 0
  cantBochas := Ord(Chocolate.Checked) + Ord(CremaAmericana.Checked) + Ord(Frutilla.Checked) + Ord(Limon.Checked);
  if (cantBochas = 3) or (cantBochas = 2) then
  begin
    obtenerHelados(saboresElegidos); //Guardo en un vector los helados que fueron elegidos
    alcanza := false;
    case cantBochas of //Segun lo que elegio el usuario (2 o 3 bochas)
      2: Cucurucho := C.servirHelado2Bochas(saboresElegidos[1],saboresElegidos[2], alcanza);
      3: Cucurucho := C.servirHelado3Bochas(saboresElegidos[1],saboresElegidos[2],saboresElegidos[3], alcanza);
    end;
    if Alcanza then //SE HIZO EL HELADO
    begin
      memo1.Lines.Add('Se armo el helado con exito! Que lo disfrute.');
      memo1.Lines.Add(mostrarCucurucho(Cucurucho)); //Muestro el cono
    end
    else
    begin
       memo1.Lines.Add('No alcanza la cantidad de helado');
    end;
  end
  else
  begin
    memo1.Lines.Add('La cantidad de helado es invalida. Solo se sirven bochas de 2 o 3 helados distintos.');
  end;
end;

//Boton qume me muestra las cantidades de helado disponible
procedure TForm1.Button5Click(Sender: TObject);
begin
  memo1.Lines.Add(C.mostrarCantidades);
end;

//Funcion que obteniene los helados para crear un cono y los guarda en un array
procedure TForm1.obtenerHelados(var saboresElegidos: Array of String);
var
posicion,i: integer;
begin
  //Obtener los helados que se quiere usar
    posicion := 0;
     for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TCheckBox then
      begin
        if TCheckBox(Components[i]).Checked then
        begin
          saboresElegidos[posicion] := TCheckBox(Components[i]).Name;
          inc(posicion);
        end;
      end;
    end;
end;

//Creacion de los baldes
procedure TForm1.FormCreate(Sender: TObject);
begin
  C.crearBaldes;
  C.cargarBaldesTesting;
end;

end.
