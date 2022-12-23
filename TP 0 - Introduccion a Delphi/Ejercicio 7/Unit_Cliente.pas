unit Unit_Cliente;

interface

uses
  SysUtils;

const
  min = 1; //Espacio minimo de la cantidad de clientes
  max = 1000; //Espacio maximo de la cantidad de clientes
  salto = #13#10; //Salto de linea

type

  Cliente = record //Record de los clientes
      Razon_social : String[50];
      Domicilio: String[50];
      Localidad: String[50];
      TE: longint; //bigint
      Mail: String[100];
      MarcaBorrado: Boolean; //Bandera que me marca si esta activo o no el cliente
      //True: Activado - False:Desactivado
  end;
  //Objeto con la lista de todos los clientes
  Clientes = Object
    private
      Lista_Clientes: Array[min..max] of Cliente;
    public
      procedure Crear();
      function alta(codigo,te: longint; razon,domicilio,localidad,mail: String):boolean;
      function baja(codigo: longint): boolean;
      function modificacion(codigo,te: longint; razon,domicilio,localidad,mail: String): boolean;
      function mostrarCliente(codigo: Integer): String;
      function filtrar(razon: String): String;
      function mostrarTodo(): String;
  End;

implementation

//Creacion de la lista de clientes vacia
procedure Clientes.Crear;
var i: integer;
begin
  for i := min to max do //Recorro toda la lista, poniendo valores en 0 o ''
  begin
    Lista_Clientes[i].TE := 0;
    Lista_Clientes[i].Razon_social := '';
    Lista_Clientes[i].Domicilio := '';
    Lista_Clientes[i].Localidad := '';
    Lista_Clientes[i].Mail := '';
    Lista_Clientes[i].MarcaBorrado := False; //falso para que no exista
  end;
end;

//ALTA DE UN CLIENTE
function Clientes.alta(codigo: Integer; te: Integer;
  razon: string; domicilio: string; localidad: string; mail: string):boolean;
var agregado: boolean;
begin
  agregado := false;
  if Lista_Clientes[codigo].MarcaBorrado = false then //Consulto si esta ocupado por un cliente
  begin
    //Subo los datos
    Lista_Clientes[codigo].TE := te;
    Lista_Clientes[codigo].Razon_social := razon;
    Lista_Clientes[codigo].Domicilio := domicilio;
    Lista_Clientes[codigo].Localidad := localidad;
    Lista_Clientes[codigo].Mail := mail;
    Lista_Clientes[codigo].MarcaBorrado := True;
    agregado := true;
  end;
  result := agregado; //Devuelvo por verdadero o falso si se cargaron los datos
end;

//BAJA DE UN CLIENTE
function Clientes.baja(codigo: Integer): Boolean;
var borrado: boolean;
begin
  borrado := false;
  if Lista_Clientes[codigo].MarcaBorrado = True then //Existe el cliente
  begin
    Lista_Clientes[codigo].MarcaBorrado := False; //Borro solo la marca,
    //no los datos, en el caso de que se quiera habilitar devuelta
    //BAJA LOGICA
    borrado := true;
  end;
  Result := borrado;
end;

//MODIFICACION
function Clientes.modificacion(codigo: Integer; te: Integer;
  razon: string; domicilio: string; localidad: string; mail: string): Boolean;
var modificado: boolean;
begin
  modificado := false;
  if Lista_Clientes[codigo].MarcaBorrado = True then //Existe el cliente
  begin
    //Cambio todos los datos
    Lista_Clientes[codigo].TE := te;
    Lista_Clientes[codigo].Razon_social := razon;
    Lista_Clientes[codigo].Domicilio := domicilio;
    Lista_Clientes[codigo].Localidad := localidad;
    Lista_Clientes[codigo].Mail := mail;
    Lista_Clientes[codigo].MarcaBorrado := True;
    modificado := true;
  end;
  Result := modificado;
end;

//Mostrar el cliente segun el codigo
function Clientes.mostrarCliente(codigo: Integer): String;
var texto : String;
begin
  texto :=
  'Codigo: ' + codigo.ToString + salto  +
  'Razon social: ' + Lista_Clientes[codigo].Razon_social + salto +
  'Domicilio: ' + Lista_Clientes[codigo].Domicilio + salto +
  'Localidad: ' + Lista_Clientes[codigo].Localidad + salto +
  'TE: ' + Lista_Clientes[codigo].TE.ToString + salto +
  'Mail: ' + Lista_Clientes[codigo].Mail + salto;
  result := texto;
end;

//Filtrar por razon social un cliente
function Clientes.filtrar(razon: string): string;
var
texto: String;
i: integer;
begin
  for i := min to max do //Recorro todo
  begin
    if Lista_Clientes[i].Razon_social = razon then //Si coinciden las razones
    begin
      texto := texto + mostrarCliente(i); //Muestro el cliente
    end;
  end;
  result := texto; //Devuelve todos los que coinciden
end;

//Mostrar todos los clientes habilitados
function Clientes.mostrarTodo(): String;
var i: integer;
texto: String;
begin
  texto := '';
  for i := min to max do //Recorro todos los clientes
  begin
    if Lista_Clientes[i].MarcaBorrado = true then //Aquellos que existan...
    begin
      texto := texto + mostrarCliente(i); //Los muestro
    end;
  end;
  Result := texto; //Devuelvo
end;

end.
