object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 343
  ClientWidth = 197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Button2: TButton
    Left = 8
    Top = 101
    Width = 177
    Height = 25
    Caption = #191'Es palindromo?'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 8
    Top = 69
    Width = 177
    Height = 25
    Caption = 'Mostrar pila'
    TabOrder = 1
    OnClick = Button4Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 132
    Width = 177
    Height = 203
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Palabra: TEdit
    Left = 8
    Top = 11
    Width = 177
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 8
    Top = 38
    Width = 177
    Height = 25
    Caption = 'Cargar palabra'
    TabOrder = 4
    OnClick = Button1Click
  end
end
