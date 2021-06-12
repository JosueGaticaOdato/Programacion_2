object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 90
    Height = 33
    Caption = 'Cargar Pila Aleatoria'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 200
    Top = 8
    Width = 237
    Height = 256
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button2: TButton
    Left = 56
    Top = 74
    Width = 90
    Height = 34
    Caption = 'Buscar Clave'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 104
    Top = 7
    Width = 90
    Height = 34
    Caption = 'Mostrar contenido'
    TabOrder = 3
    WordWrap = True
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 47
    Width = 186
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object Button4: TButton
    Left = 56
    Top = 114
    Width = 90
    Height = 34
    Caption = 'Colocar en el fondo'
    TabOrder = 5
    WordWrap = True
    OnClick = Button4Click
  end
end
