object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 242
  ClientWidth = 741
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
  object Memo1: TMemo
    Left = 216
    Top = 8
    Width = 473
    Height = 137
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object btnCargar: TButton
    Left = 56
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Cargar conjuntos'
    TabOrder = 1
    OnClick = btnCargarClick
  end
  object btnMostrar: TButton
    Left = 64
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Mostrar conjuntos'
    TabOrder = 2
    OnClick = btnMostrarClick
  end
  object btnSubconjunto: TButton
    Left = 56
    Top = 120
    Width = 75
    Height = 25
    Caption = #191'Es subconjunto?'
    TabOrder = 3
    OnClick = btnSubconjuntoClick
  end
  object radioBtnC1: TRadioButton
    Left = 56
    Top = 184
    Width = 113
    Height = 17
    Caption = 'Conjunto 1'
    TabOrder = 4
  end
  object radioBtnC2: TRadioButton
    Left = 152
    Top = 184
    Width = 113
    Height = 17
    Caption = 'Conjunto 2'
    TabOrder = 5
  end
end
