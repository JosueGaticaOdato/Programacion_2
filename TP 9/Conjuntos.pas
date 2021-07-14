unit Conjuntos;

interface

Uses
  Tipos, ListPointer, stdctrls, SysUtils, Variants;

Type
  Conjunto = Object
  Private
    Items: Lista;
    TDatoDeLaClave: TipoDatosClave;
  Public
    // Comportamiento del objeto (Operaciones)
    Function Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Errores;
    Function EsVacio(): Boolean;
    Function EsLLeno(): Boolean;
    Function Agregar(X: TipoElemento): Errores;
    Function Borrar(X: TipoElemento): Errores;
    Function BorrarPosicion(PLogica: Integer): Errores;
    Function Recuperar(PLogica: Integer): TipoElemento;
    Function RetornarClaves(): String;
    // operaciones tipicas de conjuntos
    Function Interseccion(Var C: Conjunto): Conjunto;
    Function Union(Var C: Conjunto): Conjunto;
    Function Diferencia(Var C: Conjunto): Conjunto;
    Function Pertenece(X: TipoElemento): Boolean;
    // operaciones generales
    Function LlenarClavesRandom(alSize: LongInt;
      RangoDesde, RangoHasta: LongInt): Errores;
    Function CantidadElementos: LongInt;
    Function DatoDeLaClave: TipoDatosClave;
    Function SizeSet(): LongInt;
    Function MaxSizeSet(): LongInt;
    // Ordenar
    Procedure Sort();
  End;

  // Escribir la implementación del Objeto CONJUNTO
implementation

// Crea el conjunto vacio
Function Conjunto.Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Errores;
Begin
  Crear := Items.Crear(avTipoClave, alSize);
  TDatoDeLaClave := avTipoClave;
End;

// control de conjunto vacio
Function Conjunto.EsVacio(): Boolean;
Begin
  EsVacio := Items.EsVacia;
End;

// control de conjunto lleno
Function Conjunto.EsLLeno(): Boolean;
Begin
  EsLLeno := Items.EsLLena;
End;

// Agrega un elemento al conjunto
Function Conjunto.Agregar(X: TipoElemento): Errores;
Begin
  // controlo el tipo de dato de la clave
  if X.TipoDatoClave(X.Clave) <> TDatoDeLaClave then
  Begin
    Agregar := ClaveIncompatible;
    Exit;
  End;
  // Controla que no exista
  if Items.Buscar(X) <> Nulo then
  Begin
    Agregar := ClaveDuplicada;
    Exit;
  End; // Ahora lo agrego
  Agregar := Items.Agregar(X);
End;

// Busca un elemento dentro del conjunto en función de un dato
// Borra el elemento si lo encuentra
Function Conjunto.Borrar(X: TipoElemento): Errores;
Var
  Q: PosicionLista;
Begin
  Borrar := Cerror;
  // controlo el tipo de dato de la clave
  if X.TipoDatoClave(X.Clave) <> TDatoDeLaClave then
  Begin
    Borrar := ClaveIncompatible;
    Exit;
  End;
  // ahora lo borra
  Q := Items.Buscar(X);
  If Q <> Nulo Then
    Borrar := Items.Eliminar(Q);
End;

// retorna por referencia en X el elemento del conjunto
Function Conjunto.Recuperar(PLogica: Integer): TipoElemento;
Var
  Q: PosicionLista;
  X: TipoElemento;
Begin
  Recuperar := X.TipoElementoVacio;
  Q := Items.Ordinal(PLogica);
  If Q <> Nulo Then
    Recuperar := Items.Recuperar(Q);
End;

// Ordena el conjunto. Ordena los strings sencible a Mayusculas y Minusculas
Procedure Conjunto.Sort();
Begin
  Items.Sort(True);
End;

// Retorna un string con todos los elementos del conjunto
Function Conjunto.RetornarClaves(): String;
Begin
  RetornarClaves := Items.RetornarClaves;
End;

// Cantidad de elementos del conjunto
Function Conjunto.CantidadElementos: LongInt;
Begin
  CantidadElementos := Items.CantidadElementos;
End;

// Llena el conjunto de 0 a <RangoHasta> el atributo DI de la lista
// Llena el conjunto de 0 a <RangoHasta> el atributo DI de la lista
Function Conjunto.LlenarClavesRandom(alSize: LongInt;
  RangoDesde, RangoHasta: LongInt): Errores;
Var
  X: TipoElemento;
Begin
  Randomize;
  TDatoDeLaClave := Numero;
  If Items.Crear(TDatoDeLaClave, alSize) <> OK Then
  Begin
    LlenarClavesRandom := Cerror;
    Exit;
  End;
  // Ahora lo lleno random
  X.Inicializar(TDatoDeLaClave, '');
  while Not Items.EsLLena Do
  Begin
    X.Clave := RangoDesde + Random(RangoHasta);
    if Items.Buscar(X) = Nulo then
    Begin
      Items.Agregar(X);
    End;
  End;
  LlenarClavesRandom := OK;
End;

// Borrar por posición lógica dentro del conjunto
Function Conjunto.BorrarPosicion(PLogica: Integer): Errores;
Var
  Q: PosicionLista;
Begin
BorrarPosicion := Cerror;

Q := Items.Ordinal(PLogica);
If Q <> Nulo Then begin
  BorrarPosicion := Items.Eliminar(Q);
End;
end;

// ---------------------------------------------------------------
// Funciones típicas de un conjunto
// ---------------------------------------------------------------
// Retorna True si el elemento pertenece al menos 1 vez al conjunto
Function Conjunto.Pertenece(X: TipoElemento): Boolean;
Begin
  Pertenece := False;
  If Items.Buscar(X) <> Nulo Then
    Pertenece := True;
End;

// Retorna un conjunto INTERSECCION del mismo con <C>
Function Conjunto.Interseccion(Var C: Conjunto): Conjunto;
Var
  Q: PosicionLista;
  CI: Conjunto;
  X: TipoElemento;
Begin
  CI.Crear(TDatoDeLaClave, SizeSet());
  // Controlo que si uno de los 2 conjuntos es vació no hay intersección
  If Items.EsVacia Or C.EsVacio Then
    Interseccion := CI
  Else
  Begin
    Q := Items.Comienzo;
    While Q <> Nulo Do
    Begin
      X := Items.Recuperar(Q);
      // Lo Busco en C para Saber si esta
      If C.Pertenece(X) = True Then
      Begin
        CI.Agregar(X);
      End;
      Q := Items.Siguiente(Q);
    End;
  End;
  // Retorno el conjunto intersección
  Interseccion := CI;
End;

// Retorna un conjunto UNION del mismo con <C>
Function Conjunto.Union(Var C: Conjunto): Conjunto;
Var
  Q: PosicionLista;
  CU: Conjunto;
  X: TipoElemento;
Begin
  CU.Crear(TDatoDeLaClave, (Items.SizeList + C.SizeSet));
  // Paso Todos los elementos de conjunto
  Q := Items.Comienzo;
  While Q <> Nulo Do
  Begin
    X := Items.Recuperar(Q);
    CU.Agregar(X);
    Q := Items.Siguiente(Q);
  End;
  // Agrego todos los elementos del conjunto C incluso lo repetidos
  Q := C.Items.Comienzo;
  While Q <> Nulo Do
  Begin
    X := C.Items.Recuperar(Q);
    CU.Agregar(X);
    Q := C.Items.Siguiente(Q);
  End;
  // Retorno el conjunto Unión
  Union := CU;
End;

// Retorna un conjunto con la diferencia del mismo sobre <C>
Function Conjunto.Diferencia(Var C: Conjunto): Conjunto;
Var
  Q: PosicionLista;
  CD: Conjunto;
  X: TipoElemento;
Begin
  CD.Crear(TDatoDeLaClave, SizeSet());
  // Controlo que si alguno de los conjuntos es vacio
  If Items.EsVacia Then
    Diferencia := CD
  Else
    Begin
    Q := Items.Comienzo;
    End;
  While Q <> Nulo Do
  Begin
    X := Items.Recuperar(Q);
    // Lo Busco en C para Saber si esta
    If Not C.Pertenece(X) Then
      CD.Agregar(X);
    Q := Items.Siguiente(Q);
  End;

// Retorno el conjunto Diferencia
Diferencia := CD;
End;

Function Conjunto.DatoDeLaClave: TipoDatosClave;
Begin
  DatoDeLaClave := TDatoDeLaClave;
End;

Function Conjunto.SizeSet(): LongInt;
Begin
  SizeSet := Items.SizeList;
End;

Function Conjunto.MaxSizeSet(): LongInt;
Begin
  MaxSizeSet := MAX;
End;

End.
