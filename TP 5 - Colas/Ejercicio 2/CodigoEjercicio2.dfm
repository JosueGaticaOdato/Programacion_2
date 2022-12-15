object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 236
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
    Width = 97
    Height = 41
    Caption = 'Cargar Colas aleatorias'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 8
    Width = 97
    Height = 41
    Caption = 'Cargar colas iguales'
    TabOrder = 1
    WordWrap = True
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 102
    Width = 217
    Height = 189
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Button3: TButton
    Left = 8
    Top = 55
    Width = 96
    Height = 41
    Caption = 'Mostrar colas'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 128
    Top = 55
    Width = 96
    Height = 41
    Caption = 'Chequear si son iguales'
    TabOrder = 4
    WordWrap = True
    OnClick = Button4Click
  end
end
