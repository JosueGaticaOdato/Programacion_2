object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = btnCargar
  Caption = 'Form1'
  ClientHeight = 395
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnCargar: TButton
    Left = 24
    Top = 22
    Width = 121
    Height = 25
    Caption = 'Cargar '#225'rbol n-ario'
    TabOrder = 0
    OnClick = btnCargarClick
  end
  object btnRecorrido: TButton
    Left = 24
    Top = 64
    Width = 121
    Height = 25
    Caption = 'Recorrer en anchura'
    TabOrder = 1
  end
  object btnHojas: TButton
    Left = 24
    Top = 104
    Width = 121
    Height = 25
    Caption = 'N'#250'mero de hojas'
    TabOrder = 2
  end
  object btnCargar2: TButton
    Left = 24
    Top = 152
    Width = 121
    Height = 25
    Caption = 'Cargar otro '#225'rbol n-ario'
    TabOrder = 3
  end
  object btnComparar: TButton
    Left = 24
    Top = 192
    Width = 121
    Height = 25
    Caption = 'Comparar '#225'rboles'
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 224
    Top = 24
    Width = 369
    Height = 321
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 5
  end
end
