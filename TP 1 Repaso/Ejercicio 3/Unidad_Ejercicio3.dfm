object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 3'
  ClientHeight = 422
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Memo1: TMemo
    Left = 167
    Top = 16
    Width = 530
    Height = 385
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 32
    Width = 153
    Height = 25
    Caption = 'Generar TXT'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 72
    Width = 153
    Height = 25
    Caption = 'Crear 10 lineas'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 111
    Width = 153
    Height = 25
    Caption = 'Mostrar contenido'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 142
    Width = 153
    Height = 25
    Caption = 'Split o Parsing'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 173
    Width = 153
    Height = 25
    Caption = 'Contenido en minuscula'
    TabOrder = 5
    OnClick = Button5Click
  end
end
