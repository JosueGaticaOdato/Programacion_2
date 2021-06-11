object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 8'
  ClientHeight = 206
  ClientWidth = 433
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
    Left = 287
    Top = 103
    Width = 127
    Height = 13
    Caption = 'Que esta haciendo a las...'
  end
  object Label2: TLabel
    Left = 8
    Top = 3
    Width = 145
    Height = 13
    Caption = 'Determinar actividad y horario'
  end
  object Actividad: TComboBox
    Left = 8
    Top = 22
    Width = 145
    Height = 21
    ItemIndex = 1
    TabOrder = 0
    Text = 'Atender Cliente'
    Items.Strings = (
      'Almuerzo De Negocios'
      'Atender Cliente'
      'Atender Cliente VIP'
      'Reunion Gerente')
  end
  object Hora: TTimePicker
    Left = 184
    Top = 10
    Width = 137
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 1
    Time = 44354.615610289350000000
    TimeFormat = 'hh:mm'
  end
  object Button1: TButton
    Left = 331
    Top = 8
    Width = 96
    Height = 35
    Caption = 'Agregar actividad'
    TabOrder = 2
    WordWrap = True
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 49
    Width = 257
    Height = 148
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object Button2: TButton
    Left = 271
    Top = 54
    Width = 75
    Height = 42
    Caption = 'Mostrar actividades'
    TabOrder = 4
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 307
    Top = 160
    Width = 75
    Height = 38
    Caption = 'Averiguar'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Averiguar: TTimePicker
    Left = 287
    Top = 122
    Width = 116
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 6
    Time = 44354.642736168980000000
    TimeFormat = 'hh:mm'
  end
  object Button4: TButton
    Left = 352
    Top = 55
    Width = 75
    Height = 42
    Caption = 'Porcentaje de ocupacion'
    TabOrder = 7
    WordWrap = True
    OnClick = Button4Click
  end
end
