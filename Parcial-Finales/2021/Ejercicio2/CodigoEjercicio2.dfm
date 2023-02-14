object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 231
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 40
    Width = 105
    Height = 63
    Caption = 'Cargar arbol'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 8
    Top = 128
    Width = 105
    Height = 63
    Caption = 'Ejecutar funcion'
    TabOrder = 1
    WordWrap = True
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 128
    Top = 14
    Width = 417
    Height = 209
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
end
