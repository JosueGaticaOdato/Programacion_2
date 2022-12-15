object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 11'
  ClientHeight = 148
  ClientWidth = 379
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Ingrese dia 1:'
  end
  object Label2: TLabel
    Left = 8
    Top = 58
    Width = 67
    Height = 13
    Caption = 'Ingrese dia 2:'
  end
  object d1: TEdit
    Left = 8
    Top = 27
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object d2: TEdit
    Left = 8
    Top = 77
    Width = 129
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 32
    Top = 115
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 152
    Top = 8
    Width = 219
    Height = 132
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
  end
end
