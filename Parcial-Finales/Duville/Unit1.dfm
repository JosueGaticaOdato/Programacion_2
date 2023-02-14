object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 336
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 137
    Height = 65
    Caption = 'Cargar lista random'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 160
    Top = 8
    Width = 241
    Height = 295
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 88
    Width = 137
    Height = 65
    Caption = 'Ejercicio arbol'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 163
    Width = 137
    Height = 65
    Caption = 'Ejercicio pila'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 234
    Width = 137
    Height = 69
    Caption = 'Ejercicio 4 (trabajador esencial)'
    TabOrder = 4
    WordWrap = True
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 245
    Top = 309
    Width = 75
    Height = 25
    Caption = 'Mostrar AVL'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 326
    Top = 309
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 160
    Top = 309
    Width = 75
    Height = 25
    Caption = 'Insertar'
    TabOrder = 7
    OnClick = Button7Click
  end
end
