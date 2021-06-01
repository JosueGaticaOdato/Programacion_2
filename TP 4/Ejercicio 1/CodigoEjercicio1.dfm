object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 320
  ClientWidth = 627
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
  object Button2: TButton
    Left = 24
    Top = 79
    Width = 89
    Height = 49
    Caption = 'Mostrar (Ultimo al primero)'
    TabOrder = 0
    WordWrap = True
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 89
    Height = 57
    Caption = 'Cargar Lista Aleatoriamente'
    TabOrder = 1
    WordWrap = True
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 24
    Top = 134
    Width = 89
    Height = 35
    Caption = 'Obtener mayor'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 136
    Top = 16
    Width = 433
    Height = 273
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
  end
end
