unit TADAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.DateUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Vcl.StdCtrls, Vcl.WinXPickers, Tipos,
  ListArray;
  //ListCursor;
  //ListPointer;

type
  //Enumerado con las actividades
  TActividad = (AlmuerzoDeNegocios,AtenderCliente,AtenderClienteVIP,ReunionGerente);

  //Record que contiene la hora del fin de la actividad y el indice para el puntero
  Activity = Record
    Hora_Fin : TTime;
    Indice: integer;
    End;

//Constantes del problema
const
  Un_Dia = 1440;
  Duraciones : Array [AlmuerzoDeNegocios..ReunionGerente]
    of Integer = (120,10,30,30);

type
  Agenda = Object
    private
      L: Lista; //Tengo como atributo la lista
    public
      procedure Crear(Max: Integer);
      procedure Agregar_agenda(Valor:TipoElemento);
      function Mostrar_Agenda(): String;
      procedure Ordenar_Agenda();
      function Actividad_Empleado(Hora: TTime): String;
      function Ocupacion():Integer;
  End;

implementation

//Crea la agenda
procedure Agenda.Crear(Max: Integer);
begin
  L.Crear(Cadena,Max);
end;

//Agregar actividad a la agenda
procedure Agenda.Agregar_agenda(Valor:TipoElemento);
begin
  L.Agregar(Valor);
end;

//Muestra la agenda
function Agenda.Mostrar_Agenda(): String;
begin
  Mostrar_Agenda := L.RetornarClaves;
end;

//Ordena la agenda
procedure Agenda.Ordenar_Agenda;
begin
  L.Sort(True);
end;

//Complejidad algoritimica: Lineal (Recorrer la lista, recuperar contenido,
                                //asignar,comparar si es la hora indica, devolver)
//Funcion que me devuelve que actividad tiene que hacer a esa hora
function Agenda.Actividad_Empleado(Hora: TTime): String;
var X: TipoElemento;
  P: PosicionLista;
  Bandera: Boolean;
  Hora_inicio, Hora_Final: TTime;
  Puntero: ^Activity;
  Devolucion: String;
begin
  //Devolucion es el string que devolvere, sera libre en caso de que
  //no tenga que hacer nada
  Devolucion := 'Libre';
  //Inicializo Posicion y Bandera
  P := L.Comienzo;
  Bandera := True;
  //Mientras P no sea una posicion no valida y no halla encontrado el valor
  while (P <> Nulo) and (Bandera) do
  begin
    //Recupero en esa posicion
    X := L.Recuperar(P);
    Hora_inicio := StrToTime(X.Clave);
    Puntero := X.Valor2;
    Hora_Final := Puntero^.Hora_Fin;
    //Si la hora dada se encuentra en ese lapso
    if ((TimeToStr(Hora) >= TimeToStr(Hora_inicio)) and (TimeToStr(Hora) <= TimeToStr(Hora_Final))) then
    begin
      //Devuelve la actividad que tiene que hacer
      Devolucion := X.Valor1;
      //La bandera quiere decir que ya lo encontre
      Bandera := False;
    end
    else
    begin
      //Tomo el siguiente en caso de no encontrar
      P := L.Siguiente(P);
    end;
  end;
  //Devuelve la actividad
  Result := Devolucion;
end;

//Complejidad algoritmica: Lineal(Recorrer la lista, recuperar contenido, asignar)
//Funcion que devuelve en minutos el tiempo de ocupacion
function Agenda.Ocupacion():Integer;
var Sumador: Integer;
  X: TipoElemento;
  P: PosicionLista;
  Puntero: ^Activity;
  Valor: Integer;
begin
  Sumador := 0;
  P := L.Comienzo;
  New(Puntero);
  //Mientras no sea una posicion que no exista
  while P <> Nulo do
  begin
    X := L.Recuperar(P);
    Puntero := X.Valor2;
    Valor := Duraciones[TActividad(Puntero^.Indice)];
    Sumador := Sumador + Valor;
  //Busco el siguiente de P
  P := L.Siguiente(P);
  end;
  //Devuelvo el total de minutos
  Result := Sumador;
end;

end.
