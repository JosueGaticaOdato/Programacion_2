object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 282
  ClientWidth = 501
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
  object Button3: TButton
    Left = 8
    Top = 47
    Width = 105
    Height = 33
    Caption = 'Recorrido en anchura'
    TabOrder = 1
    WordWrap = True
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 119
    Top = 8
    Width = 374
    Height = 268
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 86
    Width = 105
    Height = 33
    Caption = 'Altura'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 8
    Top = 165
    Width = 105
    Height = 33
    Caption = 'Nivel del nodo'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 138
    Width = 105
    Height = 21
    TabOrder = 5
    Text = 'Nodo'
  end
  object Button5: TButton
    Left = 8
    Top = 204
    Width = 105
    Height = 33
    Caption = 'Nodo Interno'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 243
    Width = 105
    Height = 33
    Caption = #191'Hojas al mismo nivel?'
    TabOrder = 7
    WordWrap = True
    OnClick = Button6Click
  end
end
