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
  if Numero_Cola = 0 then
  begin
    C1.Encolar(Tiempo);
  end
  else if Numero_Cola = 1 then
  begin
    C2.Encolar(Tiempo);
  end
  else
  begin
    C3.Encolar(Tiempo);
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
      //Recupero, desencolo y resto
      X := C1.Recuperar;
      C1.DesEncolar;
      X.Clave := X.Clave - Q;
      //Si da 0, devuelvo el cliente y el numero de cola, tambien aumento el contador
      if X.Clave = 0 then
      begin
        Cadena := Cadena + 'Cliente ' + Cola1.ToString + ' - Cola 1'  + #13#10;
        Cola1 := Cola1 + 1;
      end
      else
      begin
      //Si no es 0, directamente encolo el resultado que quedo
        C1.Encolar(X);
      end;
    end;
    //Consulto si la cola esta vacia
    if not C2.EsVacia then
    begin
      X := C2.Recuperar;
      C2.DesEncolar;
      X.Clave := X.Clave - Q;
      //Si da 0, devuelvo el cliente y el numero de cola, tambien aumento el contador
      if X.Clave = 0 then
      begin
        Cadena := Cadena + 'Cliente ' + Cola2.ToString + ' - Cola 2' + #13#10;
        Cola2 := Cola2 + 1;
      end
      else
      //Si no es 0, directamente encolo el resultado que quedo
      begin
        C2.Encolar(X);
      end;
    end;
    //Consulto si la cola esta vacia
    if not C3.EsVacia then
    begin
      X := C3.Recuperar;
      C3.DesEncolar;
      X.Clave := X.Clave - Q;
      //Si da 0, devuelvo el cliente y el numero de cola, tambien aumento el contador
      if X.Clave = 0 then
      begin
        Cadena := Cadena + 'Cliente ' + Cola3.ToString + ' - Cola 3'  + #13#10;
        Cola3 := Cola3 + 1;
      end
      else
      //Si no es 0, directamente encolo el resultado que quedo
      begin
        C3.Encolar(X);
      end;
    end;
  end;
  //Devuelvo el string con las colas que fueron atendidas
  Result := Cadena;
end;

end.
