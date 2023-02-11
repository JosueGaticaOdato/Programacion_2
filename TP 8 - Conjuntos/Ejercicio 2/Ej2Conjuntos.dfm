object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 213
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object btnMostrar: TButton
    Left = 8
    Top = 18
    Width = 137
    Height = 40
    Caption = 'Mostrar Conjuntos'
    TabOrder = 0
    OnClick = btnMostrarClick
  end
  object Memo1: TMemo
    Left = 163
    Top = 14
    Width = 353
    Height = 183
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object btnUnion: TButton
    Left = 8
    Top = 64
    Width = 137
    Height = 41
    Caption = 'Uni'#243'n de conjuntos'
    TabOrder = 2
    OnClick = btnUnionClick
  end
  object btnInterseccion: TButton
    Left = 8
    Top = 111
    Width = 137
    Height = 41
    Caption = 'Intersecci'#243'n de conjuntos'
    TabOrder = 3
    OnClick = btnInterseccionClick
  end
  object btnCargar: TButton
    Left = 8
    Top = 156
    Width = 137
    Height = 41
    Caption = 'Cargar conjuntos'
    TabOrder = 4
    OnClick = btnCargarClick
  end
end
