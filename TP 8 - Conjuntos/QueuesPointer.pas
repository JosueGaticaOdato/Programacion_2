unit QueuesPointer;

interface

Uses
  Tipos, stdctrls, SysUtils;

Const
  MIN = 1; // No usada en esta implementacion, solo se mantiene x compatibilidad
  MAX = 2000; // Tamaño maximo de la cola
  Nulo = NIL; // posicion NO valida del frente o final

Type
  PosicionCola = ^NodoCola;

  NodoCola = Object
    Datos: TipoElemento;
    Prox: PosicionCola;
  End;

  Cola = Object
  Private
    Inicio, Fin: PosicionCola;
    Q_Items: Integer;
    TDatoDeLaClave: TipoDatosClave;
    Size: LongInt;
    Function CantidadItems(): LongInt;
  Public
    Function Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Errores;
    Function EsVacia(): Boolean;
    Function EsLlena(): Boolean;
    Function Encolar(X: TipoElemento): Errores;
    Function DesEncolar(): Errores;
    Function Recuperar(): TipoElemento;
    Function RetornarClaves(): String;
    Function InterCambiar(Var CAux: Cola; bCrearVacia: Boolean): LongInt;
    Function LLenarClavesRandom(alSize: LongInt;
      RangoDesde, RangoHasta: LongInt): Errores;
    Function Frente(): PosicionCola;
    Function Final(): PosicionCola;
    Function DatoDeLaClave: TipoDatosClave;
    Function SizeQueue(): LongInt;
    Function MaxSizeQueue(): LongInt;
  End;

implementation

// Crea la cola vacia
Function Cola.Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Errores;
Begin
  if alSize < MIN then
    Crear := CError;
  if alSize > MAX then
    Crear := CError;
  if (alSize >= MIN) And (alSize <= MAX) then
  Begin
    Inicio := Nulo;
    Fin := Nulo;
    Q_Items := 0;
    TDatoDeLaClave := avTipoClave;
    Size := alSize;
    Crear := OK;
  End;
End;

// control de cola vacia
Function Cola.EsVacia(): Boolean;
Begin
  EsVacia := (Inicio = Nulo);
End;

// control de cola llena
Function Cola.EsLlena(): Boolean;
Begin
  EsLlena := (Q_Items = Size);
End;

// Agrega un Items a la Cola
Function Cola.Encolar(X: TipoElemento): Errores;
Var
  Q: PosicionCola;
Begin
  Encolar := CError;
  // Controla que el Tipo de Dato de la Clave sea Homogeneo a la Lista
  if X.TipoDatoClave(X.Clave) <> TDatoDeLaClave then
  Begin
    Encolar := ClaveIncompatible;
    Exit;
  End;
  // Ahora Encolo
  If EsLlena() Then
    Encolar := LLena
  Else
  Begin
    New(Q); // Tomo memoria dinamica
    Q^.Prox := Nulo;
    If EsVacia() Then
      Inicio := Q
    Else
      Fin^.Prox := Q;
    Q^.Datos := X;
    Fin := Q;
    Inc(Q_Items);
    Encolar := OK;
  End;
End;

// Elimina un item de la Cola. Siempre al Final
Function Cola.DesEncolar(): Errores;
Var
  Q: PosicionCola;
Begin
  DesEncolar := CError;
  If EsVacia() Then
    DesEncolar := Vacia
  Else
  Begin
    Q := Inicio;
    Inicio := Inicio^.Prox;
    Dec(Q_Items);
    Dispose(Q);
    DesEncolar := OK;
  End;
End;

// retorna el elemento del frente de la cola
Function Cola.Recuperar(): TipoElemento;
Var
  X: TipoElemento;
Begin
  Recuperar := X.TipoElementoVacio;
  If Not EsVacia() Then
  Begin
    Recuperar := Inicio^.Datos;
  End;
End;

// Pasa los elementos de una Cola Auxiliar a la Cola "Cola"
Function Cola.InterCambiar(Var CAux: Cola; bCrearVacia: Boolean): LongInt;
Var
  X: TipoElemento;
  I: LongInt;
Begin
  I := 0;
  If bCrearVacia = true Then
    Crear(TDatoDeLaClave, CAux.SizeQueue);
  While Not CAux.EsVacia() Do
  Begin
    X := CAux.Recuperar();
    If Encolar(X) = OK Then
      Inc(I);
    CAux.DesEncolar;
  End;
  InterCambiar := I;
End;

// Retorna un string con todos los elementos de Cola
// Cada Item separado por Retorno de Carro + Final de Linea
Function Cola.RetornarClaves(): String;
Var
  X: TipoElemento;
  S, SS: String;
  CAux: Cola;
Begin
  SS := '';
  CAux.Crear(TDatoDeLaClave, Size);
  While Not EsVacia() Do
  Begin
    X := Recuperar();
    CAux.Encolar(X);
    S := X.ArmarString;
    SS := SS + S + cCRLF;
    DesEncolar();
  End;
  InterCambiar(CAux, true);
  RetornarClaves := SS;
End;

// Llena la cola con valores aletarios en el atributo DI
// desde <RangoDesde> hasta <RangoHasta>
Function Cola.LLenarClavesRandom(alSize: LongInt;
  RangoDesde, RangoHasta: LongInt): Errores;
Var
  X: TipoElemento;
Begin
  TDatoDeLaClave := Numero;
  If Crear(TDatoDeLaClave, alSize) <> OK Then
  Begin
    LLenarClavesRandom := CError;
    Exit;
  End;
  // Ahora lo lleno random
  X.Inicializar(TDatoDeLaClave, '');
  Randomize;
  While Not EsLlena Do
  Begin
    X.Clave := RangoDesde + Random(RangoHasta);
    Encolar(X);
  End;
  LLenarClavesRandom := OK;
End;

// retorno posicion del frente
Function Cola.Frente(): PosicionCola;
Begin
  Frente := Inicio;
End;

// retorno posicion del final
Function Cola.Final(): PosicionCola;
Begin
  Final := Fin;
End;

// Retorno la cantidad de elementos
Function Cola.CantidadItems(): LongInt;
Begin
  CantidadItems := Q_Items;
End;

Function Cola.DatoDeLaClave: TipoDatosClave;
Begin
  DatoDeLaClave := TDatoDeLaClave;
End;

Function Cola.SizeQueue(): LongInt;
Begin
  SizeQueue := Size;
End;

Function Cola.MaxSizeQueue(): LongInt;
Begin
  MaxSizeQueue := MAX;
End;

end.
