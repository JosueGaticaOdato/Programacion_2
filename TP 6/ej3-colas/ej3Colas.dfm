object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 304
  ClientWidth = 584
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
  object btnCargar: TButton
    Left = 56
    Top = 24
    Width = 161
    Height = 33
    Caption = 'Cargar cola'
    TabOrder = 0
    OnClick = btnCargarClick
  end
  object btnPasarNoRepetidos: TButton
    Left = 56
    Top = 71
    Width = 161
    Height = 33
    Caption = 'Quedarse con los no repetidos'
    TabOrder = 1
    OnClick = btnPasarNoRepetidosClick
  end
  object btnMostrar: TButton
    Left = 56
    Top = 128
    Width = 161
    Height = 33
    Caption = 'Mostrar colas'
    TabOrder = 2
    OnClick = btnMostrarClick
  end
  object Memo1: TMemo
    Left = 272
    Top = 24
    Width = 273
    Height = 225
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
