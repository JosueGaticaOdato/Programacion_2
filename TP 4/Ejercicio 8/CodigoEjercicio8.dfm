object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 8'
  ClientHeight = 262
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Actividad: TComboBox
    Left = 24
    Top = 23
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'Actividad'
    Items.Strings = (
      'Almuerzo_de_negocios'
      'Atender_cliente'
      'Atender_cliente_VIP'
      'Reunion_gerente')
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
    Left = 360
    Top = 16
    Width = 75
    Height = 35
    Caption = 'Agregar actividad'
    TabOrder = 2
    WordWrap = True
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 40
    Top = 72
    Width = 249
    Height = 162
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object Button2: TButton
    Left = 336
    Top = 72
    Width = 75
    Height = 42
    Caption = 'Mostrar actividades'
    TabOrder = 4
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 336
    Top = 128
    Width = 75
    Height = 42
    Caption = 'Button3'
    TabOrder = 5
  end
  object Button4: TButton
    Left = 336
    Top = 192
    Width = 75
    Height = 42
    Caption = 'Button3'
    TabOrder = 6
  end
end
