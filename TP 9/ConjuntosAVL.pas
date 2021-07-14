unit ConjuntosAVL;

interface

Uses Tipos, ArbolesBinariosAVL, stdctrls, SysUtils, Variants;

Type
  Conjunto = Object
  Private
    Items: ArbolAVL;
    TDatoDeLaClave: TipoDatosClave;
    Function RetornarPosFisica(PosLogica: Integer): PosicionArbol;
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
    Procedure Sort();
  End;

  // Escribir la implementación del Objeto CONJUNTO
implementation

// crea el conjunto vacio
Function Conjunto.Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Errores;
Begin
  Crear := Items.Crear(avTipoClave, alSize);
  TDatoDeLaClave := avTipoClave;
End;

// control de conjunto vacio
Function Conjunto.EsVacio(): Boolean;
Begin
  EsVacio := Items.EsVacio()
End;

// control de conjunto lleno
Function Conjunto.EsLLeno(): Boolean;
Begin
  EsLLeno := Items.EsLLeno();
End;

// Agrega un elemento al conjunto
Function Conjunto.Agregar(X: TipoElemento): Errores;
Begin
  // Controlo el tipo de dato de la clave
  if X.TipoDatoClave(X.Clave) <> TDatoDeLaClave then
  Begin
    Agregar := ClaveIncompatible;
    Exit;
  End;
  // No permite elemento repetidos
  if Items.BusquedaBinaria(X) <> Nulo then
  Begin
    Agregar := ClaveDuplicada;
    Exit;
  End;
  // Ahora los agrego
  Agregar := Items.Insertar(X);
End; // Busca un elemento dentro del conjunto en función de un dato

// Borra el elemento si lo encuentra
Function Conjunto.Borrar(X: TipoElemento): Errores;
Begin
  // Controlo el tipo de dato de la clave
  if X.TipoDatoClave(X.Clave) <> TDatoDeLaClave then
  Begin
    Borrar := ClaveIncompatible;
    Exit;
  End;
  // Ahora lo mando a Borrar
  Borrar := Items.Eliminar(X);
End;

// retorna recorriendo en orden el arbol AVL la posicion fisica
// respecto a la posicion logica
Function Conjunto.RetornarPosFisica(PosLogica: Integer): PosicionArbol;
Var
  Q: PosicionArbol;
  I: Integer;
  // Proceso interno
  Procedure IO(P: PosicionArbol);
  Begin
    If Not Items.ramanula(P) Then
    Begin
      IO(Items.hijoizquierdo(P));
      Inc(I);
      If I = PosLogica Then
      Begin
        Q := P;
        Exit;
      End;
      IO(Items.hijoderecho(P));
    End;
  End;

// Cuerpo principal
Begin
  Q := Nulo;
  I := 0;
  If PosLogica > Items.cantidadnodos Then
    RetornarPosFisica := Nulo
  Else
    IO(Items.root);
  RetornarPosFisica := Q;
End;

// retorna por referencia en X el elemento del conjunto
Function Conjunto.Recuperar(PLogica: Integer): TipoElemento;
Var
  Q: PosicionArbol;
  X: TipoElemento;
Begin
  Recuperar := X.TipoElementoVacio;
  Q := RetornarPosFisica(PLogica);
  If Q <> Nulo Then
    Recuperar := Items.Recuperar(Q);
End;

// Ordena el conjunto. Ordena los strings sencible a Mayusculas y Minusculas
Procedure Conjunto.Sort();
Begin
End;

// Retorna un string con todos los elementos del conjunto
Function Conjunto.RetornarClaves(): String;
Begin
  RetornarClaves := Items.inorden()
End;

// Cantidad de elementos del conjunto
Function Conjunto.CantidadElementos: LongInt;
Begin
  CantidadElementos := Items.cantidadnodos;
End;

// Llena el conjunto de 0 a <RangoHasta> el atributo DI de la lista
Function Conjunto.LlenarClavesRandom(alSize: LongInt;
  RangoDesde, RangoHasta: LongInt): Errores;
Var
  X: TipoElemento;
Begin
  Randomize;
  TDatoDeLaClave := Numero;
  If Items.Crear(TDatoDeLaClave, alSize) <> OK Then begin
    Begin
    LlenarClavesRandom := CError;
    End;
  Exit;
  End;
// Ahora lo lleno random
  X.Inicializar(TDatoDeLaClave, '');
while Not Items.EsLLeno Do
Begin
  X.Clave := RangoDesde + Random(RangoHasta);
  if Items.BusquedaBinaria(X) = Nulo then
  Begin
    Items.Insertar(X);
  End;
End;
LlenarClavesRandom := OK;
End;

// Borrar por posición lógica dentro del conjunto
Function Conjunto.BorrarPosicion(PLogica: Integer): Errores;
Var
  Q: PosicionArbol;
  X: TipoElemento;
Begin
  BorrarPosicion := CError;
  Q := RetornarPosFisica(PLogica);
  If Q <> Nulo Then
  Begin
    X := Items.Recuperar(Q);
    If Items.BusquedaBinaria(X) = Q Then
    Begin
      BorrarPosicion := Items.Eliminar(X);
      Exit;
    End;
  End;
End;

// ---------------------------------------------------------------
// Funciones típicas de un conjunto
// ---------------------------------------------------------------
// Retorna True si el elemento pertenece al menos 1 vez al conjunto
Function Conjunto.Pertenece(X: TipoElemento): Boolean;
Begin
  Pertenece := False;
  If Items.BusquedaBinaria(X) <> Nulo Then
    Pertenece := True;
End;

// Retorna un conjunto INTERSECCION del mismo con <C>
Function Conjunto.Interseccion(Var C: Conjunto): Conjunto;
Var
  CI: Conjunto;
  X: TipoElemento;
  // Proceso interno que resuelve la interseccion
  Procedure IO(P: PosicionArbol);
  Begin
    If Not Items.ramanula(P) Then
    Begin
      IO(Items.hijoizquierdo(P));
      X := Items.Recuperar(P);
      If C.Pertenece(X) = True Then
        CI.Agregar(X);
      IO(Items.hijoderecho(P));
    End;
  End;

// De la funcion Principal
Begin
  CI.Crear(TDatoDeLaClave, SizeSet());
  // Controlo que si uno de los 2 conjuntos es vació no hay intersección
  If Items.EsVacio Or C.EsVacio Then
    Interseccion := CI
  Else
    IO(Items.root);
  // Retorno el conjunto intersección
  Interseccion := CI;
End;

// Retorna un conjunto UNION del mismo con <C>
Function Conjunto.Union(Var C: Conjunto): Conjunto;
Var
  CU: Conjunto;
  X: TipoElemento;
  I, Q: Integer;
  // Proceso interno
  Procedure IO(P: PosicionArbol);
  Begin
    If Not Items.ramanula(P) Then
    Begin
      IO(Items.hijoizquierdo(P));
      X := Items.Recuperar(P);
      CU.Agregar(X);
      IO(Items.hijoderecho(P));
    End;
  End;

// cuerpo de la funcion principal
Begin
  CU.Crear(TDatoDeLaClave, (SizeSet() + C.SizeSet));
  // Paso Todos los elementos de conjunto
  IO(Items.root);
  // Agrego todos los elementos del conjunto C incluso lo repetidos
  For I := 1 To C.CantidadElementos Do
  Begin
    X := C.Recuperar(I);
    CU.Agregar(X);
  End;
  // Retorno el conjunto Unión
  Union := CU;
End;

// Retorna un conjunto con la diferencia del mismo sobre <C>
Function Conjunto.Diferencia(Var C: Conjunto): Conjunto;
Var
  CD: Conjunto;
  X: TipoElemento;
  // Proceso interno que resuelve la interseccion
  Procedure IO(P: PosicionArbol);
  Begin
    If Not Items.ramanula(P) Then
    Begin
      IO(Items.hijoizquierdo(P));
      X := Items.Recuperar(P);
      If Not C.Pertenece(X) Then
        CD.Agregar(X);
      IO(Items.hijoderecho(P));
    End;
  End;

// Funcion principal
Begin
  CD.Crear(TDatoDeLaClave, SizeSet());
  // Controlo que si alguno de los conjuntos es vacio
  If Items.EsVacio Then
    Diferencia := CD
  Else
    IO(Items.root);
  // Retorno el conjunto Diferencia
  Diferencia := CD;
End;

Function Conjunto.DatoDeLaClave: TipoDatosClave;
Begin
  DatoDeLaClave := TDatoDeLaClave;
End;

Function Conjunto.SizeSet(): LongInt;
Begin
  SizeSet := Items.SizeTree;
End;

Function Conjunto.MaxSizeSet(): LongInt;
Begin
  MaxSizeSet := MAX;
End;

End.
