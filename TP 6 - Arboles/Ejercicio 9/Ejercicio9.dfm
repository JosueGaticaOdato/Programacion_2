object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 176
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 0
    Top = 8
    Width = 121
    Height = 49
    Caption = 'Cargar Arbol binario'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 0
    Top = 63
    Width = 121
    Height = 49
    Caption = 'Mostrar arbol binario'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 0
    Top = 118
    Width = 121
    Height = 49
    Caption = 'Transformar en AVL'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 127
    Top = 8
    Width = 367
    Height = 159
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
