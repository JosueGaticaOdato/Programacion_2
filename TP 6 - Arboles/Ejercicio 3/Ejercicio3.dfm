object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 255
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 105
    Height = 33
    Caption = 'Cargar arbol N-Ario'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Button4: TButton
    Left = 8
    Top = 85
    Width = 105
    Height = 33
    Caption = 'Numero de hojas'
    TabOrder = 1
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 124
    Width = 105
    Height = 37
    Caption = 'Cargar arbol 2'
    TabOrder = 2
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 208
    Width = 105
    Height = 39
    Caption = 'Determinar si tienen misma estructura'
    TabOrder = 3
    WordWrap = True
    OnClick = Button6Click
  end
  object Memo1: TMemo
    Left = 128
    Top = 8
    Width = 311
    Height = 239
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object Button3: TButton
    Left = 8
    Top = 47
    Width = 105
    Height = 33
    Caption = 'Recorrido en anchura'
    TabOrder = 5
    WordWrap = True
    OnClick = Button3Click
  end
  object Button2: TButton
    Left = 8
    Top = 167
    Width = 105
    Height = 35
    Caption = 'Recorrido en anchura arbol 2'
    TabOrder = 6
    WordWrap = True
    OnClick = Button2Click
  end
end
