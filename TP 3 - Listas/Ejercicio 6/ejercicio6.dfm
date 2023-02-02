object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 242
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 22
    Width = 209
    Height = 25
    Caption = 'Cargar lista'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 113
    Width = 209
    Height = 25
    Caption = 'Ordenar lista con burbujeo (decreciente)'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 256
    Top = 24
    Width = 249
    Height = 201
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Button3: TButton
    Left = 24
    Top = 64
    Width = 209
    Height = 27
    Caption = 'Mostrar lista'
    TabOrder = 3
    OnClick = Button3Click
  end
end
