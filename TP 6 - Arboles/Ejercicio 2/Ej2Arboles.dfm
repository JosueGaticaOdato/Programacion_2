object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = btnCargar
  Caption = 'Form1'
  ClientHeight = 450
  ClientWidth = 623
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
    Left = 30
    Top = 8
    Width = 139
    Height = 33
    Caption = 'Cargar Arbol'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnCargarClick
  end
  object Memo1: TMemo
    Left = 192
    Top = 16
    Width = 393
    Height = 337
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object btnMostrar: TButton
    Left = 30
    Top = 64
    Width = 139
    Height = 33
    Caption = 'Mostrar Arbol'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnMostrarClick
  end
  object btnPadre: TButton
    Left = 30
    Top = 128
    Width = 139
    Height = 33
    Caption = 'Indicar padre'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnPadreClick
  end
  object btnHijos: TButton
    Left = 30
    Top = 184
    Width = 139
    Height = 33
    Caption = 'Indicar Hijos'
    TabOrder = 4
    OnClick = btnHijosClick
  end
  object btnHermanos: TButton
    Left = 30
    Top = 240
    Width = 139
    Height = 33
    Caption = 'Indicar Hermanos'
    TabOrder = 5
    OnClick = btnHermanosClick
  end
  object btnNivel: TButton
    Left = 30
    Top = 289
    Width = 139
    Height = 33
    Caption = 'Indicar Nivel'
    TabOrder = 6
    OnClick = btnNivelClick
  end
  object btnAltura: TButton
    Left = 30
    Top = 344
    Width = 139
    Height = 33
    Caption = 'Indicar Altura'
    TabOrder = 7
  end
  object btnNodosNivel: TButton
    Left = 30
    Top = 400
    Width = 139
    Height = 33
    Caption = 'Nodos con el mismo nivel'
    TabOrder = 8
  end
end
