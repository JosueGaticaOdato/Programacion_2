unit PacManTAD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Tipos,
  //ListArray;
  ListCursor;
  //ListPointer;

Const
  Perdiste = -1;

type
  PacMan = Object
    private
      L: Lista; //Tengo como atributo la lista
    public
      //Comportamiento
      procedure Inicializar(Tamaño: Integer);
      function Devolver_Lista(): Lista;
      procedure Cargar_Objeto(Objeto: TipoElemento);
      function Sumatoria (): String;
  End;

implementation

//Iniciliazar el contenido de la lista, dando determinado tamaño
procedure Pacman.Inicializar(Tamaño: Integer);
begin
  L.Crear(Cadena,Tamaño);
end;

//Devuelve la lista
function Pacman.Devolver_Lista(): Lista;
begin
  Result := L;
end;

//Complejidad Algoritimica: Lineal (Aumentar el final, Agregar elemento en ese final)
//Procedimiento que realiza la carga de objetos en la lista
procedure Pacman.Cargar_Objeto(Objeto: TipoElemento);
var P: PosicionLista;
begin
  L.Agregar(Objeto);
end;

//Complejida algoritmica: Lineal (Recuperar elemento de la lista, condicionales para
//saber de que elemento se trata, Sumar un contador)
//Funcion que realiza la suma de puntos
function PacMan.Sumatoria (): String;
var P: PosicionLista;
  Sumador: Integer;
  Contador_de_Bonus: Integer;
  Bandera: Boolean;
begin
  //Paso la primera posicion, inicializo el sumador, el contador de bonus y la bandera
  P := L.Comienzo;
  Sumador := 0;
  Bandera := True;
  Contador_de_Bonus := 0;
  //Mientras no llegue al final y no me halla topado con un fantasma sin bonus
  while (P <> Nulo) and (Bandera) do
  begin
    //Si comio un bonus, inicializa el bonus
    if L.Recuperar(P).Clave = 'Bonus' then
    begin
        Contador_de_Bonus := 1;
    end
    //Si el pac-man come mientras esta el bonus activo, se multiplica el puntaje
    else if (Contador_de_Bonus >= 1) and (Contador_de_Bonus <= 10) then
    begin
      Sumador := Sumador + (L.Recuperar(P).Valor1 * 2);
      Contador_de_bonus := Contador_de_bonus + 1;
    end
    //En caso de que se haya comido el fantasma sin el bonus, pierde el juego
    else if (L.Recuperar(P).Clave = 'Fantasma') and ((Contador_de_Bonus = 0) or (Contador_de_Bonus > 10)) then
    begin
      Bandera := False;
      Sumador := Perdiste;
    end
    else
    begin
      //Carga de puntos sin el bonus
      Sumador := Sumador + L.Recuperar(P).Valor1;
    end;
    //Siempre sube la posicion por cada paso
    P := L.Siguiente(P);
  end;
  Result := Sumador.ToString;
end;

end.
