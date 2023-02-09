object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = Memo1
  Caption = 'Form1'
  ClientHeight = 348
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object btnCargar: TButton
    Left = 8
    Top = 8
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
    Left = 8
    Top = 66
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
    Left = 145
    Top = 8
    Width = 417
    Height = 329
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
    Left = 8
    Top = 122
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
    Left = 9
    Top = 180
    Width = 115
    Height = 33
    Caption = 'Mostrar nodos interiores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    WordWrap = True
    OnClick = btnInterioresClick
  end
  object btnNivel: TButton
    Left = 9
    Top = 230
    Width = 115
    Height = 33
    Caption = #191'Nivel de las hojas igual?'
    TabOrder = 5
    WordWrap = True
    OnClick = btnNivelClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 277
    Width = 114
    Height = 21
    TabOrder = 6
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 8
    Top = 304
    Width = 114
    Height = 33
    Caption = 'Buscar ocurrencias'
    TabOrder = 7
    OnClick = Button1Click
  end
end
