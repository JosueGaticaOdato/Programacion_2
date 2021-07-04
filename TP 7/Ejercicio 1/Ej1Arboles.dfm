object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = Memo1
  Caption = 'Form1'
  ClientHeight = 369
  ClientWidth = 637
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
    Left = 24
    Top = 38
    Width = 114
    Height = 33
    Caption = 'Cargar '#225'rbol'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnCargarClick
  end
  object btnMostrar: TButton
    Left = 24
    Top = 96
    Width = 114
    Height = 33
    Caption = 'Mostrar '#225'rbol'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnMostrarClick
  end
  object Memo1: TMemo
    Left = 160
    Top = 40
    Width = 432
    Height = 297
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object btnHojas: TButton
    Left = 24
    Top = 152
    Width = 114
    Height = 33
    Caption = 'Mostrar hojas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnHojasClick
  end
  object btnInteriores: TButton
    Left = 17
    Top = 210
    Width = 140
    Height = 33
    Caption = 'Mostrar nodos interiores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnInterioresClick
  end
  object btnNivel: TButton
    Left = 25
    Top = 260
    Width = 115
    Height = 33
    Caption = 'Nivel de las hojas'
    TabOrder = 5
    OnClick = btnNivelClick
  end
end
