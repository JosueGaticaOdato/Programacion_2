unit StackCursor;

interface

Uses Tipos, stdctrls, SysUtils, Variants;

Const
  MIN = 1; // Inicio del cursor
  MAX = 2000; // Fin del cursor
  Nulo = 0; // Posicion NO valida del TOPE de la pila

Type
  PosicionPila = LongInt;

  NodoPila = Object
    Datos: TipoElemento;
    Prox: PosicionPila;
  End;

  Pila = Object
  Private
    Cursor: Array Of NodoPila;
    Inicio, Libre: PosicionPila;
    Q_Items: Integer;
    TDatoDeLaClave: TipoDatosClave;
    Size: LongInt;
    Function CantidadElementos(): LongInt;
  Public
    Function Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Errores;
    Function EsVacia(): Boolean;
    Function EsLlena(): Boolean;
    Function Apilar(X: TipoElemento): Errores;
    Function DesApilar(): Errores;
    Function Recuperar(): TipoElemento;
    Function RetornarClaves(): String;
    Function InterCambiar(Var PAux: Pila; bCrearVacia: Boolean): LongInt;
    Function LlenarClavesRandom(alSize: LongInt;
      RangoDesde, RangoHasta: LongInt): Errores;
    Function Tope(): PosicionPila;
    Function DatoDeLaClave: TipoDatosClave;
    Function SizeStack(): LongInt;
    Function MaxSizeStack(): LongInt;
  End;

implementation

// Crea la pila vacia
Function Pila.Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Errores;
Var
  Q: PosicionPila;
Begin
  if alSize < MIN then
    Crear := CError;
  if alSize > MAX then
    Crear := CError;
  if (alSize >= MIN) And (alSize <= MAX) then
  Begin
    SetLength(Cursor, (alSize + 1));
    For Q := MIN To (alSize - 1) Do // Encadenamientos de Libres
      Cursor[Q].Prox := Q + 1;
    Cursor[alSize].Prox := Nulo;
    Libre := MIN;
    Inicio := Nulo;
    Q_Items := 0;
    TDatoDeLaClave := avTipoClave;
    Size := alSize;
    Crear := OK;
  End;
End;

// Control de pila vacia
Function Pila.EsVacia(): Boolean;
Begin
  EsVacia := (Inicio = Nulo);
End;

// Control de pila llena
Function Pila.EsLlena(): Boolean;
Begin
  EsLLena := (Libre = Nulo);
End;

// Agrega un elemento a la Pila
Function Pila.Apilar(X: TipoElemento): Errores;
Var
  Q: PosicionPila;
Begin
  Apilar := CError;
  If EsLlena() Then
    Apilar := Llena
  Else
  Begin
    Q := Libre; // Simula el NEW del puntero
    Libre := Cursor[Libre].Prox;
    Cursor[Q].Prox := Inicio; // Q^.prox
    Inicio := Q;
    Cursor[Q].Datos := X;
    Inc(Q_Items);
    Apilar := OK;
  End;
End;

// Elimina un elemento de la Pila. Siempre del Tope
Function Pila.DesApilar(): Errores;
Var
  Q: PosicionPila;
Begin
  DesApilar := CError;
  If EsVacia() Then
    DesApilar := Vacia
  Else
  Begin
    Q := Inicio;
    Inicio := Cursor[Inicio].Prox;
    Cursor[Q].Prox := Libre; // Retorna libres el nodo eliminado (Dispose)
    Libre := Q;
    Dec(Q_Items);
    DesApilar := OK;
  End;
End;

// retorna por referencia en X elelemento de la Pila. Siempre el Tope
Function Pila.Recuperar(): TipoElemento;
Var
  X: TipoElemento;
Begin
  Recuperar := X.TipoElementoVacio;
  If Not EsVacia() Then
  Begin
    Recuperar := Cursor[Inicio].Datos;
  End;
End;

// Pasa los Items de una Pila Auxiliar a la Pila "Pila"
Function Pila.InterCambiar(Var PAux: Pila; bCrearVacia: Boolean): LongInt;
Var
  X: TipoElemento;
  I: LongInt;
Begin
  I := 0;
  If bCrearVacia = true Then
    Crear(TDatoDeLaClave, Size);
  While Not PAux.EsVacia() Do
  Begin
    X := PAux.Recuperar();
    If Apilar(X) = OK Then
      Inc(I);
    PAux.DesApilar;
  End;
  InterCambiar := I;
End;

// Retorna un string con todos los elementos de Pila
// Cada elemento separado por Retorno de Carro + Final de Linea
Function Pila.RetornarClaves(): String;
Var
  X: TipoElemento;
  S, SS: String;
  PAux: Pila;
Begin
  SS := '';
  PAux.Crear(TDatoDeLaClave, Size);
  While Not EsVacia() Do
  Begin
    X := Recuperar();
    PAux.Apilar(X);
    S := X.ArmarString;
    SS := SS + S + cCRLF;
    DesApilar();
  End;
  InterCambiar(PAux, true);
  RetornarClaves := SS;
End;

// Llena la pila con valores random en el atributo DI
// desde <RangoDesde> hasta <RangoHasta>
Function Pila.LlenarClavesRandom(alSize: LongInt;
  RangoDesde, RangoHasta: LongInt): Errores;
Var
  X: TipoElemento;
Begin
  Randomize;
  TDatoDeLaClave := Numero;
  If Crear(TDatoDeLaClave, alSize) <> OK Then
  Begin
    LlenarClavesRandom := CError;
    Exit;
  End;
  // Ahora la lleno random
  X.Inicializar(TDatoDeLaClave, '');
  While Not EsLlena() Do
  Begin
    X.Clave := RangoDesde + Random(RangoHasta);
    Apilar(X);
  End;
  LlenarClavesRandom := OK;
End;

Function Pila.Tope(): PosicionPila;
Begin
  Tope := Inicio;
End;

Function Pila.CantidadElementos(): LongInt;
Begin
  CantidadElementos := Q_Items;
End;

Function Pila.DatoDeLaClave: TipoDatosClave;
Begin
  DatoDeLaClave := TDatoDeLaClave;
End;

Function Pila.SizeStack(): LongInt;
Begin
  SizeStack := Size;
End;

Function Pila.MaxSizeStack(): LongInt;
Begin
  MaxSizeStack := MAX;
End;

end.
