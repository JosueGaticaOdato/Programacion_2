object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 338
  ClientWidth = 621
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
    Height = 49
    Caption = 'Cargar listas random'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 160
    Top = 8
    Width = 441
    Height = 313
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 63
    Width = 137
    Height = 58
    Caption = 'Mostrar contenido de las listas'
    TabOrder = 2
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 127
    Width = 137
    Height = 58
    Caption = 'Cargar listas iguales'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 263
    Width = 137
    Height = 58
    Caption = 'Comparar'
    TabOrder = 4
    OnClick = Button4Click
  end
end
