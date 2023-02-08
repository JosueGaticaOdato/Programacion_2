object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 105
    Height = 33
    Caption = 'Cargar pila y cola aleatoria'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 8
    Width = 105
    Height = 33
    Caption = 'Cargar pila y cola ejemplo'
    TabOrder = 1
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 248
    Top = 8
    Width = 105
    Height = 33
    Caption = 'Mostrar contenido'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 368
    Top = 8
    Width = 105
    Height = 33
    Caption = 'Cargar en lista valores comunes'
    TabOrder = 3
    WordWrap = True
    OnClick = Button4Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 47
    Width = 465
    Height = 234
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 4
  end
end
