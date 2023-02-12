object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 174
  ClientWidth = 399
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
    Width = 89
    Height = 33
    Caption = 'Cargar aleatorio'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 47
    Width = 89
    Height = 33
    Caption = 'Cargar ejemplo'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 86
    Width = 89
    Height = 33
    Caption = 'Mostra conjuntos'
    TabOrder = 2
    WordWrap = True
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 103
    Top = 8
    Width = 282
    Height = 150
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object Button4: TButton
    Left = 8
    Top = 125
    Width = 89
    Height = 33
    Caption = #191'Son iguales?'
    TabOrder = 4
    OnClick = Button4Click
  end
end
