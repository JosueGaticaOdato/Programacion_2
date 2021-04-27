object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 1'
  ClientHeight = 237
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 119
    Top = 8
    Width = 289
    Height = 217
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 89
    Height = 25
    Caption = 'Cargar vector'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 55
    Width = 89
    Height = 26
    Caption = 'Mostrar Vector'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 103
    Width = 89
    Height = 25
    Caption = 'Media'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 150
    Width = 89
    Height = 25
    Caption = 'Mediana'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 200
    Width = 89
    Height = 25
    Caption = 'Moda'
    TabOrder = 5
    OnClick = Button5Click
  end
end
