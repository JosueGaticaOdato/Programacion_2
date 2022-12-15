object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 283
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
    Left = 48
    Top = 8
    Width = 177
    Height = 25
    Caption = 'Cargar pilas aleatorias'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 48
    Top = 39
    Width = 177
    Height = 25
    Caption = 'Cargar pilas iguales'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 48
    Top = 101
    Width = 177
    Height = 25
    Caption = 'Chequear si son iguales'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 48
    Top = 70
    Width = 177
    Height = 25
    Caption = 'Mostrar pilas'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 133
    Width = 267
    Height = 158
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 4
  end
end
