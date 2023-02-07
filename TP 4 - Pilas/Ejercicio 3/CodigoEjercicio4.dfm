object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 177
    Height = 25
    Caption = 'Cargar pila aleatoria'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button4: TButton
    Left = 8
    Top = 39
    Width = 177
    Height = 25
    Caption = 'Mostrar pila'
    TabOrder = 1
    OnClick = Button4Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 104
    Width = 181
    Height = 187
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 70
    Width = 177
    Height = 25
    Caption = 'Invertir'
    TabOrder = 3
    OnClick = Button2Click
  end
end
