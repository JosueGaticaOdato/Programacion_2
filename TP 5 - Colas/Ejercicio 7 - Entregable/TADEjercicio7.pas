unit TADEjercicio7;

interface

uses
  Tipos, System.SysUtils,
  //QueuesArrayNCMejorada;
  QueuesCursor;
  //QueuesPointer;

type
  //TAD correspondiente
  Ejercicio7 = Object
    private
      //Como atributos, estan las 3 colas correspondientes
      C1: Cola;
      C2: Cola;
      C3: Cola;
    public
      //Comportamiento
      procedure Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
      function Mostrar_Cola():String;
      procedure Cargar_Cola(Numero_Cola: Integer; Tiempo: TipoElemento);
      procedure AtenderC1(Q: Integer; VAR Cola: Integer; VAR Cadena: String);
      procedure AtenderC2(Q: Integer; VAR Cola: Integer; VAR Cadena: String);
      procedure AtenderC3(Q: Integer; VAR Cola: Integer; VAR Cadena: String);
      function Atender(Q: Integer): String;

  End;

implementation

//Procedimiento que crea las colas
procedure Ejercicio7.Crear_Cola(Tipo_Clave: Variant; Tamaño: Integer);
begin
  C1.Crear(Tipo_Clave, Tamaño);
  C2.Crear(Tipo_Clave, Tamaño);
  C3.Crear(Tipo_Clave, Tamaño);
end;

//Funcion que muestra el contenido de las colas
function Ejercicio7.Mostrar_Cola;
var Cola1, Cola2, Cola3: String;
begin
  //Se usa el #13#10 para hacer el salto de linea
  Cola1 := 'Cola 1:' +  #13#10 +  C1.RetornarClaves;
  Cola2 := 'Cola 2:' + #13#10 +  C2.RetornarClaves;
  Cola3 := 'Cola 3:' + #13#10 +  C3.RetornarClaves;
  Mostrar_Cola := Cola1 + Cola2 + Cola3;
end;

//Procedimiento que carga la cola correspondiente, con su respectivo tiempo
procedure Ejercicio7.Cargar_Cola(Numero_Cola: Integer; Tiempo: TipoElemento);
begin
  //Segun el numero pasado, carga en su respectiva cola
  case Numero_Cola of
    0: C1.Encolar(Tiempo);
    1: C2.Encolar(Tiempo);
    2: C3.Encolar(Tiempo);
  end;
end;

//Procedimientos que atiende cada caja en particular
procedure Ejercicio7.AtenderC1(Q: Integer; VAR Cola: Integer; VAR Cadena: String);
var X: TipoElemento;
begin
  //Recupero, desencolo y resto
  X := C1.Recuperar;
  C1.DesEncolar;
  X.Clave := X.Clave - Q;
  //Si da 0, devuelvo el cliente y el numero de cola, tambien aumento el contador
  if X.Clave = 0 then
  begin
    Cadena := Cadena + 'Cliente ' + Cola.ToString + ' - Cola 1'  + #13#10;
    Inc(Cola);
  end
  else
  begin
  //Si no es 0, directamente encolo el resultado que quedo
    C1.Encolar(X);
  end;
end;

procedure Ejercicio7.AtenderC2(Q: Integer; VAR Cola: Integer; VAR Cadena: String);
var X: TipoElemento;
begin
  //Recupero, desencolo y resto
  X := C2.Recuperar;
  C2.DesEncolar;
  X.Clave := X.Clave - Q;
  //Si da 0, devuelvo el cliente y el numero de cola, tambien aumento el contador
  if X.Clave = 0 then
  begin
    Cadena := Cadena + 'Cliente ' + Cola.ToString + ' - Cola 2'  + #13#10;
    Inc(Cola);
  end
  else
  begin
  //Si no es 0, directamente encolo el resultado que quedo
    C2.Encolar(X);
  end;
end;

procedure Ejercicio7.AtenderC3(Q: Integer; VAR Cola: Integer; VAR Cadena: String);
var X: TipoElemento;
begin
  //Recupero, desencolo y resto
  X := C3.Recuperar;
  C3.DesEncolar;
  X.Clave := X.Clave - Q;
  //Si da 0, devuelvo el cliente y el numero de cola, tambien aumento el contador
  if X.Clave = 0 then
  begin
    Cadena := Cadena + 'Cliente ' + Cola.ToString + ' - Cola 3'  + #13#10;
    Inc(Cola);
  end
  else
  begin
  //Si no es 0, directamente encolo el resultado que quedo
    C3.Encolar(X);
  end;
end;

//Funcion principal, que recibe el tiempo del empleado y devuelve las colas que fueron atendidas
//Complejidad algoritmica: O(n) (Lineal)
//.Asignaciones de los contadores y la cadena
//.Recorrer, mientras no esten vacias, las tres colas
//.Recuperar el contenido de cada cola (1 por vez)
//.Desencolar de la cola
//.Restar al tiempo del empleado
//.Comparar si es 0:
//..Si lo es, guardo el string y aumento el contador
//..Si no, encolo el resultado
function Ejercicio7.Atender(Q: Integer): String;
var Cola1, Cola2, Cola3: Integer;
  X: TipoElemento;
  Cadena: String;
begin
  Cadena := '';
  Cola1 := 1;
  Cola2 := 1;
  Cola3 := 1;
  //Mientras no esten vacias las 3 colas, sigo recorriendo
  while (not C1.EsVacia) or (not C2.EsVacia) or (not C3.EsVacia) do
  begin
    //Consulto si la cola esta vacia
    if not C1.EsVacia then
    begin
      atenderC1(Q,Cola1,Cadena);
    end;
    //Consulto si la cola esta vacia
    if not C2.EsVacia then
    begin
      atenderC2(Q,Cola2,Cadena);
    end;
    //Consulto si la cola esta vacia
    if not C3.EsVacia then
    begin
      atenderC3(Q,Cola3,Cadena);
    end;
  end;
  //Devuelvo el string con las colas que fueron atendidas
  Result := Cadena;
end;

end.
