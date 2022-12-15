unit Unit_Congelador;

interface

uses
  SysUtils;

const
  Cant_Sabores = 4;

type
  Sabores = (Chocolate, CremaAmericana, Frutilla, Limón);

  Balde = Record
    sabor: Sabores;
    cantidad: integer;
  End;

  (*
  Cono = Record
    peso: integer;
    sabores: Array of Sabores;
  End;*)

  Congelador = object
    private
      Baldes: Array of Balde;
    public
      procedure crearBaldes();
      procedure aumentarCantidadHelado(sabor: Sabores;cantidad: Integer);
      function buscarSabor(sabor: Sabores): integer;
      function mostrarCantidades(): String;


  end;

implementation

procedure Congelador.crearBaldes;
var
i: integer;
begin
  for i := 0 to Cant_Sabores do
  begin
    Baldes[i].sabor := Sabores(i);
    Baldes[i].cantidad := 0;
  end;
end;

procedure Congelador.aumentarCantidadHelado(sabor: Sabores;cantidad: Integer);
var i: integer;
begin
  i := buscarSabor(sabor);
  Baldes[i].cantidad := cantidad;
end;

function Congelador.buscarSabor(sabor: Sabores): integer;
var
i: integer;
encontrado: boolean;
begin
  encontrado := false;
  i := 0;
  while (i < cant_Sabores) and (not encontrado) do
  begin
    if Baldes[i].sabor = sabor then
    begin
      encontrado := true;
    end
    else
    begin
      inc(i);
    end;
  end;
  buscarSabor := i;
end;

function Congelador.mostrarCantidades: string;
var
i: integer;
texto: String;
begin
  for i := 0 to Cant_Sabores do
  begin
    texto := texto + 'Sabor:'  + Sabores(i) + ' - Cantidad: '
    + inttostr(Baldes[i].cantidad);
  end;
end;
end.
