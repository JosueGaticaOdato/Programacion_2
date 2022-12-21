object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 1'
  ClientHeight = 267
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Memo1: TMemo
    Left = 144
    Top = 8
    Width = 305
    Height = 243
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Cargar vector'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 70
    Width = 121
    Height = 26
    Caption = 'Mostrar Vector'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 102
    Width = 121
    Height = 25
    Caption = 'Media'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 133
    Width = 121
    Height = 25
    Caption = 'Mediana'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 164
    Width = 121
    Height = 25
    Caption = 'Moda'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 39
    Width = 121
    Height = 25
    Caption = 'Carga ejemplo'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 8
    Top = 195
    Width = 121
    Height = 25
    Caption = 'Minimo'
    TabOrder = 7
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 8
    Top = 226
    Width = 121
    Height = 25
    Caption = 'Maximo'
    TabOrder = 8
    OnClick = Button8Click
  end
end
