object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 205
  ClientWidth = 372
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
    Top = 8
    Width = 83
    Height = 41
    Caption = 'Cargar colas aleatorias'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 275
    Top = 8
    Width = 83
    Height = 41
    Caption = #191'Son iguales?'
    TabOrder = 1
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 55
    Width = 350
    Height = 142
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Button2: TButton
    Left = 186
    Top = 8
    Width = 83
    Height = 41
    Caption = 'Mostrar colas'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 97
    Top = 8
    Width = 83
    Height = 41
    Caption = 'Cargar ejemplo'
    TabOrder = 4
    OnClick = Button4Click
  end
end
