object Ejercicico6y7: TEjercicico6y7
  Left = 0
  Top = 0
  ActiveControl = Memo1
  Caption = 'Ejercicico6y7'
  ClientHeight = 520
  ClientWidth = 866
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 232
    Top = 24
    Width = 154
    Height = 16
    Caption = 'Ingresa la patente del auto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 128
    Width = 89
    Height = 13
    Caption = 'Fecha de entrada:'
  end
  object Label3: TLabel
    Left = 655
    Top = 128
    Width = 78
    Height = 13
    Caption = 'Fecha de salida:'
  end
  object Label4: TLabel
    Left = 16
    Top = 200
    Width = 130
    Height = 13
    Alignment = taCenter
    Caption = 'Ingrese horario de entrada'
  end
  object Label5: TLabel
    Left = 655
    Top = 200
    Width = 119
    Height = 13
    Alignment = taCenter
    Caption = 'Ingrese horario de salida'
  end
  object Label6: TLabel
    Left = 232
    Top = 56
    Width = 176
    Height = 16
    Alignment = taCenter
    Caption = 'Ejemplo de Patente:  AB123CD'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 90
    Top = 349
    Width = 297
    Height = 16
    Caption = 'Ingrese la fecha para determinar cuanto se percibio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 58
    Top = 420
    Width = 104
    Height = 16
    Caption = 'Rango de fechas: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 182
    Top = 421
    Width = 35
    Height = 16
    Caption = 'Desde'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 436
    Top = 421
    Width = 36
    Height = 16
    Caption = 'hasta:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 224
    Top = 88
    Width = 401
    Height = 209
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnGuardar: TButton
    Left = 19
    Top = 41
    Width = 169
    Height = 33
    Caption = 'Guardar auto'
    TabOrder = 1
    OnClick = btnGuardarClick
  end
  object btnRetirar: TButton
    Left = 672
    Top = 41
    Width = 169
    Height = 33
    Caption = 'Retirar auto'
    TabOrder = 2
    OnClick = btnRetirarClick
  end
  object Patente: TEdit
    Left = 400
    Top = 23
    Width = 169
    Height = 21
    TabOrder = 3
  end
  object Fecha_Entrada: TDateTimePicker
    Left = 16
    Top = 147
    Width = 186
    Height = 21
    Date = 44320.000000000000000000
    Time = 0.840964224538765800
    TabOrder = 4
  end
  object Fecha_Salida: TDateTimePicker
    Left = 655
    Top = 147
    Width = 186
    Height = 21
    Date = 44320.000000000000000000
    Time = 0.840964224538765800
    TabOrder = 5
  end
  object horaEntrada: TTimePicker
    Left = 35
    Top = 219
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 6
    Time = 44323.338924016210000000
    TimeFormat = 'hh:mm'
  end
  object horaSalida: TTimePicker
    Left = 672
    Top = 219
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 7
    Time = 44323.338924027780000000
    TimeFormat = 'hh:mm'
  end
  object Fecha_a_Percibir: TDateTimePicker
    Left = 423
    Top = 344
    Width = 186
    Height = 27
    Date = 44320.000000000000000000
    Time = 0.840964224538765800
    TabOrder = 8
  end
  object BtnPercibir: TButton
    Left = 655
    Top = 345
    Width = 78
    Height = 27
    Caption = 'Calcular'
    TabOrder = 9
    OnClick = BtnPercibirClick
  end
  object Fecha_Hasta: TDateTimePicker
    Left = 487
    Top = 416
    Width = 186
    Height = 27
    Date = 44320.000000000000000000
    Time = 0.840964224538765800
    TabOrder = 10
  end
  object Fecha_Desde: TDateTimePicker
    Left = 232
    Top = 416
    Width = 186
    Height = 27
    Date = 44320.000000000000000000
    Time = 0.840964224538765800
    TabOrder = 11
  end
  object BtnRangoFechas: TButton
    Left = 696
    Top = 417
    Width = 78
    Height = 25
    Caption = 'Calcular'
    TabOrder = 12
    OnClick = BtnRangoFechasClick
  end
end
