object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 7'
  ClientHeight = 389
  ClientWidth = 214
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
    Left = 56
    Top = 0
    Width = 101
    Height = 24
    Caption = 'Carga cola:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 30
    Width = 25
    Height = 13
    Caption = 'Cola:'
  end
  object Label3: TLabel
    Left = 120
    Top = 30
    Width = 38
    Height = 13
    Caption = 'Tiempo:'
  end
  object Label4: TLabel
    Left = 14
    Top = 110
    Width = 192
    Height = 13
    Caption = 'Tiempo en el que atendera el empleado:'
  end
  object Numero_Cola: TComboBox
    Left = 32
    Top = 49
    Width = 57
    Height = 21
    ItemIndex = 2
    TabOrder = 0
    Text = '3'
    Items.Strings = (
      '1'
      '2'
      '3')
  end
  object Tiempo_Cliente: TComboBox
    Left = 120
    Top = 49
    Width = 57
    Height = 21
    ItemIndex = 0
    TabOrder = 1
    Text = '10'
    Items.Strings = (
      '10'
      '20'
      '30'
      '40'
      '50'
      '60')
  end
  object Tiempo_Empleado: TComboBox
    Left = 56
    Top = 129
    Width = 102
    Height = 21
    ItemIndex = 0
    TabOrder = 2
    Text = '10'
    Items.Strings = (
      '10'
      '20'
      '30'
      '40'
      '50'
      '60')
  end
  object Memo1: TMemo
    Left = 8
    Top = 187
    Width = 198
    Height = 194
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object Button1: TButton
    Left = 14
    Top = 76
    Width = 75
    Height = 25
    Caption = 'Cargar cola'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 64
    Top = 156
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 120
    Top = 76
    Width = 75
    Height = 25
    Caption = 'Mostrar colas'
    TabOrder = 6
    OnClick = Button3Click
  end
end
