object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 207
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Memo1: TMemo
    Left = 111
    Top = 8
    Width = 473
    Height = 181
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
    Left = 8
    Top = 8
    Width = 97
    Height = 41
    Caption = 'Cargar conjuntos'
    TabOrder = 1
    OnClick = btnCargarClick
  end
  object btnMostrar: TButton
    Left = 8
    Top = 101
    Width = 97
    Height = 41
    Caption = 'Mostrar conjuntos'
    TabOrder = 2
    OnClick = btnMostrarClick
  end
  object btnSubconjunto: TButton
    Left = 8
    Top = 148
    Width = 97
    Height = 41
    Caption = #191'Es subconjunto?'
    TabOrder = 3
    OnClick = btnSubconjuntoClick
  end
  object Button1: TButton
    Left = 8
    Top = 54
    Width = 97
    Height = 41
    Caption = 'Cargar ejemplo'
    TabOrder = 4
    OnClick = Button1Click
  end
end
