object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 242
  ClientWidth = 831
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
  object btnMostrar: TButton
    Left = 8
    Top = 32
    Width = 137
    Height = 25
    Caption = 'Mostrar Conjuntos'
    TabOrder = 0
    OnClick = btnMostrarClick
  end
  object Memo1: TMemo
    Left = 160
    Top = 16
    Width = 601
    Height = 177
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
    Top = 72
    Width = 137
    Height = 25
    Caption = 'Uni'#243'n de conjuntos'
    TabOrder = 2
    OnClick = btnUnionClick
  end
  object btnInterseccion: TButton
    Left = 8
    Top = 120
    Width = 137
    Height = 25
    Caption = 'Intersecci'#243'n de conjuntos'
    TabOrder = 3
    OnClick = btnInterseccionClick
  end
  object btnCargar: TButton
    Left = 8
    Top = 160
    Width = 137
    Height = 25
    Caption = 'Cargar conjuntos'
    TabOrder = 4
    OnClick = btnCargarClick
  end
end
