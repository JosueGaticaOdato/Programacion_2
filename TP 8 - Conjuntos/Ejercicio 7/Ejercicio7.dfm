object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 175
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
    Height = 49
    Caption = 'Cargar aleatorio'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 103
    Top = 8
    Width = 288
    Height = 159
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button4: TButton
    Left = 8
    Top = 118
    Width = 89
    Height = 49
    Caption = 'Union manual'
    TabOrder = 2
    OnClick = Button4Click
  end
  object Button2: TButton
    Left = 8
    Top = 63
    Width = 89
    Height = 49
    Caption = 'Mostrar conjuntos'
    TabOrder = 3
    WordWrap = True
    OnClick = Button2Click
  end
end
