unit ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos,
  Vcl.StdCtrls, Vcl.ComCtrls,
  ListArray;
  //ListCursor;
  //ListPointer; //Falta chequear puntero

const
  cantElemMax = 100;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Label5: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  L: Lista;

implementation

{$R *.dfm}

//Funcion que me devuelve aquel auto que no tenga deudas
function Sin_Deuda(L1:Lista): String;
var Contador, SubContador: TipoElemento;
  P: PosicionLista;
  X1,X2,X3, Comprobante: TipoElemento;
  Bandera: Boolean;
  Puntero1: ^Lista;
  Puntero2: ^Integer;
begin
  //Primer elemento
  //Similar al Mayor_Deuda, solamente que ahora tomo los valores que no sean pendiente
  New(Puntero1);
  New(Puntero2);
  P := L.Comienzo;
  X1 := L.Recuperar(P);
  Comprobante := X1;
  Contador.Valor1 := 0;
  Bandera := True;
  while (P <> Nulo) and (Bandera) do
  begin
    X1 := L.Recuperar(P);
    if Comprobante.Clave = X1.Clave then
    begin
      if (X1.Valor1 <> 'Pendiente') then
      begin
        Contador.Clave := X1.Clave;
        Contador.Valor1 := Contador.Valor1 + 1;
        P := L.Siguiente(P);
      end;
    end
    else
    begin
      Bandera := False;
    end;
  end;

  SubContador.Valor1 := 0;
  while (P <> Nulo) do
  begin
  X1 := L.Recuperar(P);
  if (X1.Valor1 <> 'Pendiente') then
  begin
      SubContador.Valor1 := SubContador.Valor1 + 1;
  end;
  P := L.Siguiente(P);
  if SubContador.Valor1 > Contador.Valor1 then
  begin
    Contador := SubContador;
  end;
  Comprobante := L.Recuperar(P); 
  if X1.Clave <> Comprobante.Clave then
  Begin
    SubContador.Valor1 := 0;
  End;
  end;
  Result := Contador.Clave;
end;

//Funcion que devuelve el auto con la mayor deuda
function Mayor_Deuda(L1:Lista): TipoElemento;
var Contador, SubContador: TipoElemento;
  P, Inicio: PosicionLista;
  X1,X2,X3, Comprobante: TipoElemento;
  Bandera: Boolean;
  Puntero1: ^Lista;
  Puntero2: ^Integer;
begin
  //Primer elemento
  New(Puntero1);
  New(Puntero2);
  P := L.Comienzo;
  Inicio := L.Comienzo;
  X1 := L.Recuperar(P);
  Comprobante := X1;
  Contador.Valor1 := 0;
  Bandera := True;
  //Mientras no llegue al final y sea otro valor distinto
  while (P <> Nulo) and (Bandera) do
  begin
    X1 := L.Recuperar(P);
    if Comprobante.Clave = X1.Clave then
    begin
      if X1.Valor1 = 'Pendiente' then
      begin
        Puntero1 := X1.Valor2;
        X2 := Puntero1^.Recuperar(Inicio);
        Puntero2 := X2.Valor2;
        Contador.Clave := X1.Clave; //Recupero el nombre del auto
        Contador.Valor1 := Contador.Valor1 + Puntero2^;  //Recupero el importe
        P := L.Siguiente(P);
      end;
    end
    else
    begin
      Bandera := False; //En el caso que sea otra patente, termino el ciclo
    end;
  end;

  //Mientras no llegue al final
  SubContador.Valor1 := 0;
  while (P <> Nulo) do
  begin
  X1 := L.Recuperar(P);
  if X1.Valor1 = 'Pendiente' then
  begin
      Puntero1 := X1.Valor2;
      X2 := Puntero1^.Recuperar(Inicio);
      Puntero2 := X2.Valor2;
      SubContador.Clave := X1.Clave;   //Guardo en otro contador el nombre del auto y su importe
      SubContador.Valor1 := SubContador.Valor1 + Puntero2^;
  end;
  P := L.Siguiente(P);
  //En caso de que sea mayor, cambio el contador
  if SubContador.Valor1 > Contador.Valor1 then
  begin
    Contador := SubContador;
  end;
  Comprobante := L.Recuperar(P);
  //Si el que sigue es distinto, arranca de 0 devuelta
  if X1.Clave <> Comprobante.Clave then
  Begin
    SubContador.Valor1 := 0;
  End;
  end;
  //Devuelve el TE
  Result := Contador;
end;

//Funcion que devuelve el auto con mayor cantidad de infracciones
function Mayor_Cant_Infracciones(L1:Lista): TipoElemento;
var Contador, SubContador: TipoElemento;
  P: PosicionLista;
  X1,X2: TipoElemento;
  Bandera: Boolean;
begin
  //Tomo un auto como eje
  P := L.Comienzo;
  Contador.Clave := L.Recuperar(P).Clave;  //Clave contiene al auto
  Contador.Valor1 := 0;      //Valor 1 tiene la cantidad de ocurrencias
  Bandera := True;
  while (P <> Nulo) and (Bandera) do
  begin
  X1 := L.Recuperar(P);
  X2 := L.Recuperar(L.Siguiente(P));
  if X1.Clave <> X2.Clave then
  begin
    Bandera := False;
  end;
  P := L.Siguiente(P);
  //Aumento el contador a medida que encuentro ocurrencias
  Contador.Valor1 := Contador.Valor1 + 1;
  end;

  //Averiguo los demas
  Bandera := True;
  SubContador.Valor1 := 1;
  while (P <> Nulo) do
  begin
  X1 := L.Recuperar(P);
  X2 := L.Recuperar(L.Siguiente(P));
  if X1.Clave = X2.Clave then
  begin
    //Aumento el subcontador a medida que encuentro ocurrencias
    SubContador.Clave := L.Recuperar(P).Clave;
    SubContador.Valor1 := SubContador.Valor1 + 1;
  end
  else
  begin
    //Sino, vuelve a empeza
    SubContador.Valor1 := 1;
  end;
  //Pido el siguiente
  P := L.Siguiente(P);
  //Si es mayor, tengo un auto con mas ocurrencias que otro, cambio el contador
  if SubContador.Valor1 > Contador.Valor1 then
  begin
    Contador := SubContador;
  end;
  end;
  //Devuelvo el auto con la cantidad de ocurrencias
  Result := Contador;
end;

//Funcion que calcula la multa mas reciente para un vehiculo
function multaReciente (L1: Lista; Auto: String): TipoElemento;
var contL1, contL2, Mas_Antiguo: tipoElemento;
    pos,Inicio: posicionLista;
    puntero: ^Lista;
    puntero2: ^integer;
    Bandera: Boolean;
begin
  //El algoritmo es igual al mas antigua, lo unico que cambia es en la linea 255, que ahora es mayor igual
  Inicio := L.Comienzo;
  pos := L.Comienzo;
  Bandera := True;
  while (Pos <> Nulo) and Bandera do
  begin
  contL1 := L.Recuperar(pos);
  if contL1.Clave = Auto then
    begin
      puntero := contL1.Valor2;
      contL2 := puntero^.Recuperar(Inicio);
      Mas_antiguo := contL2;
      Bandera := False;
    end;
  pos := L.Siguiente(pos);
  end;

  while (Pos <> Nulo) do
  begin
  contL1 := L.Recuperar(pos);
  if contL1.Clave = Auto then begin
    puntero := contL1.Valor2;
    contL2 := puntero^.Recuperar(Inicio);
    if contL2.Valor1 >= Mas_Antiguo.Valor1 then
    begin
      Mas_Antiguo := contL2;
    end;
  end;
  pos := L.Siguiente(pos);
  end;
  multaReciente := Mas_Antiguo;
end;

//Funcion que calcula la multa mas antigua de un vehiculo, devolviendo el importe y la fecha
function multaAntigua (L1: Lista; Auto: String): TipoElemento;
var contL1, contL2, Mas_Antiguo: tipoElemento;
    pos, Inicio: posicionLista;
    puntero: ^Lista;
    puntero2: ^integer;
    Bandera: Boolean;
begin
  //Inicializo la posicion, el inicio y bandera
  pos := L.Comienzo;
  Inicio := L.Comienzo; //Inicio me indica la primera posicion de la segunda lista
  Bandera := True;
  //Mientas posicion no tenga nada y no halla encontrado la primera ocurrencia
  while (Pos <> Nulo) and Bandera do
  begin
  contL1 := L.Recuperar(pos);
  //Si encuentro la ocurrencia, guardo
  if contL1.Clave = Auto then
    begin
      puntero := contL1.Valor2;
      contL2 := puntero^.Recuperar(Inicio);
      //Guardo en la variable y termina el ciclo
      Mas_antiguo := contL2;
      Bandera := False;
    end;
  //Pido el siguiente
  pos := L.Siguiente(pos);
  end;

  //Mientras halla posiciones
  while (Pos <> Nulo) do
  begin
  //Recupero
  contL1 := L.Recuperar(pos);
  //Si es del mismo auto, la guardo y comparo
  if contL1.Clave = Auto then begin
    puntero := contL1.Valor2;
    contL2 := puntero^.Recuperar(Inicio);
    //Si es menor quiere decir que es mas antigua
    if contL2.Valor1 < Mas_Antiguo.Valor1 then
    begin
      //Guardo en la variable
      Mas_Antiguo := contL2;
    end;
  end;
  //Pido siguiente posicion
  pos := L.Siguiente(pos);
  end;
  //Devuelvo la multa mas antigua
  multaAntigua := Mas_Antiguo;
end;

//Funcion que calcula el total de multas de un vehiculo
function totalMultas (L1: Lista; Auto: String): Integer;
var sumador: integer;
    contL1, contL2: tipoElemento;
    pos,Inicio: posicionLista;
    puntero: ^Lista;
    puntero2: ^integer;
begin
  //Inicializo el sumador, la posicion y el inicio
  Inicio := l.Comienzo;
  pos := L.Comienzo;
  sumador := 0;
  //Mientras la posicion sea distinto de nulo
  while pos <> Nulo do begin
    //Necesito que los autos tengan la misma patente y sea pendiente
    contL1 := L.Recuperar(pos);
    if contL1.Clave = Auto then begin
      if contL1.Valor1 = 'Pendiente' then begin
        //Creo ambos punteros
        New(puntero);
        New(Puntero2);
        //Paso al primer puntero el contenido de V2
        puntero := contL1.Valor2;
        //Recupero el contenido
        contL2 := puntero^.Recuperar(Inicio);

        //En puntero2 almaceno V2 de la segunda lista, que era el importe
        puntero2 := contL2.Valor2;
        //Sumo
        sumador := sumador + puntero2^;
      end;
    end;
    //Solicito la siguiente posicion
    pos := L.Siguiente(pos);
  end;
  //Devuelvo el total
  Result := sumador;
end;

//Boton que realiza la carga en la lista
procedure TForm1.Button1Click(Sender: TObject);
var Elem, ElemPuntero: tipoElemento;
    posElem: posicionLista;
    puntero: ^Lista;
    punteroValor2: ^Integer;
begin
  //LLamo a random y creo el puntero
  Randomize;
  New(puntero);
  puntero^.Crear(Numero,cantElemMax);

  //Paso la clave y el valor 1
  Elem.Clave := Edit1.Text; //patente
  Elem.Valor1 := ComboBox1.Text; //Estado
  //Creo el segundo puntero, que va a la valor 2 de la lista 2
  New(punteroValor2);

  //Cargo, en la segunda lista, clave y valor 1
  ElemPuntero.Clave := Random(100); // nro acta multa
  ElemPuntero.Valor1 := DateTimePicker1.Date;//fecha multa

  //Cargo en valor 2 el importe de la multa
  punteroValor2^ := StrToInt(Edit2.Text);  //importe multa
  ElemPuntero.Valor2 := punteroValor2;

  puntero^.Agregar(ElemPuntero);
  Elem.Valor2 := puntero;
  //Agrego la lista de listas
  L.Agregar(Elem);
  memo1.Lines.Add('Multa agregada con exito');
  //Ordeno para realizar los calculos siguientes
  L.Sort(True);
end;

//Boton que calcula el total de deudas de ese vehiculo
procedure TForm1.Button2Click(Sender: TObject);
var deuda: integer;
begin
  deuda := totalMultas(L, Edit3.Text);
  memo1.Lines.Add('La deuda del vehiculo ' + Edit3.Text + ' es de ' + deuda.ToString + ' pesos');
end;

//Boton que me muestra la multa mas antigua de ese vehiculo
procedure TForm1.Button3Click(Sender: TObject);
var X:TipoElemento;
  P: ^Integer;
begin
  X := multaAntigua(L,Edit3.Text);
  memo1.Lines.Add('La multa mas antigua es ' + FloatToStr(X.Clave));
  memo1.Lines.Add('Cargada el dia ' + DateToSTR(X.Valor1));
  P := X.Valor2;
  memo1.Lines.Add('Con un valor de ' + P^.ToString + ' pesos.');
end;

//Boton que me muestra la multa mas reciente de ese vehiculo
procedure TForm1.Button4Click(Sender: TObject);
var X:TipoElemento;
  P: ^Integer;
begin
  X := multaReciente(L,Edit3.Text);
  memo1.Lines.Add('La multa mas recien es ' + FloatToStr(X.Clave));
  memo1.Lines.Add('Cargada el dia ' + DateToSTR(X.Valor1));
  P := X.Valor2;
  memo1.Lines.Add('Con un valor de ' + P^.ToString + ' pesos.');
end;

//Boton que me muestra el vehiculo con la mayor cantidad de infraccion y su cantidad
procedure TForm1.Button5Click(Sender: TObject);
var X: TipoElemento;
begin
  X := Mayor_Cant_Infracciones(L);
  memo1.Lines.Add('El vehiculo con mayor cantidad de infracciones es ' + X.Clave);
  memo1.Lines.Add('Con un total de ' + IntToStr(X.Valor1) + ' infracciones');
end;

//Boton que me muestra el vehiculo con la mayor deuda
procedure TForm1.Button6Click(Sender: TObject);
var X: TipoElemento;
begin
  X := Mayor_Deuda(L);
  memo1.Lines.Add('El vehiculo con mayor deuda es ' + X.Clave) ;
  memo1.Lines.Add('Con un total a pagar de ' + IntToSTR(X.Valor1) + ' pesos.');
end;

//Boton que me muestra el vehiculo sin deudas
procedure TForm1.Button7Click(Sender: TObject);
var Vehiculo_sin_deuda: String;
begin
  Vehiculo_sin_deuda := Sin_Deuda(L);
  memo1.Lines.Add('El vehiculo que no tiene deudas es ' + Vehiculo_sin_deuda);
end;

//Creacion de la lista
procedure TForm1.FormCreate(Sender: TObject);
begin
  L.Crear(Cadena, cantElemMax);
end;

end.
