object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 124
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 135
    Top = 7
    Width = 256
    Height = 109
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Crear colo al azar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 48
    Width = 121
    Height = 25
    Caption = 'Mostrar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 88
    Width = 121
    Height = 25
    Caption = 'Ejecutar funcion'
    TabOrder = 3
    OnClick = Button3Click
  end
end
