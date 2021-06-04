object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 589
  ClientWidth = 836
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
    Left = 256
    Top = 48
    Width = 521
    Height = 489
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnMostrar: TButton
    Left = 56
    Top = 64
    Width = 145
    Height = 41
    Caption = 'Mostrar lista'
    TabOrder = 1
    OnClick = btnMostrarClick
  end
  object btnMayor: TButton
    Left = 64
    Top = 128
    Width = 137
    Height = 33
    Caption = 'Mayor de los datos'
    TabOrder = 2
    OnClick = btnMayorClick
  end
end
