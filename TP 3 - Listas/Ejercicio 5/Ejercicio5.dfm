object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 208
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Memo1: TMemo
    Left = 8
    Top = 63
    Width = 303
    Height = 146
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 97
    Height = 49
    Caption = 'Cargar lista aleatoria'
    TabOrder = 1
    WordWrap = True
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 111
    Top = 8
    Width = 97
    Height = 49
    Caption = 'Mostrar lista'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 214
    Top = 8
    Width = 97
    Height = 49
    Caption = 'Aplicar burbujeo'
    TabOrder = 3
  end
end
