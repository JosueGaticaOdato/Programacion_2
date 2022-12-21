unit Unidad_Ejercicio3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Vector = Array of String;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 3
Generar un archivo de texto (TXT) con el Block de Notas o similar.
En el archivo no deben existir caracteres como puntos, comas, puntos
y comas, dos puntos, etc.

Realizar una rutina que lea el archivo de texto
y lo cargue a un control “memo” pasando todas las palabras a minúsculas.

Cargar un vector de String con todas las palabras distintas
del archivo. Realizar el parsing o split (división palabra
por palabra) de cada línea por espacios.
}

//Creacion del archivo de texto
procedure TForm1.Button1Click(Sender: TObject);
Var T: TextFile;
  S: String;
  i: Integer;
begin
  //Asigno el archivo y su variable
  AssignFile(T,'.\Texto.txt');

  //Si no existe, lo crea
  if not FileExists('.\Texto.txt') then
  begin
    Rewrite(T);
    CloseFile(T);
  end;
  //Muestro que se creo el archivo
  memo1.Lines.Add('Archivo creado!');
end;

//le creo 10 lineas al archivo
procedure TForm1.Button2Click(Sender: TObject);
Var T: TextFile;
    S: String;
    i: Integer;
begin
  //Asigno y abro el archivo
  AssignFile(T,'.\Texto.txt');
  Append(T);

  for i := 1 to 10 do
  begin
    //Escribo en el archivo
    S := ('Estoy escribiendo en la linea numero° ' + i.ToString);
    WriteLn(T,S)
  end;
  Memo1.Lines.Add('Las lineas fueron creadas!');
  CloseFile(T); //Cierro

end;

//Muestro lo que tiene el archivo
procedure TForm1.Button3Click(Sender: TObject);
Var T: TextFile;
  S: String;
  i: Integer;
begin
  //Asigno el archivo y consulto si existe
  AssignFile(T,'.\Texto.txt');

  if not FileExists('.\Texto.txt') then
  begin
    //Si no existe lo creo
    Rewrite(T);
    CloseFile(T);
  end;

  //Abro en el inicio
  Reset(T);

  //Mientras no llegue al fin del archivo
  while NOT Eof(T) do
  begin
    Readln(T,S);  //Leo la linea y la muestro
    memo1.Lines.Add(S);
  end;

  CloseFile(T);  //Cierro
end;

//Muestro el contenido en minusculas
procedure TForm1.Button5Click(Sender: TObject);
Var T: TextFile;
  S: String;
  i: Integer;
begin
  //Asigno el archivo y consulto si existe.
  AssignFile(T,'.\Texto.txt');

  if not FileExists('.\Texto.txt') then
  begin
    //Si no existe lo creo
    Rewrite(T);
    CloseFile(T);
  end;

  //Abro en el inicio
  Reset(T);

  //Mientras no llegue al fin del archivo
  while NOT Eof(T) do
  begin
    Readln(T,S);  //Leo la linea y la muestro
    memo1.Lines.Add(LowerCase(S)); //Muestro en minuscula
  end;

  CloseFile(T);  //Cierro
end;

//Funcion que me dice si la palabra ya se utilizo o no
//de esto depende si se carga en el vector o no
Function palabraYaUtilizada(palabra: String;var Vector: Vector): Boolean;
var
utilizada : boolean;
i: integer;
begin
  utilizada := false;
  i := 0;
  while (not utilizada and (i < length(vector))) do //Mientras no llegue al final
  // y no se haya utilizado
  begin
    if (vector[i] = palabra) then //Si existe la palabra
    begin
      utilizada := true; //Devuelvo verdadero, osea, que la palabra se uso
    end;
    inc(i);
  end;
  palabraYaUtilizada := utilizada;
end;

// Funcion Parsing, Interna a la implementacion
procedure Parsing(aSS: String; aSep: String;var aV: Vector);
Var I: Integer;
    P: Integer;
    Texto: String;
Begin
  I := 0;
  // Controlo que el ultimo caracter sea el separador, sino lo agrega
  if aSS.Substring(aSS.Length,1) <> aSep then aSS := aSS + aSep;

  // Hacemos el split
  P := Pos(aSep, aSS);
  while P > 0 do Begin
    Texto := Copy(aSS, 1, P-1); //Obtengo el texto
    if (not palabraYaUtilizada(Texto,aV)) then //Consutlo si ya existe
    begin
      //Si no existe...
      I := Length(aV); //Obtengo el tamaño del arreglo
      Inc(I); //Aumento la variable de posicion
      SetLength(aV, I);  // Se redimensiona el array y no se pierden los datos
      aV[I-1] := Texto; //Agrego el texto
    end;
    aSS := Copy(aSS, P+1, Length(aSS)); //Obtengo el resto del texot
    P := Pos(aSep, aSS); //Obtengo la nueva posicion a cortar
  End;
End;

//Mostrar el Parsgin
procedure TForm1.Button4Click(Sender: TObject);
Var T: TextFile;
  S, Cadena: String;
  i: Integer;
  V: Vector;
begin
  AssignFile(T,'.\Texto.txt');
  S := '';

  if not FileExists('.\Texto.txt') then
  begin
    Rewrite(T);
    CloseFile(T);
  end;

  Reset(T);

  //Mietras no llegue al final del archivo
  while NOT Eof(T) do
  begin
    Readln(T,S); //Leo la linea
    Parsing(S,' ',V); //Le hago el parsing
  end;
  //Muestro en pantalla todo lo que obtuve
  for i := 0 to length(V) - 1 do
  begin
    memo1.Lines.Add(V[i]);
  end;
end;


end.
