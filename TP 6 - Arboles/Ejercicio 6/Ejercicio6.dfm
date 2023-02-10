object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 186
  ClientWidth = 614
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
    Width = 105
    Height = 49
    Caption = 'Cargar arbol'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 63
    Width = 105
    Height = 49
    Caption = 'Mostrar arbol'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 119
    Top = 8
    Width = 491
    Height = 159
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button3: TButton
    Left = 8
    Top = 118
    Width = 105
    Height = 49
    Caption = #191'Es arbol de expresion?'
    TabOrder = 3
    WordWrap = True
    OnClick = Button3Click
  end
end
