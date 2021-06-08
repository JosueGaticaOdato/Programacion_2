object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 8'
  ClientHeight = 222
  ClientWidth = 451
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
    Left = 303
    Top = 111
    Width = 127
    Height = 13
    Caption = 'Que esta haciendo a las...'
  end
  object Label2: TLabel
    Left = 24
    Top = 11
    Width = 145
    Height = 13
    Caption = 'Determinar actividad y horario'
  end
  object Actividad: TComboBox
    Left = 24
    Top = 30
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'Actividad'
    Items.Strings = (
      'Almuerzo de negocios'
      'Atender cliente'
      'Atender cliente VIP'
      'Reunion gerente')
  end
  object Hora: TTimePicker
    Left = 200
    Top = 18
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
    Left = 368
    Top = 21
    Width = 75
    Height = 35
    Caption = 'Agregar actividad'
    TabOrder = 2
    WordWrap = True
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 62
    Width = 249
    Height = 148
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object Button2: TButton
    Left = 287
    Top = 62
    Width = 75
    Height = 42
    Caption = 'Mostrar actividades'
    TabOrder = 4
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 323
    Top = 168
    Width = 75
    Height = 42
    Caption = 'Averiguar'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Averiguar: TTimePicker
    Left = 303
    Top = 130
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
    Left = 368
    Top = 63
    Width = 75
    Height = 42
    Caption = 'Porcentaje de ocupacion'
    TabOrder = 7
    WordWrap = True
    OnClick = Button4Click
  end
end
